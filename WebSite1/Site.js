
  // Navigation now handled by separate ASPX pages
  function showPage(id, btn) {
    var pageMap = {
      'home': 'Default.aspx', 'vars': 'Vars.aspx', 'print': 'Print.aspx',
      'for': 'For.aspx', 'conditions': 'Conditions.aspx', 'switch': 'Switch.aspx',
      'functions': 'Functions.aspx', 'arrays': 'Arrays.aspx', 'oop': 'OOP.aspx',
      'refs': 'Refs.aspx'
    };
    if (pageMap[id]) window.location.href = pageMap[id];
  }

  function showTopic(pagePrefix, topicId, btn) {
    // Scope to the content-wrap of this page only
    const wrap = btn ? btn.closest('.content-wrap') : document;
    wrap.querySelectorAll('.topic-section').forEach(s => s.classList.remove('active'));
    const target = document.getElementById(pagePrefix + '-' + topicId);
    if (target) target.classList.add('active');
    if (btn) {
      btn.closest('.topic-nav').querySelectorAll('.topic-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
    }
  }

  function switchContactTab(tab, btn) {
    document.querySelectorAll('.contact-tab').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    document.querySelectorAll('.contact-form-panel').forEach(p => p.classList.remove('active'));
    document.getElementById('panel-' + tab).classList.add('active');
  }

  async function sendSuggestion() {
    const text = document.getElementById('suggestion-text').value.trim();
    if (!text) { alert('الرجاء كتابة اقتراحك أولاً'); return; }
    const btn = document.getElementById('suggestion-btn');
    btn.disabled = true;
    btn.textContent = '⏳ جارٍ الإرسال...';
    try {
      const res = await fetch('https://formspree.io/f/mqejklrl', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
        body: JSON.stringify({ type: 'اقتراح', message: text })
      });
      if (res.ok) {
        document.getElementById('suggestion-form-area').style.display = 'none';
        document.getElementById('suggestion-success').style.display = 'block';
      } else {
        btn.disabled = false;
        btn.textContent = '📤 إرسال الاقتراح';
        alert('حدث خطأ، حاول مرة ثانية');
      }
    } catch(e) {
      btn.disabled = false;
      btn.textContent = '📤 إرسال الاقتراح';
      alert('حدث خطأ في الاتصال');
    }
  }

  async function sendInquiry() {
    const email = document.getElementById('inquiry-email').value.trim();
    const text = document.getElementById('inquiry-text').value.trim();
    if (!email || !text) { alert('الرجاء تعبئة الإيميل والاستفسار'); return; }
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { alert('الرجاء إدخال إيميل صحيح'); return; }
    const btn = document.getElementById('inquiry-btn');
    btn.disabled = true;
    btn.textContent = '⏳ جارٍ الإرسال...';
    try {
      const res = await fetch('https://formspree.io/f/mqejklrl', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
        body: JSON.stringify({ type: 'استفسار', email: email, message: text })
      });
      if (res.ok) {
        document.getElementById('inquiry-form-area').style.display = 'none';
        document.getElementById('inquiry-success').style.display = 'block';
      } else {
        btn.disabled = false;
        btn.textContent = '📤 إرسال الاستفسار';
        alert('حدث خطأ، حاول مرة ثانية');
      }
    } catch(e) {
      btn.disabled = false;
      btn.textContent = '📤 إرسال الاستفسار';
      alert('حدث خطأ في الاتصال');
    }
  }

  // ════════════════════════════════════════════════════════════════
  //  INTERACTIVE QUIZ ENGINE — Hardened, Strict, Anti-Tamper
  //  - Wrapped in IIFE: internals unreachable from console
  //  - Object.defineProperty: checkCode / insertHint non-overridable
  //  - MutationObserver: detects manual DOM edits to .quiz-result
  //  - Input listener: invalidates result when code is edited after pass
  //  - Strict per-language, per-topic validators (matches JSON spec)
  // ════════════════════════════════════════════════════════════════
  (() => {
    'use strict';

    // ─── Regex toolkit ────────────────────────────────────────────
    const ARABIC = /[\u0600-\u06FF]/;
    const ID     = /^[a-zA-Z_]\w*$/;
    const INT    = /^-?\d+$/;
    const LONG_L = /^-?\d+[Ll]$/;
    const DEC    = /^-?\d+\.\d+$/;
    const FLOAT_F= /^-?\d+(?:\.\d+)?[fF]$/;
    const DEC_M  = /^-?\d+(?:\.\d+)?[mM]$/;
    const DQ_STR = /^"(?:[^"\\]|\\.)*"$/;
    const SQ_STR = /^'(?:[^'\\]|\\.)*'$/;
    const BT_STR = /^`(?:[^`\\]|\\.)*`$/;
    const CHAR_L = /^'(?:[^'\\]|\\.)'$/;

    // String-aware helpers
    // Strip strings (preserve outer quotes, replace interior with non-letter '~'); returns null if unbalanced.
    function stripStrings(s) {
      let out = '', i = 0, n = s.length;
      while (i < n) {
        const ch = s[i];
        if (ch === '"' || ch === "'" || ch === '`') {
          const q = ch; out += q; i++;
          let closed = false;
          while (i < n) {
            if (s[i] === '\\' && i + 1 < n) { out += '~~'; i += 2; continue; }
            if (s[i] === q) { out += q; i++; closed = true; break; }
            out += '~'; i++;
          }
          if (!closed) return null;
        } else { out += ch; i++; }
      }
      return out;
    }
    function unclosedString(s)         { return stripStrings(s) === null; }
    function hasArabicOutsideStrings(s){ const t = stripStrings(s); return t !== null && ARABIC.test(t); }
    function hasArabic(s)              { return ARABIC.test(s); }
    function balancedParens(s) {
      const t = stripStrings(s); if (t === null) return false;
      let d = 0; for (const c of t) { if (c === '(') d++; else if (c === ')') { d--; if (d < 0) return false; } }
      return d === 0;
    }
    function balancedBraces(s) {
      const t = stripStrings(s); if (t === null) return false;
      let d = 0; for (const c of t) { if (c === '{') d++; else if (c === '}') { d--; if (d < 0) return false; } }
      return d === 0;
    }
    // Get the substring inside the FIRST balanced parens after the keyword/expression starting at `pos`.
    function firstParens(s, fromIdx) {
      const t = stripStrings(s); if (t === null) return null;
      const i = t.indexOf('(', fromIdx); if (i < 0) return null;
      let d = 1, j = i + 1;
      while (j < t.length) {
        if (t[j] === '(') d++;
        else if (t[j] === ')') { d--; if (d === 0) return s.slice(i + 1, j); }
        j++;
      }
      return null;
    }

    // ─── Condition / update strength checks ────────────────────────
    // A real condition must have: comparison op, logical op, fn call, !, or boolean literal.
    // A bare identifier (e.g., `i`) is NOT acceptable pedagogically.
    function conditionLooksReal(inner) {
      if (inner == null) return false;
      const t = (stripStrings(inner) || inner).trim();
      if (!t) return false;
      // Comparison operators (==, !=, <=, >=, <, >, ===, !==)
      if (/===|!==|==|!=|<=|>=|<|>/.test(t)) return true;
      // Logical operators (C-style)
      if (/&&|\|\|/.test(t)) return true;
      // Negation operator !
      if (/(^|[^\w!=<>])!\s*[\w(\[$]/.test(t)) return true;
      // Python/Kotlin/PHP keywords: not / and / or / in / is
      if (/(^|[^\w])(?:not|and|or|in|is|xor)([^\w]|$)/.test(t)) return true;
      // Function/method call: identifier followed by (
      if (/\w\s*\(/.test(t)) return true;
      // Boolean literal (alone is OK: while(true))
      if (/^\s*(?:true|false|True|False|TRUE|FALSE)\s*$/.test(t)) return true;
      // Bitwise operations as condition (rare but valid: while (x & MASK))
      if (/[&|^]/.test(t.replace(/&&|\|\|/g, ''))) return true;
      return false;
    }

    function updateLooksReal(upd) {
      if (upd == null) return false;
      const t = (stripStrings(upd) || upd).trim();
      if (!t) return false;
      // ++ or --
      if (/\+\+|--/.test(t)) return true;
      // Compound assignment: += -= *= /= %= <<= >>= &= |= ^=
      if (/[+\-*/%]=|<<=|>>=|&=|\|=|\^=/.test(t)) return true;
      // Plain assignment (not part of ==, !=, <=, >=)
      // Match `=` that is NOT preceded by [=!<>] AND NOT followed by `=`
      if (/(^|[^=!<>])=([^=]|$)/.test(t)) return true;
      // Function call (might mutate via side-effect)
      if (/\w\s*\(/.test(t)) return true;
      return false;
    }

    // ─── Array literal element check ───────────────────────────────
    // Given content between {…} or [...] or arrayOf(...), validate each
    // comma-separated element is well-formed (no missing-comma bugs).
    // Returns null if OK, or a string describing the bad element.
    function arrayElementsCheck(content) {
      if (content == null) return null;
      const raw = content.trim();
      if (!raw) return null; // empty {} or [] is fine
      const stripped = stripStrings(raw);
      if (stripped === null) return 'علامة تنصيص غير مغلقة في عنصر';
      // Split by TOP-LEVEL commas (not inside nested brackets)
      const parts = [];
      let depth = 0, start = 0;
      for (let i = 0; i < stripped.length; i++) {
        const ch = stripped[i];
        if (ch === '(' || ch === '[' || ch === '{' || ch === '<') depth++;
        else if (ch === ')' || ch === ']' || ch === '}' || ch === '>') { if (depth > 0) depth--; }
        else if (ch === ',' && depth === 0) {
          parts.push({ s: stripped.slice(start, i), orig: raw.slice(start, i) });
          start = i + 1;
        }
      }
      parts.push({ s: stripped.slice(start), orig: raw.slice(start) });

      for (const { s, orig } of parts) {
        const t = s.trim();
        const o = orig.trim();
        if (!t) return 'يوجد عنصر فارغ — لا تضع فاصلة بدون قيمة';
        // Check for adjacent tokens INSIDE this element (means missing comma)
        if (/\d\s+\d/.test(t))                 return `<code>${o}</code> — ناقصة فاصلة بين الأرقام`;
        if (/\d\s+["'~]/.test(t))              return `<code>${o}</code> — ناقصة فاصلة بين الرقم والنص`;
        if (/["'~]\s+\d/.test(t))              return `<code>${o}</code> — ناقصة فاصلة بين النص والرقم`;
        if (/"~*"\s+["'~]/.test(t))            return `<code>${o}</code> — ناقصة فاصلة بين نصّين`;
        if (/'~*'\s+["'~]/.test(t))            return `<code>${o}</code> — ناقصة فاصلة بين نصّين`;
        if (/\d\s+[a-zA-Z_$]/.test(t))         return `<code>${o}</code> — ناقصة فاصلة بين الرقم والمتغير`;
        if (/[a-zA-Z_$]\w*\s+\d/.test(t)) {
          // allow "new SomeType 5" — but that's still weird; allow modifier+digit?
          if (!/^(?:new|static|final|const|public|private|protected|return)\s/.test(t)) return `<code>${o}</code> — ناقصة فاصلة بين المتغير والرقم`;
        }
        if (/"~*"\s+[a-zA-Z_$]/.test(t))       return `<code>${o}</code> — ناقصة فاصلة بين النص والمتغير`;
        if (/[a-zA-Z_$]\w*\s+["'~]/.test(t)) {
          if (!/^(?:return|new|throw|case|typeof|delete|instanceof|yield|await|else)\s/.test(t)) return `<code>${o}</code> — ناقصة فاصلة بين المتغير والنص`;
        }
      }
      return null;
    }

    // Helper to get content inside the FIRST balanced […] or {…} brackets
    function bracketContent(s, openCh, closeCh) {
      const t = stripStrings(s);
      if (t === null) return null;
      const startIdx = t.indexOf(openCh);
      if (startIdx < 0) return null;
      let d = 1, j = startIdx + 1;
      while (j < t.length) {
        if (t[j] === openCh) d++;
        else if (t[j] === closeCh) { d--; if (d === 0) return s.slice(startIdx + 1, j); }
        j++;
      }
      return null;
    }

    // ─── Class-body "missing semicolon" detector ───────────────────
    // Detects when two declarations are smashed together without a `;`
    // e.g.  class C { string a  int b; }  →  "string a  int b" has two types.
    function smashedDeclarations(stmt, typeAlternation) {
      // Strip content inside (), [], <>, {}
      let depth = 0, cleaned = '';
      const t = stripStrings(stmt) || stmt;
      for (const ch of t) {
        if (ch === '(' || ch === '[' || ch === '<' || ch === '{') depth++;
        else if (ch === ')' || ch === ']' || ch === '>' || ch === '}') { if (depth > 0) depth--; }
        else if (depth === 0) cleaned += ch;
      }
      const re = new RegExp('\\b(' + typeAlternation + ')\\b', 'g');
      const matches = cleaned.match(re) || [];
      return matches.length >= 2;
    }

    // Python: bare callable references that REQUIRE a () call to actually iterate
    const PY_BARE_CALLABLES = new Set(['range', 'enumerate', 'zip', 'reversed', 'sorted', 'filter', 'map', 'iter', 'open', 'reversed', 'dict', 'list', 'tuple', 'set']);

    // ─── Result builders ──────────────────────────────────────────
    const ok   = (msg) => ({ kind: 'ok',   msg });
    const er   = (msg) => ({ kind: 'err',  msg });
    const wn   = (msg) => ({ kind: 'warn', msg });

    // ─── Lang-cross-pollination quick rejects ─────────────────────
    function rejectWrongLang(c, lang) {
      // Returns an err if the code clearly belongs to another language
      const t = stripStrings(c) || c;
      const checks = {
        java:   [/^\$\w/,      '❌ <code>$</code> في البداية للـ PHP — Java ما تستخدمها.',
                 /^def\s/,     '❌ <code>def</code> للـ Python — في Java حدّد النوع.',
                 /^fun\s/,     '❌ <code>fun</code> للـ Kotlin — في Java حدّد النوع.',
                 /^(let|const)\s/, '❌ <code>let/const</code> للـ JavaScript — في Java استخدم النوع: <code>int</code>، <code>String</code>...',
                 /^val\s/,     '❌ <code>val</code> للـ Kotlin — في Java حدّد النوع مباشرة.',
                 /^function\s/, '❌ <code>function</code> للـ JavaScript/PHP — في Java اكتب: <code>public/void/int methodName(...)</code>.',
                 /^echo\s/,    '❌ <code>echo</code> للـ PHP — في Java: <code>System.out.println(...)</code>.',
                 /^println\s*\(/, '❌ <code>println</code> للـ Kotlin — في Java: <code>System.out.println(...)</code>.',
                 /^console\./, '❌ <code>console.log</code> للـ JavaScript — في Java: <code>System.out.println(...)</code>.'],
        python: [/^\$\w/,      '❌ <code>$</code> للـ PHP — في Python اكتب مباشرة: <code>name = "علي"</code>.',
                 /^(let|const|var)\s+\w+\s*=/, '❌ <code>let/const/var</code> للـ JavaScript — في Python: <code>x = 5</code>.',
                 /^val\s|^fun\s/, '❌ <code>val/fun</code> للـ Kotlin — في Python: <code>x = 5</code> أو <code>def f():</code>.',
                 /^(int|double|float|String|boolean)\s+\w+\s*=/, '❌ Python ما تحتاج تحديد النوع — اكتب: <code>x = 5</code> أو Type Hint: <code>x: int = 5</code>.',
                 /^System\.out/, '❌ <code>System.out</code> للـ Java — في Python: <code>print(...)</code>.',
                 /^echo\s/,    '❌ <code>echo</code> للـ PHP — في Python: <code>print(...)</code>.'],
        js:     [/^\$\w/,      '❌ <code>$</code> في البداية للـ PHP — في JS: <code>let x = ...;</code>',
                 /^def\s/,     '❌ <code>def</code> للـ Python — في JS: <code>function f() { }</code>.',
                 /^fun\s/,     '❌ <code>fun</code> للـ Kotlin — في JS: <code>function f() { }</code>.',
                 /^(int|double|float|String|boolean|char)\s+\w+\s*=/, '❌ هذا أسلوب Java — في JavaScript: <code>let</code> أو <code>const</code>.',
                 /^val\s/,     '❌ <code>val</code> للـ Kotlin — في JS: <code>const x = ...;</code>',
                 /^System\.out/, '❌ <code>System.out</code> للـ Java — في JS: <code>console.log(...)</code>.',
                 /^echo\s/,    '❌ <code>echo</code> للـ PHP — في JS: <code>console.log(...)</code>.',
                 /^print\s*\(/, '❌ <code>print()</code> للـ Python — في JS: <code>console.log(...)</code>.'],
        cpp:    [/^\$\w/,      '❌ <code>$</code> للـ PHP — في C++ حدّد النوع.',
                 /^(let|const\s+(?!(?:int|long|double|float|char|bool|auto|std|string|unsigned)))\s/, '❌ <code>let</code> للـ JavaScript — في C++ حدّد النوع.',
                 /^def\s/,     '❌ <code>def</code> للـ Python — في C++ حدّد النوع.',
                 /^val\s|^fun\s/, '❌ هذا Kotlin — في C++ حدّد النوع.',
                 /^System\.out/, '❌ <code>System.out</code> للـ Java — في C++: <code>cout << ...;</code>',
                 /^echo\s/,    '❌ <code>echo</code> للـ PHP — في C++: <code>cout << ...;</code>',
                 /^print\s*\(/, '❌ <code>print()</code> للـ Python — في C++: <code>cout << ...;</code>',
                 /^console\./, '❌ <code>console.log</code> للـ JavaScript — في C++: <code>cout << ...;</code>'],
        csharp: [/^\$"/,       null, // C# interpolated string starts with $" — allow
                 /^\$\w/,      '❌ <code>$</code> في البداية للـ PHP — في C# حدّد النوع.',
                 /^(let)\s/,   '❌ <code>let</code> للـ JavaScript — في C# استخدم <code>var</code> أو النوع.',
                 /^def\s|^fun\s/, '❌ هذه الكلمة للغة أخرى — في C# حدّد النوع.',
                 /^echo\s/,    '❌ <code>echo</code> للـ PHP — في C#: <code>Console.WriteLine(...)</code>.',
                 /^System\.out/, '❌ <code>System.out</code> للـ Java — في C#: <code>Console.WriteLine(...)</code>.',
                 /^console\.log/, '❌ <code>console.log</code> للـ JavaScript — في C#: <code>Console.WriteLine(...)</code> (C كبيرة).',
                 /^println\s*\(/, '❌ <code>println</code> للـ Kotlin — في C#: <code>Console.WriteLine(...)</code>.'],
        kotlin: [/^\$\w/,      '❌ <code>$</code> في البداية للـ PHP — في Kotlin: <code>val/var</code>.',
                 /^(let|const)\s/, '❌ <code>let/const</code> للـ JavaScript — في Kotlin: <code>val</code> أو <code>var</code>.',
                 /^def\s/,     '❌ <code>def</code> للـ Python — في Kotlin: <code>fun</code>.',
                 /^function\s/, '❌ <code>function</code> للـ JavaScript/PHP — في Kotlin: <code>fun</code>.',
                 /^(int|double|float|String|boolean|char)\s+\w+\s*=/, '❌ هذا Java — في Kotlin: <code>val x: Int = 5</code> أو <code>val x = 5</code>.',
                 /^System\.out/, '❌ <code>System.out</code> للـ Java — في Kotlin: <code>println(...)</code>.',
                 /^echo\s/,    '❌ <code>echo</code> للـ PHP — في Kotlin: <code>println(...)</code>.',
                 /^console\./, '❌ <code>console.log</code> للـ JavaScript — في Kotlin: <code>println(...)</code>.'],
        php:    [/^(let|const)\s/, '❌ <code>let/const</code> للـ JavaScript — في PHP: <code>$name = "...";</code>',
                 /^val\s|^fun\s/, '❌ هذا Kotlin — في PHP: <code>$x = ...;</code> أو <code>function f() { }</code>.',
                 /^def\s/,     '❌ <code>def</code> للـ Python — في PHP: <code>function f() { }</code>.',
                 /^System\.out/, '❌ <code>System.out</code> للـ Java — في PHP: <code>echo "...";</code>',
                 /^console\./, '❌ <code>console.log</code> للـ JavaScript — في PHP: <code>echo "...";</code>',
                 /^print\s*\(\s*"/, null, // PHP supports print("..."); allow it
                 /^println\s*\(/, '❌ <code>println</code> للـ Kotlin — في PHP: <code>echo "...";</code>']
      };
      const arr = checks[lang] || [];
      for (let i = 0; i < arr.length; i += 2) {
        const re = arr[i], msg = arr[i + 1];
        if (msg && re.test(t)) return er(msg);
      }
      return null;
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS — VARIABLES
    // ════════════════════════════════════════════════════════════════

    function javaVar(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص (اقتباس) غير مغلقة — أكمل الـ <code>"</code> أو <code>\'</code>.');
      const rj = rejectWrongLang(c, 'java'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code> في النهاية.');

      const body = c.slice(0, -1).trim();
      const m = body.match(/^(?:(?:public|private|protected|static|final|abstract)\s+)*(int|long|short|byte|double|float|char|boolean|String|var)\s+([a-zA-Z_]\w*)\s*=\s*(.+)$/);

      if (!m) {
        // declaration without value: int x;
        if (/^(?:(?:public|private|protected|static|final)\s+)*(int|long|short|byte|double|float|char|boolean|String)\s+[a-zA-Z_]\w*$/.test(body)) {
          return ok('✅ صحيح! تعريف متغير بدون قيمة ابتدائية.');
        }
        // reassignment without type — likely trying to modify final
        if (/^[A-Z_][A-Z0-9_]*\s*=/.test(body)) {
          return er('❌ <code>final</code> في Java: القيمة تُحدَّد عند التعريف فقط ولا يمكن تغييرها. مثال صحيح: <code>final int MAX = 100;</code>');
        }
        if (/^[a-zA-Z_]\w*\s*=/.test(body)) {
          return er('❌ ناقص نوع البيانات قبل اسم المتغير. مثال: <code>int x = 5;</code>');
        }
        // multiple statements (semicolon inside)
        if (body.includes(';')) return er('❌ ادخل تعريفاً واحداً فقط — فيه أكثر من جملة (<code>;</code>).');
        return er('❌ صياغة غير صحيحة — مثال: <code>int age = 25;</code> أو <code>String name = "علي";</code>');
      }

      const [, type, name, valRaw] = m;
      const val = valRaw.trim();
      if (val.includes(';')) return er('❌ ادخل تعريفاً واحداً فقط — فيه أكثر من جملة (<code>;</code>).');

      // var — type-inference
      if (type === 'var') {
        if (val === 'null') return er('❌ <code>var</code> لا يقدر يستنتج النوع من <code>null</code> — حدّد النوع صراحة.');
        if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
        if (val === 'true' || val === 'false') return ok(`✅ صحيح! استنتاج <code>boolean</code> عبر <code>var ${name} = ${val};</code>`);
        if (val === 'True' || val === 'False') return er('❌ Java يستخدم <code>true</code>/<code>false</code> بحرف صغير (وليس <code>True/False</code> — هذي Python).');
        if (DQ_STR.test(val) || /^new\s+/.test(val) || INT.test(val) || DEC.test(val) || LONG_L.test(val) || FLOAT_F.test(val) || ID.test(val)) {
          return ok(`✅ صحيح! استنتاج النوع تلقائياً: <code>var ${name} = ${val};</code>`);
        }
        return er(`❌ القيمة <code>${val}</code> غير صالحة لاستنتاج النوع.`);
      }

      // int / short / byte
      if (type === 'int' || type === 'short' || type === 'byte') {
        if (DEC.test(val) || FLOAT_F.test(val)) return er(`❌ <code>${type}</code> لا يقبل العدد العشري <code>${val}</code> — استخدم <code>double</code> أو <code>float</code>.`);
        if (DQ_STR.test(val)) return er(`❌ <code>${type}</code> لا يقبل النصوص — استخدم <code>String</code>.`);
        if (val === 'true' || val === 'false' || val === 'True' || val === 'False') return er(`❌ <code>${type}</code> لا يقبل boolean — استخدم <code>boolean</code>.`);
        if (CHAR_L.test(val) || SQ_STR.test(val)) return er(`❌ <code>${type}</code> لا يقبل <code>char</code> — استخدم <code>char</code>.`);
        if (LONG_L.test(val)) return er(`❌ <code>${type}</code> لا يقبل قيمة <code>long</code> (تنتهي بـ <code>L</code>) — احذف <code>L</code> أو غيّر النوع إلى <code>long</code>.`);
        if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص — لكن <code>${type}</code> لا يقبل النصوص أصلاً.`);
        if (!INT.test(val) && !ID.test(val) && !/^[-+]?\d+(\s*[+\-*/%]\s*-?\d+)+$/.test(val)) {
          return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>${type}</code> — يقبل أعداد صحيحة فقط.`);
        }
        return ok(`✅ صحيح! <code>${type} ${name} = ${val};</code>`);
      }

      // long
      if (type === 'long') {
        if (DEC.test(val) || FLOAT_F.test(val)) return er(`❌ <code>long</code> لا يقبل العدد العشري — استخدم <code>double</code>.`);
        if (DQ_STR.test(val)) return er(`❌ <code>long</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>long</code> لا يقبل boolean.`);
        if (CHAR_L.test(val) || SQ_STR.test(val)) return er(`❌ <code>long</code> لا يقبل <code>char</code>.`);
        if (LONG_L.test(val)) return ok(`✅ صحيح! <code>long ${name} = ${val};</code>`);
        if (INT.test(val)) {
          const n = Number(val);
          if (Math.abs(n) > 2147483647) return er(`❌ الرقم <code>${val}</code> أكبر من حدّ <code>int</code> — أضف <code>L</code> في النهاية: <code>${val}L</code>.`);
          return ok(`✅ صحيح! <code>long ${name} = ${val};</code> (يفضّل إضافة <code>L</code> للأرقام الكبيرة).`);
        }
        if (ID.test(val)) return ok(`✅ صحيح! <code>long ${name} = ${val};</code>`);
        return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>long</code>.`);
      }

      // double
      if (type === 'double') {
        if (DQ_STR.test(val)) return er(`❌ <code>double</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false' || val === 'True' || val === 'False') return er(`❌ <code>double</code> لا يقبل boolean.`);
        if (CHAR_L.test(val) || SQ_STR.test(val)) return er(`❌ <code>double</code> لا يقبل <code>char</code>.`);
        if (FLOAT_F.test(val)) return wn(`⚠️ القيمة تنتهي بـ <code>f</code> (float). للـ <code>double</code> لا حاجة لها: <code>${val.replace(/[fF]$/,'')}</code> أو <code>${val.replace(/[fF]$/,'d')}</code>.`);
        if (DEC.test(val) || INT.test(val) || ID.test(val) || /^-?\d+(?:\.\d+)?[dDeE][\d+-]*\d+$/.test(val)) return ok(`✅ صحيح! <code>double ${name} = ${val};</code>`);
        if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي خارج التنصيص — لكن <code>double</code> لا يقبل النصوص أصلاً.`);
        return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>double</code>.`);
      }

      // float
      if (type === 'float') {
        if (DQ_STR.test(val)) return er(`❌ <code>float</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false' || val === 'True' || val === 'False') return er(`❌ <code>float</code> لا يقبل boolean.`);
        if (CHAR_L.test(val) || SQ_STR.test(val)) return er(`❌ <code>float</code> لا يقبل <code>char</code>.`);
        if (DEC.test(val) && !FLOAT_F.test(val)) return er(`❌ <code>float</code> يحتاج حرف <code>f</code> في النهاية: <code>${val}f</code>. بدون <code>f</code>، القيمة تُعامل كـ <code>double</code>.`);
        if (FLOAT_F.test(val) || INT.test(val) || ID.test(val)) return ok(`✅ صحيح! <code>float ${name} = ${val};</code>`);
        return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>float</code>.`);
      }

      // char
      if (type === 'char') {
        if (DQ_STR.test(val)) return er(`❌ <code>char</code> يستخدم الأقواس المفردة لحرف واحد: <code>'A'</code> وليس <code>"A"</code> (المزدوجة للـ <code>String</code>).`);
        if (INT.test(val) || DEC.test(val)) return er(`❌ <code>char</code> للأحرف — مثال: <code>char c = 'A';</code>`);
        if (val === 'true' || val === 'false') return er(`❌ <code>char</code> لا يقبل boolean.`);
        if (/^'(?:[^'\\]|\\.){2,}'$/.test(val)) return er(`❌ <code>char</code> لحرف واحد فقط — للنصوص استخدم <code>String</code>.`);
        if (CHAR_L.test(val) || /^'\\[ntrbf'"\\]'$/.test(val) || /^'\\u[0-9a-fA-F]{4}'$/.test(val)) return ok(`✅ صحيح! <code>char ${name} = ${val};</code>`);
        if (ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ <code>char</code> يحتاج حرف واحد بين <code>' '</code>.`);
      }

      // boolean
      if (type === 'boolean') {
        if (val === 'True' || val === 'False') return er(`❌ Java يستخدم <code>true</code>/<code>false</code> بحرف صغير (وليس <code>True/False</code> — هذي صياغة Python).`);
        if (val === 'TRUE' || val === 'FALSE') return er(`❌ Java حساسة لحالة الأحرف — استخدم <code>true</code>/<code>false</code> بحروف صغيرة.`);
        if (INT.test(val) || DEC.test(val) || FLOAT_F.test(val)) return er(`❌ <code>boolean</code> لا يقبل الأرقام — القيم المقبولة: <code>true</code> أو <code>false</code> فقط.`);
        if (DQ_STR.test(val) || SQ_STR.test(val)) return er(`❌ <code>boolean</code> لا يقبل النصوص.`);
        if (CHAR_L.test(val)) return er(`❌ <code>boolean</code> لا يقبل <code>char</code>.`);
        if (val === 'true' || val === 'false') return ok(`✅ صحيح! <code>boolean ${name} = ${val};</code>`);
        // expression resulting in boolean (e.g., x > 5)
        if (/^[!(]/.test(val) || /(==|!=|<=|>=|<|>|&&|\|\|)/.test(val)) return ok(`✅ صحيح! <code>boolean</code> ناتج تعبير منطقي.`);
        if (ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ <code>boolean</code> يقبل فقط <code>true</code> أو <code>false</code>.`);
      }

      // String
      if (type === 'String') {
        if (INT.test(val) || DEC.test(val) || LONG_L.test(val) || FLOAT_F.test(val)) return er(`❌ <code>String</code> يحتاج قيمة نصية بين علامتَي تنصيص مزدوجة: <code>"${val}"</code>.`);
        if (val === 'true' || val === 'false' || val === 'True' || val === 'False') return er(`❌ <code>String</code> يحتاج نصاً — هل تقصد: <code>"${val}"</code>?`);
        if (CHAR_L.test(val) || SQ_STR.test(val)) return er(`❌ <code>String</code> يستخدم الأقواس المزدوجة <code>"..."</code> (المفردة للـ <code>char</code>).`);
        if (DQ_STR.test(val)) return ok(`✅ صحيح! <code>String ${name} = ${val};</code>`);
        if (val === 'null') return ok('✅ صحيح! <code>String</code> فارغ (<code>null</code>).');
        if (val.startsWith('new String')) return ok('✅ صحيح! إنشاء <code>String</code> عبر <code>new</code>.');
        if (ID.test(val)) return ok('✅ صحيح!');
        if (/^"[^"]*"\s*\+/.test(val) || /\+\s*"[^"]*"/.test(val)) return ok('✅ صحيح! دمج نصوص (+).');
        if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
        return er(`❌ <code>String</code> يحتاج قيمة نصية بين <code>"..."</code>.`);
      }

      return ok('✅ صحيح!');
    }

    function pyVar(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'python'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Python ما تستخدم <code>;</code> في النهاية.');
      if (c.includes('{') && !/^\w+\s*=\s*\{/.test(c)) return er('❌ Python ما تستخدم الأقواس المعقوفة <code>{}</code> للكتل — استخدم النقطتان والمسافة البادئة.');

      // Type-hint form: name: type = value
      const th = c.match(/^([a-zA-Z_]\w*)\s*:\s*(int|float|str|bool|list|dict|tuple|set|bytes|complex|None)\s*=\s*(.+)$/);
      if (th) {
        const [, vname, vtype, vval] = th;
        const v = vval.trim();
        if (vtype === 'int') {
          if (DEC.test(v)) return er(`❌ Type Hint <code>int</code> لكن القيمة <code>${v}</code> عشرية — استخدم <code>float</code>.`);
          if (DQ_STR.test(v) || SQ_STR.test(v)) return er(`❌ Type Hint <code>int</code> لكن القيمة نص — استخدم <code>str</code>.`);
          if (v === 'True' || v === 'False') return er(`❌ Type Hint <code>int</code> لكن القيمة boolean — استخدم <code>bool</code>.`);
          if (v === 'true' || v === 'false') return er(`❌ Python يستخدم <code>True/False</code> بحرف كبير (هذي ليست JavaScript).`);
          if (!INT.test(v) && !ID.test(v)) return er(`❌ القيمة <code>${v}</code> غير صحيحة لـ <code>int</code>.`);
        }
        if (vtype === 'float') {
          if (DQ_STR.test(v) || SQ_STR.test(v)) return er(`❌ Type Hint <code>float</code> لكن القيمة نص.`);
          if (v === 'True' || v === 'False') return er(`❌ Type Hint <code>float</code> لكن القيمة boolean.`);
          if (!INT.test(v) && !DEC.test(v) && !ID.test(v)) return er(`❌ القيمة غير صحيحة لـ <code>float</code>.`);
        }
        if (vtype === 'str') {
          if (DQ_STR.test(v) || SQ_STR.test(v)) return ok(`✅ صحيح! <code>${vname}: ${vtype} = ${v}</code>`);
          if (ID.test(v)) return ok(`✅ صحيح!`);
          if (INT.test(v) || DEC.test(v)) return er(`❌ Type Hint <code>str</code> يحتاج نصاً — هل تقصد: <code>"${v}"</code>?`);
          if (v === 'True' || v === 'False' || v === 'true' || v === 'false') return er(`❌ Type Hint <code>str</code> لكن القيمة boolean.`);
          if (hasArabicOutsideStrings(v)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${v}"</code>.`);
        }
        if (vtype === 'bool') {
          if (v === 'true' || v === 'false') return er(`❌ Python يستخدم <code>True</code>/<code>False</code> بحرف كبير (وليس <code>true/false</code>).`);
          if (v !== 'True' && v !== 'False' && !ID.test(v) && !/(==|!=|<=|>=|<|>|\sand\s|\sor\s|\snot\s)/.test(v)) return er(`❌ <code>bool</code> في Python: <code>True</code> أو <code>False</code>.`);
        }
        return ok(`✅ صحيح! Type Hint سليم: <code>${vname}: ${vtype} = ${v}</code>`);
      }

      // Plain `name: type` (no value) — invalid for runtime assignment
      if (/^[a-zA-Z_]\w*\s*:\s*\w+\s*$/.test(c)) return er('❌ Type Hint بدون قيمة — مثال: <code>name: str = "علي"</code>');

      // Simple assignment
      const sa = c.match(/^([a-zA-Z_]\w*)\s*=\s*(.+)$/);
      if (sa) {
        const [, vname, vval] = sa;
        const v = vval.trim();
        if (!v) return er('❌ القيمة فارغة بعد <code>=</code>.');
        // boolean lowercase from another language
        if (v === 'true' || v === 'false') return er(`❌ في Python: <code>True/False</code> بحرف كبير — استخدم <code>${vname} = ${v.charAt(0).toUpperCase() + v.slice(1)}</code>.`);
        // function-call-like (e.g., int("abc")) without assignment context — caught above; but also detect bad casts
        if (v.startsWith('int(') && /^int\(\s*['"][^'"]*['"]\s*\)$/.test(v) && !/^int\(\s*['"][-+]?\d+['"]\s*\)$/.test(v)) {
          // int("abc") — not actually invalid syntax, but logically fails at runtime
          return wn(`⚠️ <code>int(${v.slice(4,-1)})</code> سيرفع <code>ValueError</code> إذا كانت السلسلة ليست رقماً.`);
        }
        // unquoted Arabic
        if (hasArabicOutsideStrings(v)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${v}"</code> أو <code>'${v}'</code>.`);
        // constant convention: ALL_CAPS for constants
        if (/^[A-Z][A-Z0-9_]*[a-z]/.test(vname) || /^[A-Z][a-z]+_[A-Z]/.test(vname)) {
          return er(`❌ يبدو أنك تقصد ثابتاً. اتفاقية Python (PEP 8): الثوابت بحروف كبيرة فقط — <code>${vname.toUpperCase()}</code>.`);
        }
        return ok(`✅ صحيح! <code>${vname} = ${v}</code>`);
      }

      // int("abc") alone (no assignment) — bad cast
      if (/^int\(/.test(c) && unclosedString(c) === false) {
        if (/^int\(\s*['"][^'"]*['"]\s*\)$/.test(c) && !/^int\(\s*['"][-+]?\d+['"]\s*\)$/.test(c)) {
          return er(`❌ <code>${c}</code> سيرفع <code>ValueError</code> — لا يمكن تحويل نص غير رقمي إلى عدد صحيح. ولا يوجد تعيين متغير.`);
        }
      }

      return er('❌ صياغة غير صحيحة — مثال: <code>age = 25</code> أو <code>name: str = "علي"</code>');
    }

    function jsVar(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'js'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code> (مستحسنة لتجنب ASI).');

      const body = c.slice(0, -1).trim();

      // var — discouraged (JSON marks as incorrect)
      if (/^var\s+/.test(body)) {
        return er('❌ <code>var</code> قديم وله مشاكل في النطاق (scope). الأفضل في JavaScript الحديثة: <code>let</code> أو <code>const</code>.');
      }

      // Numeric literal with comma instead of dot
      if (/=\s*-?\d+,\d+/.test(body)) {
        const m = body.match(/=\s*(-?\d+,\d+)/);
        return er(`❌ الكسور العشرية في JavaScript بالنقطة <code>.</code> وليس الفاصلة <code>,</code> — <code>${m[1].replace(',','.')}</code>.`);
      }

      const m = body.match(/^(let|const)\s+([a-zA-Z_$][\w$]*)\s*=\s*(.+)$/);
      if (!m) {
        if (/^(let|const)\s+[a-zA-Z_$][\w$]*\s*$/.test(body)) {
          if (/^const/.test(body)) return er('❌ <code>const</code> لا بد من تعيين قيمة عند التعريف.');
          return ok('✅ تعريف <code>let</code> بدون قيمة (سيكون <code>undefined</code>).');
        }
        if (/^[a-zA-Z_$][\w$]*\s*=/.test(body)) return er('❌ ناقصة الكلمة المفتاحية — استخدم <code>let</code> أو <code>const</code>.');
        return er('❌ صياغة غير صحيحة — مثال: <code>let age = 25;</code> أو <code>const name = "علي";</code>');
      }

      const [, kw, name, valRaw] = m;
      const val = valRaw.trim();

      // String literal followed by identifier without operator: "x" name
      const stripped = stripStrings(val);
      if (stripped !== null) {
        // detect: "..." \s+ identifier OR identifier \s+ "..."
        if (/"[\s]*[a-zA-Z_$]/.test(stripped) || /[a-zA-Z_$][\w$]*\s+"/.test(stripped) ||
            /`[\s]*[a-zA-Z_$]/.test(stripped) || /[a-zA-Z_$][\w$]*\s+`/.test(stripped)) {
          // Make sure it's not a valid pattern like `new X(...)`
          if (!/^new\s+/.test(val)) {
            return er('❌ لا يوجد عامل بين الـ string والمتغير — استخدم <code>+</code> للدمج أو Template Literal: <code>`نص ${name}`</code>.');
          }
        }
      }

      // boolean capital T
      if (val === 'True' || val === 'False') return er('❌ JavaScript يستخدم <code>true</code>/<code>false</code> بحرف صغير.');
      // backtick template literal
      if (BT_STR.test(val) || /^`[\s\S]*`$/.test(val)) return ok(`✅ ممتاز! Template Literal: <code>${kw} ${name} = ${val};</code>`);
      // valid values
      if (DQ_STR.test(val) || SQ_STR.test(val) || INT.test(val) || DEC.test(val) || val === 'true' || val === 'false' || val === 'null' || val === 'undefined') {
        return ok(`✅ صحيح! <code>${kw} ${name} = ${val};</code>`);
      }
      if (/^\[.*\]$/.test(val) || /^\{.*\}$/.test(val)) return ok(`✅ صحيح! <code>${kw} ${name} = ${val};</code>`);
      if (/^new\s+\w/.test(val)) return ok(`✅ صحيح!`);
      if (/^(?:async\s+)?\(?[\w$,\s]*\)?\s*=>/.test(val) || /^function\b/.test(val)) return ok(`✅ صحيح! دالة معينّة لمتغير.`);
      if (ID.test(val)) return ok(`✅ صحيح!`);
      if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
      // expressions like 1 + 2
      if (/^[\d\w\s+\-*/().%]+$/.test(val)) return ok(`✅ صحيح!`);
      return er(`❌ القيمة <code>${val}</code> غير صحيحة.`);
    }

    function cppVar(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'cpp'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      const body = c.slice(0, -1).trim();
      // detect multiple statements
      if ((body.match(/;/g) || []).length >= 1) {
        return er('❌ ادخل تعريفاً واحداً فقط — الكود فيه أكثر من جملة.');
      }

      const m = body.match(/^(?:(?:const|constexpr|static|extern|mutable)\s+)*(int|long long|long|short|unsigned int|unsigned|double|float|char|bool|auto|std::string|string|wchar_t)\s+([a-zA-Z_]\w*)\s*=\s*(.+)$/);
      if (!m) {
        if (/^(?:(?:const|static)\s+)*(int|long|short|double|float|char|bool|std::string|string)\s+[a-zA-Z_]\w*$/.test(body)) {
          return ok('✅ صحيح! تعريف متغير بدون قيمة ابتدائية (قد يحوي قيمة عشوائية).');
        }
        if (/^[a-zA-Z_]\w*\s*=/.test(body)) return er('❌ ناقص نوع البيانات. مثال: <code>int x = 5;</code>');
        return er('❌ صياغة غير صحيحة — مثال: <code>int age = 25;</code> أو <code>std::string s = "علي";</code>');
      }

      const [, type, name, valRaw] = m;
      const val = valRaw.trim();

      if (type === 'int' || type === 'short' || type === 'long' || type === 'long long' || type === 'unsigned int' || type === 'unsigned') {
        if (DEC.test(val)) return er(`❌ <code>${type}</code> لا يقبل العدد العشري <code>${val}</code> — استخدم <code>double</code> أو <code>float</code>.`);
        if (DQ_STR.test(val)) return er(`❌ <code>${type}</code> لا يقبل النصوص — استخدم <code>std::string</code>.`);
        if (val === 'true' || val === 'false' || val === 'True' || val === 'False') return er(`❌ <code>${type}</code> لا يقبل boolean — استخدم <code>bool</code>.`);
        if (CHAR_L.test(val)) return wn(`⚠️ <code>${type}</code> يقبل <code>char</code> لكنه يخزن قيمته الرقمية (ASCII).`);
        if (INT.test(val) || ID.test(val)) return ok(`✅ صحيح! <code>${type} ${name} = ${val};</code>`);
        if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي خارج التنصيص — لكن <code>${type}</code> لا يقبل النصوص.`);
        return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>${type}</code>.`);
      }

      if (type === 'float') {
        if (DQ_STR.test(val)) return er(`❌ <code>float</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>float</code> لا يقبل boolean.`);
        if (DEC.test(val) && !FLOAT_F.test(val)) return er(`❌ <code>float</code> يحتاج حرف <code>f</code>: <code>${val}f</code> (بدون <code>f</code> القيمة <code>double</code>).`);
        if (FLOAT_F.test(val) || INT.test(val) || ID.test(val)) return ok(`✅ صحيح! <code>float ${name} = ${val};</code>`);
        return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>float</code>.`);
      }

      if (type === 'double') {
        if (DQ_STR.test(val)) return er(`❌ <code>double</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>double</code> لا يقبل boolean.`);
        if (DEC.test(val) || INT.test(val) || ID.test(val)) return ok(`✅ صحيح! <code>double ${name} = ${val};</code>`);
        if (FLOAT_F.test(val)) return wn(`⚠️ القيمة تنتهي بـ <code>f</code> (float). للـ <code>double</code> لا داعي.`);
        return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>double</code>.`);
      }

      if (type === 'bool') {
        if (val === 'True' || val === 'False') return er(`❌ C++ يستخدم <code>true</code>/<code>false</code> بحرف صغير (وليس <code>True/False</code> — هذي Python).`);
        if (INT.test(val) && (val === '0' || val === '1')) return wn(`⚠️ <code>bool</code> يقبل <code>0</code>/<code>1</code> لكن الأنسب <code>true</code>/<code>false</code>.`);
        if (DEC.test(val) || DQ_STR.test(val)) return er(`❌ <code>bool</code> في C++ يقبل <code>true</code> أو <code>false</code> فقط.`);
        if (val === 'true' || val === 'false') return ok(`✅ صحيح! <code>bool ${name} = ${val};</code>`);
        if (ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ <code>bool</code> يقبل <code>true</code> أو <code>false</code>.`);
      }

      if (type === 'char') {
        if (DQ_STR.test(val)) return er(`❌ <code>char</code> يستخدم الأقواس المفردة لحرف واحد: <code>'A'</code> وليس <code>"A"</code> (المزدوجة للسلاسل).`);
        if (INT.test(val)) return wn(`⚠️ <code>char</code> يقبل الأعداد كقيم ASCII — لكن الأنسب: <code>'A'</code>.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>char</code> لا يقبل boolean.`);
        if (CHAR_L.test(val) || /^'\\[ntrbf'"\\0]'$/.test(val)) return ok(`✅ صحيح! <code>char ${name} = ${val};</code>`);
        if (/^'.{2,}'$/.test(val)) return er(`❌ <code>char</code> لحرف واحد فقط — للنصوص استخدم <code>std::string</code>.`);
        if (ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ <code>char</code> يحتاج حرف واحد بين <code>' '</code>.`);
      }

      if (type === 'string' || type === 'std::string') {
        if (CHAR_L.test(val) || SQ_STR.test(val)) return er(`❌ <code>${type}</code> يستخدم الأقواس المزدوجة <code>"..."</code> (المفردة للـ <code>char</code>).`);
        if (DQ_STR.test(val)) return ok(`✅ صحيح! <code>${type} ${name} = ${val};</code>`);
        if (INT.test(val) || DEC.test(val)) return er(`❌ <code>${type}</code> يحتاج نصاً بين <code>"..."</code>.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>${type}</code> يحتاج نصاً — هل تقصد <code>"${val}"</code>?`);
        if (ID.test(val)) return ok(`✅ صحيح!`);
        if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
        return er(`❌ <code>${type}</code> يحتاج نصاً بين <code>"..."</code>.`);
      }

      if (type === 'auto') {
        if (val === 'true' || val === 'false') return ok(`✅ صحيح! استنتاج النوع كـ <code>bool</code>.`);
        return ok(`✅ صحيح! استنتاج النوع تلقائياً عبر <code>auto</code>.`);
      }

      return ok('✅ صحيح!');
    }

    function csVar(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'csharp'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      const body = c.slice(0, -1).trim();
      if ((body.match(/;/g) || []).length >= 1) return er('❌ ادخل تعريفاً واحداً فقط.');

      const m = body.match(/^(?:(?:public|private|protected|internal|static|readonly|const)\s+)*(int|long|short|byte|double|float|decimal|bool|char|string|var|object|dynamic)\s+([a-zA-Z_]\w*)\s*=\s*(.+)$/);
      if (!m) {
        if (/^[A-Z_][A-Z0-9_]*\s*=/.test(body)) return er('❌ <code>const</code> في C#: القيمة تُحدَّد عند التعريف فقط. مثال صحيح: <code>const int MAX = 100;</code>');
        if (/^[a-zA-Z_]\w*\s*=/.test(body)) return er('❌ ناقص نوع البيانات. مثال: <code>int x = 5;</code>');
        return er('❌ صياغة غير صحيحة — مثال: <code>int age = 25;</code> أو <code>const int MAX = 100;</code>');
      }

      const [, type, name, valRaw] = m;
      const val = valRaw.trim();

      if (type === 'int' || type === 'long' || type === 'short' || type === 'byte') {
        if (DEC.test(val) || FLOAT_F.test(val)) return er(`❌ <code>${type}</code> لا يقبل العدد العشري <code>${val}</code> — استخدم <code>double</code> أو <code>decimal</code>.`);
        if (DQ_STR.test(val)) return er(`❌ <code>${type}</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false' || val === 'True' || val === 'False') return er(`❌ <code>${type}</code> لا يقبل boolean — استخدم <code>bool</code>.`);
        if (CHAR_L.test(val)) return er(`❌ <code>${type}</code> لا يقبل <code>char</code>.`);
        if (INT.test(val) || ID.test(val)) return ok(`✅ صحيح! <code>${type} ${name} = ${val};</code>`);
        return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>${type}</code>.`);
      }

      if (type === 'float') {
        if (DEC.test(val) && !FLOAT_F.test(val)) return er(`❌ <code>float</code> في C# يحتاج حرف <code>f</code>: <code>${val}f</code>.`);
        if (DQ_STR.test(val)) return er(`❌ <code>float</code> لا يقبل النصوص.`);
        if (FLOAT_F.test(val) || INT.test(val) || ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>float</code>.`);
      }

      if (type === 'decimal') {
        if (DEC.test(val) && !DEC_M.test(val)) return er(`❌ <code>decimal</code> يحتاج حرف <code>m</code>: <code>${val}m</code>.`);
        if (DEC_M.test(val) || INT.test(val) || ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ القيمة غير صحيحة لـ <code>decimal</code>.`);
      }

      if (type === 'double') {
        if (DQ_STR.test(val)) return er(`❌ <code>double</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>double</code> لا يقبل boolean.`);
        if (DEC.test(val) || INT.test(val) || ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ القيمة غير صحيحة لـ <code>double</code>.`);
      }

      if (type === 'bool') {
        if (val === 'True' || val === 'False') return er(`❌ C# يستخدم <code>true</code>/<code>false</code> بحرف صغير (وليس <code>True/False</code> — هذي Python).`);
        if (INT.test(val) || DEC.test(val)) return er(`❌ <code>bool</code> في C# لا يقبل الأرقام (على عكس C++).`);
        if (DQ_STR.test(val)) return er(`❌ <code>bool</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false') return ok(`✅ صحيح! <code>bool ${name} = ${val};</code>`);
        if (ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ <code>bool</code> يقبل فقط <code>true</code> أو <code>false</code>.`);
      }

      if (type === 'char') {
        if (DQ_STR.test(val)) return er(`❌ <code>char</code> في C# يستخدم الأقواس المفردة: <code>'A'</code>.`);
        if (CHAR_L.test(val) || /^'\\[ntrbf0\\'"]'$/.test(val) || /^'\\u[0-9a-fA-F]{4}'$/.test(val)) return ok(`✅ صحيح! <code>char ${name} = ${val};</code>`);
        if (/^'.{2,}'$/.test(val)) return er(`❌ <code>char</code> لحرف واحد فقط — للنصوص استخدم <code>string</code>.`);
        if (INT.test(val)) return wn(`⚠️ <code>char</code> يقبل الأعداد كقيم Unicode — لكن الأنسب: <code>'A'</code>.`);
        if (ID.test(val)) return ok(`✅ صحيح!`);
        return er(`❌ <code>char</code> يحتاج حرف واحد بين <code>' '</code>.`);
      }

      if (type === 'string') {
        if (CHAR_L.test(val) || SQ_STR.test(val)) return er(`❌ <code>string</code> في C# يستخدم الأقواس المزدوجة <code>"..."</code> (المفردة للـ <code>char</code>).`);
        if (DQ_STR.test(val) || /^@"/.test(val) || /^\$"/.test(val) || /^\$@"/.test(val) || /^@\$"/.test(val)) return ok(`✅ صحيح! <code>string ${name} = ${val};</code>`);
        if (INT.test(val) || DEC.test(val)) return er(`❌ <code>string</code> يحتاج نصاً بين <code>"..."</code>.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>string</code> يحتاج نصاً — هل تقصد <code>"${val}"</code>?`);
        if (val === 'null') return ok('✅ صحيح! <code>string</code> فارغ.');
        if (ID.test(val)) return ok('✅ صحيح!');
        if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
        return er(`❌ <code>string</code> يحتاج نصاً بين <code>"..."</code>.`);
      }

      if (type === 'var') {
        if (val === 'null') return er('❌ <code>var</code> لا يستنتج النوع من <code>null</code> — حدّد النوع.');
        return ok(`✅ صحيح! استنتاج النوع تلقائياً عبر <code>var</code>.`);
      }

      return ok('✅ صحيح!');
    }

    function ktVar(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'kotlin'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Kotlin ما تستخدم <code>;</code> في النهاية.');

      const m = c.match(/^(?:const\s+)?(val|var)\s+([a-zA-Z_]\w*)(?:\s*:\s*([A-Z]\w*\??))?\s*=\s*(.+)$/);
      if (!m) {
        if (/^(val|var)\s+[a-zA-Z_]\w*\s*:\s*[A-Z]\w*\??\s*$/.test(c)) return er('❌ ناقصة قيمة التعيين — مثال: <code>val x: Int = 5</code>');
        return er('❌ صياغة غير صحيحة — مثال: <code>val age = 25</code> أو <code>val name: String = "علي"</code>');
      }

      const [, kw, name, typehint, valRaw] = m;
      const val = valRaw.trim();
      const t = typehint ? typehint.replace('?', '') : null;

      if (t === 'Int') {
        if (DEC.test(val) || FLOAT_F.test(val)) return er(`❌ Type <code>Int</code> لكن القيمة <code>${val}</code> عشرية — استخدم <code>Double</code> أو <code>Float</code>.`);
        if (DQ_STR.test(val)) return er(`❌ Type <code>Int</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false') return er(`❌ Type <code>Int</code> لا يقبل boolean.`);
        if (!INT.test(val) && !ID.test(val)) return er(`❌ القيمة <code>${val}</code> غير صحيحة لـ <code>Int</code>.`);
      }
      if (t === 'Long') {
        if (DEC.test(val)) return er(`❌ Type <code>Long</code> لا يقبل العشري.`);
        if (DQ_STR.test(val)) return er(`❌ Type <code>Long</code> لا يقبل النصوص.`);
      }
      if (t === 'Double') {
        if (DQ_STR.test(val)) return er(`❌ <code>Double</code> لا يقبل النصوص.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>Double</code> لا يقبل boolean.`);
        if (!INT.test(val) && !DEC.test(val) && !ID.test(val)) return er(`❌ القيمة غير صحيحة لـ <code>Double</code>.`);
      }
      if (t === 'Float') {
        if (DEC.test(val) && !FLOAT_F.test(val)) return er(`❌ <code>Float</code> يحتاج حرف <code>f</code> في النهاية: <code>${val}f</code>.`);
        if (DQ_STR.test(val)) return er(`❌ <code>Float</code> لا يقبل النصوص.`);
      }
      if (t === 'Boolean') {
        if (val === 'True' || val === 'False') return er(`❌ Kotlin يستخدم <code>true</code>/<code>false</code> بحرف صغير (وليس <code>True/False</code> — هذي Python).`);
        if (val === 'TRUE' || val === 'FALSE') return er(`❌ Kotlin حساسة للحالة — <code>true</code>/<code>false</code> فقط.`);
        if (INT.test(val) || DEC.test(val)) return er(`❌ <code>Boolean</code> لا يقبل الأرقام.`);
        if (DQ_STR.test(val) || SQ_STR.test(val)) return er(`❌ <code>Boolean</code> لا يقبل النصوص.`);
        if (val !== 'true' && val !== 'false' && !ID.test(val) && !/(==|!=|<=|>=|<|>|&&|\|\|)/.test(val)) return er(`❌ <code>Boolean</code> يقبل <code>true</code> أو <code>false</code>.`);
      }
      if (t === 'String') {
        if (INT.test(val) || DEC.test(val)) return er(`❌ <code>String</code> يحتاج نصاً بين <code>"..."</code>.`);
        if (val === 'true' || val === 'false') return er(`❌ <code>String</code> يحتاج نصاً — هل تقصد <code>"${val}"</code>?`);
        if (CHAR_L.test(val) || SQ_STR.test(val)) return er(`❌ <code>String</code> في Kotlin يستخدم الأقواس المزدوجة <code>"..."</code> (المفردة للـ <code>Char</code>).`);
        if (!DQ_STR.test(val) && !ID.test(val) && !val.startsWith('"""') && !hasArabicOutsideStrings(val)) {
          if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
        }
        if (hasArabicOutsideStrings(val) && !DQ_STR.test(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
      }
      if (t === 'Char') {
        if (DQ_STR.test(val)) return er(`❌ <code>Char</code> في Kotlin يستخدم الأقواس المفردة لحرف واحد: <code>'ن'</code> وليس <code>"${val.slice(1,-1)}"</code> (المزدوجة للـ <code>String</code>).`);
        if (CHAR_L.test(val)) return ok(`✅ صحيح! <code>val ${name}: Char = ${val}</code>`);
        if (/^'.{2,}'$/.test(val)) return er(`❌ <code>Char</code> لحرف واحد فقط — للنصوص استخدم <code>String</code>.`);
        if (INT.test(val)) return er(`❌ <code>Char</code> في Kotlin لا يقبل أعداد مباشرة (على عكس Java/C++).`);
        return er(`❌ <code>Char</code> يحتاج حرف واحد بين <code>' '</code>.`);
      }

      // Generic OK after type checks pass
      if (hasArabicOutsideStrings(val)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
      if (val === 'True' || val === 'False') return er(`❌ Kotlin يستخدم <code>true</code>/<code>false</code> بحرف صغير.`);

      const decl = kw === 'val' ? 'ثابت (immutable)' : 'متغير قابل للتعديل';
      return ok(`✅ صحيح! ${decl}: <code>${kw} ${name}${typehint ? ': '+typehint : ''} = ${val}</code>`);
    }

    function phpVar(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'php'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');
      if (unclosedString(c)) return er('❌ علامة تنصيص (اقتباس) غير مغلقة — أكمل الـ <code>"</code> أو <code>\'</code>.');

      // define() / const for constants
      if (/^define\s*\(\s*['"][A-Z_][A-Z0-9_]*['"]\s*,\s*.+\)\s*;$/.test(c)) return ok('✅ صحيح! ثابت <code>define()</code> في PHP.');
      if (/^const\s+[A-Z_][A-Z0-9_]*\s*=\s*.+;$/.test(c)) return ok('✅ صحيح! ثابت <code>const</code> في PHP.');

      if (!/^\$/.test(c)) return er('❌ في PHP كل متغير يبدأ بـ <code>$</code> — مثال: <code>$age = 25;</code>');

      const body = c.slice(0, -1).trim();
      const m = body.match(/^\$([a-zA-Z_]\w*)\s*=\s*(.+)$/);
      if (!m) return er('❌ صياغة غير صحيحة — مثال: <code>$age = 25;</code> أو <code>$name = "علي";</code>');

      const [, name, valRaw] = m;
      const val = valRaw.trim();

      // boolean strict-lowercase per PSR
      if (val === 'True' || val === 'False' || val === 'TRUE' || val === 'FALSE') {
        return er(`❌ الأنسب في PHP (PSR-12) كتابة <code>true</code>/<code>false</code> بحروف صغيرة، وليس <code>${val}</code>.`);
      }
      // unclosed string val (e.g., 'نورة)
      if ((val.startsWith("'") && !val.endsWith("'")) || (val.startsWith('"') && !val.endsWith('"'))) {
        return er(`❌ علامة الاقتباس غير مغلقة في <code>${val}</code>.`);
      }
      // stringified number
      if (/^"-?\d+(?:\.\d+)?"$/.test(val) || /^'-?\d+(?:\.\d+)?'$/.test(val)) {
        return er(`❌ القيمة <code>${val}</code> نص يحتوي رقم — للرقم اكتبه بدون اقتباس: <code>${val.slice(1,-1)}</code>.`);
      }
      // Arabic outside quotes
      if (hasArabicOutsideStrings(val) && !val.startsWith('"') && !val.startsWith("'")) {
        return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${val}"</code>.`);
      }
      // valid forms
      if (DQ_STR.test(val) || SQ_STR.test(val) || INT.test(val) || DEC.test(val) || val === 'true' || val === 'false' || val === 'null' || /^\$/.test(val) || /^\[/.test(val) || /^array\s*\(/.test(val) || /^new\s+/.test(val)) {
        return ok(`✅ صحيح! <code>$${name} = ${val};</code>`);
      }
      // expressions
      if (/^[\w\s+\-*/().%$"'.]+$/.test(val)) return ok(`✅ صحيح! <code>$${name} = ${val};</code>`);
      return er(`❌ القيمة <code>${val}</code> غير صحيحة.`);
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS — PRINT
    // ════════════════════════════════════════════════════════════════

    // Helper: detect adjacent tokens without separator inside an argument list
    function adjacentTokens(stripped) {
      // After closing quote/backtick: next token (digit/letter/quote) means no operator between them — bug.
      // Use \s* (not \s+) so this catches BOTH "vv" 5 AND "vv"5 (no space).
      if (/"\s*\d/.test(stripped)) return true;            // "..."5   or  "..." 5
      if (/"\s*[a-zA-Z_$]/.test(stripped)) return true;    // "..."name
      if (/"\s*["'`]/.test(stripped)) return true;         // "..." "..."
      if (/'\s*\d/.test(stripped)) return true;
      if (/'\s*[a-zA-Z_$]/.test(stripped)) return true;
      if (/'\s*["`]/.test(stripped)) return true;
      if (/`\s*\d/.test(stripped)) return true;
      if (/`\s*[a-zA-Z_$]/.test(stripped)) return true;
      if (/`\s*["']/.test(stripped)) return true;
      // Digit followed by quote (e.g., 5"hello")
      if (/\d\s*["'`]/.test(stripped)) return true;
      // Identifier followed by quote — exclude keywords/operators
      if (/[a-zA-Z_$][\w$]*\s*["'`]/.test(stripped) && !/\b(and|or|not|in|new|return|throw|typeof|delete|instanceof|case|yield|await|else|do|of)\s+["'`]/.test(stripped)) return true;
      // Identifier whitespace digit (e.g., name 5) — keep \s+ since name5 is one identifier
      if (/[a-zA-Z_$][\w$]*\s+\d/.test(stripped) && !/\d\s+(and|or|not|in)\s/.test(stripped)) return true;
      // Digit whitespace identifier (5 name) — keep \s+ since 5e10 is scientific
      if (/\d\s+[a-zA-Z_$]/.test(stripped)) return true;
      return false;
    }

    function javaPrint(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'java'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');
      if (/^print\s*\(/.test(c)) return er('❌ في Java الطباعة كاملة: <code>System.out.println("...");</code>');

      // typo detection: prinln/printn/pintln/printin etc.
      const tm = c.match(/^System\.out\.([a-zA-Z]+)\s*\(/);
      if (!tm) return er('❌ الطباعة في Java: <code>System.out.println("...");</code> أو <code>System.out.print(...)</code> أو <code>System.out.printf(...)</code>.');
      const method = tm[1];
      if (!['println', 'print', 'printf', 'write'].includes(method)) {
        let hint = '';
        if (/^pri?nt?[a-z]*$/.test(method) || /^print/.test(method) || method.includes('rint')) {
          hint = ' (هل قصدت <code>println</code>?)';
        }
        return er(`❌ <code>System.out.${method}</code> غير موجود${hint}. الصحيح: <code>println</code>، <code>print</code>، أو <code>printf</code>.`);
      }

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      const arg = firstParens(c, 'System.out.'.length + method.length);
      if (arg === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');

      const a = arg.trim();
      if (a === '') {
        if (method === 'println') return ok('✅ صحيح! سطر فارغ.');
        return er('❌ وسيط الطباعة فارغ — مثال: <code>System.out.println("مرحباً");</code>');
      }

      if (hasArabicOutsideStrings(a)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص مزدوجة: <code>"${a.replace(/[\u0600-\u06FF\s]+/g, m=>m.trim()).slice(0,40)}"</code>.`);

      // detect adjacent tokens
      const sa = stripStrings(a);
      if (sa !== null && adjacentTokens(sa)) {
        return er('❌ لا يوجد عامل بين الوسطاء — استخدم <code>+</code> للدمج: <code>"مرحبا " + name</code>.');
      }

      if (method === 'printf') {
        const fmtM = a.match(/^"([^"]*)"\s*(?:,\s*(.+))?$/);
        if (fmtM) {
          const fmt = fmtM[1], args = (fmtM[2] || '').trim();
          const specs = (fmt.match(/%[-+0-9.]*[dsfceboxX%]/g) || []).filter(x => x !== '%%');
          if (specs.length > 0 && !args) return er('❌ <code>printf</code> فيه specifiers (%d/%s/...) لكن ما فيه قيم بعد الـ format.');
          if (specs.length > 0 && args) {
            const argList = args.split(',').map(s => s.trim());
            for (let i = 0; i < Math.min(specs.length, argList.length); i++) {
              const spec = specs[i], v = argList[i];
              if (spec === '%d' && DEC.test(v)) return er('❌ <code>%d</code> للأعداد الصحيحة — للعشري <code>%f</code>.');
              if (spec === '%s' && (INT.test(v) || DEC.test(v))) return wn('⚠️ <code>%s</code> للنصوص — للأعداد الأفضل <code>%d</code> أو <code>%f</code>.');
            }
          }
          return ok('✅ صحيح! <code>printf</code> سليم.');
        }
      }

      return ok(`✅ صحيح! طباعة في Java عبر <code>System.out.${method}</code>.`);
    }

    function pyPrint(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'python'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Python ما تستخدم <code>;</code>.');

      // Python 2 style: print "..."
      if (/^print\s+["'`]/.test(c) || /^print\s+[^(]/.test(c)) {
        return er('❌ في Python 3 الأقواس إلزامية: <code>print("...")</code> — هذي صياغة Python 2.');
      }

      if (!/^print\s*\(/.test(c)) return er('❌ الطباعة في Python: <code>print("...")</code>.');
      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      if (!c.endsWith(')')) return er('❌ ناقص قوس الإغلاق <code>)</code>.');

      const arg = firstParens(c, 'print'.length);
      if (arg === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const a = arg.trim();

      if (a === '') return ok('✅ صحيح! سطر فارغ.');
      if (hasArabicOutsideStrings(a)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${a.slice(0,40)}"</code> أو <code>'${a.slice(0,40)}'</code>.`);

      // f-string check
      if (/^f["']/.test(a)) {
        if (!/^f"[^"]*"$/.test(a) && !/^f'[^']*'$/.test(a) && !/^f"""[\s\S]*"""$/.test(a)) {
          // could be complex f-string with braces — that's fine
        }
        return ok('✅ ممتاز! f-string في Python.');
      }

      // detect adjacent tokens
      const sa = stripStrings(a);
      if (sa !== null && adjacentTokens(sa)) {
        return er('❌ لا يوجد فاصل بين الوسطاء — استخدم فاصلة: <code>print("نص", value)</code> أو f-string: <code>print(f"نص {value}")</code>.');
      }

      return ok('✅ صحيح! طباعة في Python.');
    }

    function jsPrint(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'js'); if (rj) return rj;

      // Capital C — common confusion with C#
      if (/^Console\./.test(c)) return er('❌ JavaScript يستخدم <code>console</code> بحرف صغير (وليس <code>Console</code> — هذي C#).');

      const fnM = c.match(/^(console\.(?:log|warn|error|info|table|dir|debug|trace)|alert)\s*\(/);
      if (!fnM) return er('❌ الطباعة في JavaScript: <code>console.log("...")</code>.');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      if (!c.endsWith(';') && !c.endsWith(')')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      const fn = fnM[1];
      const arg = firstParens(c, fn.length);
      if (arg === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const a = arg.trim();

      if (a === '') return ok('✅ صحيح! سطر فارغ.');
      if (hasArabicOutsideStrings(a)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${a.slice(0,40)}"</code> أو backticks <code>\`${a.slice(0,40)}\`</code>.`);

      // detect adjacent tokens (the main bug from JSON spec)
      const sa = stripStrings(a);
      if (sa !== null && adjacentTokens(sa)) {
        return er('❌ لا يوجد فاصل بين الوسطاء — استخدم فاصلة: <code>console.log("نص", value)</code> أو دمج: <code>"نص " + value</code> أو Template Literal: <code>`نص ${value}`</code>.');
      }

      return ok(`✅ صحيح! طباعة عبر <code>${fn}</code>.`);
    }

    function cppPrint(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'cpp'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      // cout chain
      if (/^(std::)?cout\s*<</.test(c)) {
        // Strip strings, then verify every "value" is preceded by <<
        const stripped = stripStrings(c);
        if (stripped === null) return er('❌ علامة تنصيص غير مغلقة.');
        // Remove the leading 'cout' or 'std::cout' part
        let rest = stripped.replace(/^(std::)?cout\s*/, '').replace(/;\s*$/, '');
        // Now rest should look like: << "xxxx" << var << endl
        // Split by << and check each segment is a single token (no two adjacent tokens)
        const segments = rest.split('<<').map(s => s.trim()).filter(s => s.length > 0);
        if (segments.length === 0) return er('❌ ناقص ما تريد طباعته بعد <code>cout</code>.');
        for (const seg of segments) {
          // A segment must be ONE token: either "..." (string), identifier, number, or chained-call
          // Detect adjacent tokens in this segment
          if (adjacentTokens(seg)) {
            return er('❌ ناقص <code>&lt;&lt;</code> بين الوسطاء — لازم بين كل قيمة: <code>cout &lt;&lt; "نص" &lt;&lt; var &lt;&lt; endl;</code>');
          }
          // Multiple identifiers/literals with whitespace between
          const tokens = seg.split(/\s+/).filter(t => t.length > 0);
          if (tokens.length > 1) {
            // Check if it's a valid single expression (e.g., `a + b`)
            if (!/[+\-*/%&|^]/.test(seg) && !/^[A-Z]\w*::/.test(seg)) {
              return er('❌ ناقص <code>&lt;&lt;</code> بين الوسطاء — لازم بين كل قيمة: <code>cout &lt;&lt; "نص" &lt;&lt; var &lt;&lt; endl;</code>');
            }
          }
        }
        if (hasArabicOutsideStrings(c.replace(/^(std::)?cout\s*<<\s*/, ''))) {
          return er('❌ النص العربي يجب أن يكون بين علامتَي تنصيص.');
        }
        return ok('✅ صحيح! طباعة عبر <code>cout</code> في C++.');
      }

      // printf
      if (/^printf\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const arg = firstParens(c, 'printf'.length);
        if (arg === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
        if (hasArabicOutsideStrings(arg)) return er('❌ النص العربي يجب أن يكون بين علامتَي تنصيص.');
        return ok('✅ صحيح! <code>printf</code> في C++.');
      }

      // puts
      if (/^puts\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        return ok('✅ صحيح! <code>puts</code> في C/C++.');
      }

      return er('❌ الطباعة في C++: <code>cout &lt;&lt; "مرحبا" &lt;&lt; endl;</code>');
    }

    function csPrint(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'csharp'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      // case sensitivity: console.log → wrong (Java/JS-style)
      if (/^console\./.test(c)) return er('❌ C# يستخدم <code>Console</code> بحرف كبير (وليس <code>console</code> — هذي JavaScript).');

      const tm = c.match(/^Console\.([a-zA-Z]+)\s*\(/);
      if (!tm) return er('❌ الطباعة في C#: <code>Console.WriteLine("...");</code>');
      const method = tm[1];
      if (!['WriteLine', 'Write', 'Error'].includes(method)) {
        return er(`❌ <code>Console.${method}</code> غير شائع — الصحيح: <code>WriteLine</code> أو <code>Write</code>.`);
      }

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
      const arg = firstParens(c, ('Console.' + method).length);
      if (arg === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const a = arg.trim();

      if (a === '') {
        if (method === 'WriteLine') return ok('✅ صحيح! سطر فارغ.');
        return er('❌ الوسيط فارغ.');
      }
      if (hasArabicOutsideStrings(a)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${a.slice(0,40)}"</code>.`);

      const sa = stripStrings(a);
      if (sa !== null && adjacentTokens(sa)) {
        return er('❌ لا يوجد فاصل بين الوسطاء — استخدم فاصلة أو دمج: <code>$"نص {value}"</code> أو <code>"نص " + value</code>.');
      }

      return ok(`✅ صحيح! طباعة في C# عبر <code>Console.${method}</code>.`);
    }

    function ktPrint(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'kotlin'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Kotlin ما تستخدم <code>;</code>.');

      const fnM = c.match(/^(println|print)\s*\(/);
      if (!fnM) return er('❌ الطباعة في Kotlin: <code>println("...")</code>.');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
      const fn = fnM[1];
      const arg = firstParens(c, fn.length);
      if (arg === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const a = arg.trim();

      if (a === '') return ok('✅ صحيح! سطر فارغ.');
      if (hasArabicOutsideStrings(a)) return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${a.slice(0,40)}"</code> أو String Template: <code>"اسمي $name"</code>.`);

      const sa = stripStrings(a);
      if (sa !== null && adjacentTokens(sa)) {
        return er('❌ لا يوجد فاصل بين الوسطاء — استخدم String Template: <code>"نص $value"</code> أو دمج: <code>"نص " + value</code>.');
      }

      return ok(`✅ صحيح! طباعة عبر <code>${fn}</code> في Kotlin.`);
    }

    function phpPrint(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'php'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      if (/^(print_r|var_dump|var_export)\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        return ok('✅ صحيح! دالة تنقيح في PHP.');
      }

      if (/^(printf|sprintf|fprintf)\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        return ok('✅ صحيح! <code>printf</code> في PHP.');
      }

      if (/^print\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        return ok('✅ صحيح! <code>print()</code> في PHP.');
      }

      if (/^echo\s+/.test(c) || /^echo\s*\(/.test(c)) {
        // After 'echo', validate the args
        const after = c.replace(/^echo\s*\(?\s*/, '').replace(/\)?\s*;$/, '');
        if (after.trim() === '') return er('❌ <code>echo</code> يحتاج قيمة على الأقل.');
        if (hasArabicOutsideStrings(after) && !after.startsWith('"') && !after.startsWith("'") && !after.startsWith('$')) {
          return er(`❌ النص العربي يجب أن يكون بين علامتَي تنصيص: <code>"${after}"</code>.`);
        }
        // detect adjacent tokens (the bug from spec)
        const sa = stripStrings(after);
        if (sa !== null && adjacentTokens(sa)) {
          return er('❌ لا يوجد فاصل بين الوسطاء — في PHP استخدم نقطة (<code>.</code>) للدمج أو فاصلة (<code>,</code>): <code>echo "نص " . $value;</code>');
        }
        return ok('✅ صحيح! <code>echo</code> في PHP.');
      }

      return er('❌ الطباعة في PHP: <code>echo "مرحبا";</code> أو <code>print "مرحبا";</code>');
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS — FOR LOOPS
    // ════════════════════════════════════════════════════════════════

    function javaFor(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'java'); if (rj) return rj;
      if (/^for\s+\w+\s+in\b/.test(c)) return er('❌ هذا أسلوب Python — في Java: <code>for (int i=0; i&lt;5; i++) { }</code>');
      if (/^for\s*\(\s*(let|const|var)\b/.test(c)) return er('❌ هذا أسلوب JavaScript — في Java: <code>for (int i=0; i&lt;5; i++) { }</code>');
      if (/^foreach\s*\(/.test(c)) return er('❌ <code>foreach</code> للـ C#/PHP — في Java الـ Enhanced for: <code>for (String s : list)</code>.');

      // while
      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er('❌ شرط <code>while</code> غير مكتمل — يحتاج مقارنة (<code>&lt;</code>، <code>&gt;</code>، <code>==</code>...) أو نداء دالة. مثال: <code>while (i &lt; 10)</code>.');
        return ok('✅ صحيح! حلقة <code>while</code> في Java.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! حلقة <code>do-while</code> في Java.');

      // require for( with parens
      if (/^for\s+[^(]/.test(c)) return er('❌ في Java الشرط بين أقواس: <code>for (int i=0; i&lt;5; i++) { }</code>');
      if (!/^for\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>for (int i=0; i&lt;5; i++) { }</code>');

      const header = firstParens(c, 'for'.length);
      if (header === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const h = header.trim();
      if (!h) return er('❌ أقواس <code>for</code> فارغة — مثال: <code>for (int i=0; i&lt;5; i++)</code>.');

      // Enhanced for-each: type name : iterable
      if (/^(?:final\s+)?(int|long|double|float|char|boolean|String|byte|short|var|[A-Z]\w*(?:<.+>)?)\s+\w+\s*:\s*.+$/.test(h)) {
        return ok('✅ ممتاز! Enhanced for-each في Java.');
      }

      // Classic: init; cond; update
      const segs = h.split(';');
      if (segs.length !== 3) return er(`❌ حلقة <code>for</code> الكلاسيكية تحتاج 3 أجزاء مفصولة بـ <code>;</code> — وجدت ${segs.length}.`);
      const [init, cond, upd] = segs.map(s => s.trim());
      if (!init) return er('❌ ناقص جزء التهيئة (مثل <code>int i = 0</code>).');
      if (!/^(?:final\s+)?(int|long|short|byte|double|float|var)\s+\w+\s*=/.test(init) && !/^\w+\s*=/.test(init)) {
        return er(`❌ تهيئة غير صحيحة: <code>${init}</code> — مثال: <code>int i = 0</code>.`);
      }
      if (!cond) return er('❌ ناقص جزء الشرط (مثل <code>i &lt; 5</code>).');
      if (!conditionLooksReal(cond)) return er(`❌ شرط <code>for</code> غير مكتمل: <code>${cond}</code> — يحتاج مقارنة. مثال: <code>i &lt; 5</code>.`);
      if (!upd) return er('❌ ناقص جزء التحديث (مثل <code>i++</code>).');
      if (!updateLooksReal(upd)) return er(`❌ جزء التحديث <code>${upd}</code> غير مكتمل — يحتاج <code>++</code>، <code>--</code>، <code>+=</code>، أو إسناد. مثال: <code>i++</code>.`);
      return ok('✅ صحيح! حلقة <code>for</code> الكلاسيكية في Java.');
    }

    function pyFor(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'python'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Python ما تستخدم <code>;</code>.');

      if (/^for\s*\(/.test(c)) return er('❌ هذا أسلوب Java/C++/JS — في Python: <code>for i in range(5):</code>');

      // for i=0;i<5;i++: ← incorrect example
      if (/^for\s+\w+\s*=\s*\d+\s*;/.test(c)) {
        return er('❌ هذه صياغة C/Java — في Python: <code>for i in range(5):</code> أو <code>for item in list:</code>');
      }

      // while loops
      if (/^while\s+/.test(c)) {
        const colonIdx = c.indexOf(':');
        if (colonIdx < 0) return er('❌ ناقصت النقطتان <code>:</code> بعد شرط <code>while</code>.');
        const cond = c.slice(5, colonIdx).trim();
        if (!cond) return er('❌ ناقص الشرط بعد <code>while</code>.');
        if (!conditionLooksReal(cond)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${cond}</code> — يحتاج مقارنة أو نداء دالة. مثال: <code>while count &lt; 10:</code>.`);
        return ok('✅ صحيح! حلقة <code>while</code> في Python.');
      }

      if (!/^for\s+/.test(c)) return er('❌ غير صحيح — مثال: <code>for i in range(5):</code> أو <code>for item in names:</code>');

      // Must have ` in ` and `:`
      if (!/\sin\s/.test(c)) return er('❌ حلقة <code>for</code> في Python تستخدم <code>in</code>: <code>for i in range(5):</code>');
      if (!c.includes(':')) return er('❌ ناقصت النقطتان <code>:</code> في النهاية.');

      // Parse: for var(s) in iterable: [body]
      const m = c.match(/^for\s+([a-zA-Z_]\w*(?:\s*,\s*[a-zA-Z_]\w*)*)\s+in\s+(.+?)\s*:(.*)$/);
      if (!m) return er('❌ صياغة غير صحيحة — مثال: <code>for i in range(5):</code>');
      const [, , iterableRaw] = m;
      const iterable = iterableRaw.trim();
      if (!iterable) return er('❌ ناقص الـ iterable بعد <code>in</code>. مثال: <code>for i in range(5):</code>.');

      // Bare callable references (need to be called with parens)
      if (PY_BARE_CALLABLES.has(iterable)) {
        return er(`❌ <code>${iterable}</code> دالة تحتاج استدعاء بأقواس — مثال: <code>for i in ${iterable}(5):</code> أو <code>for i in ${iterable}(0, 10):</code>.`);
      }

      // Empty range check
      const rm = iterable.match(/^range\s*\(\s*(-?\d+)\s*,\s*(-?\d+)\s*\)$/);
      if (rm && parseInt(rm[1]) >= parseInt(rm[2])) {
        return wn(`⚠️ <code>range(${rm[1]}, ${rm[2]})</code> فارغ — البداية يجب أن تكون أصغر من النهاية (أو استخدم <code>step</code> سالب).`);
      }

      return ok('✅ صحيح! حلقة <code>for</code> في Python.');
    }

    function jsFor(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'js'); if (rj) return rj;

      if (/^for\s+\w+\s+in\s+range/.test(c)) return er('❌ هذا أسلوب Python — في JS: <code>for (let i=0; i&lt;5; i++) { }</code>');

      // while
      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة أو نداء دالة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! حلقة <code>while</code> في JavaScript.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! حلقة <code>do-while</code> في JavaScript.');
      if (/^foreach\s*\(/.test(c)) return er('❌ JavaScript ما يملك <code>foreach</code> — استخدم <code>for...of</code> أو الميثود <code>.forEach()</code>.');

      // require parens
      if (/^for\s+[^(]/.test(c)) return er('❌ في JavaScript الشرط بين أقواس: <code>for (let i=0; i&lt;5; i++) { }</code>');
      if (!/^for\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>for (let i=0; i&lt;5; i++) { }</code>');

      const header = firstParens(c, 'for'.length);
      if (header === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const h = header.trim();
      if (!h) return er('❌ أقواس <code>for</code> فارغة — مثال: <code>for (let i=0; i&lt;5; i++)</code>.');

      // var (discouraged)
      if (/^var\s+/.test(h)) return wn('⚠️ يعمل لكن الأنسب <code>let</code>: <code>for (let i=0; i&lt;5; i++)</code>.');

      // for...of / for...in
      if (/^(let|const)\s+\w+\s+of\s+\S+/.test(h)) return ok('✅ ممتاز! <code>for...of</code> للمصفوفات.');
      if (/^(let|const)\s+\w+\s+in\s+\S+/.test(h)) return wn('⚠️ <code>for...in</code> للخصائص — للمصفوفات الأنسب <code>for...of</code> أو <code>.forEach()</code>.');

      // classic
      const segs = h.split(';');
      if (segs.length !== 3) return er(`❌ حلقة <code>for</code> الكلاسيكية تحتاج 3 أجزاء مفصولة بـ <code>;</code> — وجدت ${segs.length}.`);
      const [init, cond, upd] = segs.map(s => s.trim());
      if (!init) return er('❌ ناقص جزء التهيئة.');
      if (!/^(?:let|const|var)\s+\w+\s*=/.test(init) && !/^\w+\s*=/.test(init)) {
        return er(`❌ تهيئة غير صحيحة في JS: <code>${init}</code> — استخدم <code>let i = 0</code>.`);
      }
      if (!cond) return er('❌ ناقص جزء الشرط.');
      if (!conditionLooksReal(cond)) return er(`❌ شرط <code>for</code> غير مكتمل: <code>${cond}</code> — يحتاج مقارنة. مثال: <code>i &lt; 5</code>.`);
      if (!upd) return er('❌ ناقص جزء التحديث.');
      if (!updateLooksReal(upd)) return er(`❌ جزء التحديث <code>${upd}</code> غير مكتمل — يحتاج <code>++</code>، <code>--</code>، <code>+=</code>، أو إسناد. مثال: <code>i++</code>.`);
      return ok('✅ صحيح! حلقة <code>for</code> في JavaScript.');
    }

    function cppFor(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'cpp'); if (rj) return rj;
      if (/^for\s+\w+\s+in\b/.test(c)) return er('❌ هذا أسلوب Python — في C++: <code>for (int i=0; i&lt;5; i++) { }</code>');

      // while
      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة أو نداء دالة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! حلقة <code>while</code> في C++.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! حلقة <code>do-while</code> في C++.');

      if (/^for\s+[^(]/.test(c)) return er('❌ في C++ الشرط بين أقواس: <code>for (int i=0; i&lt;5; i++) { }</code>');
      if (!/^for\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>for (int i=0; i&lt;5; i++) { }</code>');

      const header = firstParens(c, 'for'.length);
      if (header === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const h = header.trim();
      if (!h) return er('❌ أقواس <code>for</code> فارغة — مثال: <code>for (int i=0; i&lt;5; i++)</code>.');

      // Range-based: type name : container
      if (/^(?:const\s+)?(?:auto|int|double|float|long|short|char|bool|std::string|string)\s*&?\s+\w+\s*:\s*\S+/.test(h)) {
        return ok('✅ ممتاز! Range-based <code>for</code> في C++.');
      }

      const segs = h.split(';');
      if (segs.length !== 3) return er(`❌ حلقة <code>for</code> الكلاسيكية تحتاج 3 أجزاء — وجدت ${segs.length}.`);
      const [init, cond, upd] = segs.map(s => s.trim());
      if (!init) return er('❌ ناقص جزء التهيئة.');
      if (!/^(?:const\s+)?(int|long|short|byte|double|float|char|bool|auto|std::string|string|unsigned)\s+\w+\s*=/.test(init) && !/^\w+\s*=/.test(init)) {
        return er(`❌ تهيئة غير صحيحة في C++: <code>${init}</code> — مثال: <code>int i = 0</code>.`);
      }
      if (!cond) return er('❌ ناقص جزء الشرط.');
      if (!conditionLooksReal(cond)) return er(`❌ شرط <code>for</code> غير مكتمل: <code>${cond}</code> — يحتاج مقارنة. مثال: <code>i &lt; 5</code>.`);
      if (!upd) return er('❌ ناقص جزء التحديث.');
      if (!updateLooksReal(upd)) return er(`❌ جزء التحديث <code>${upd}</code> غير مكتمل — يحتاج <code>++</code>، <code>--</code>، <code>+=</code>، أو إسناد. مثال: <code>i++</code>.`);
      return ok('✅ صحيح! حلقة <code>for</code> في C++.');
    }

    function csFor(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'csharp'); if (rj) return rj;

      // while
      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة أو نداء دالة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! حلقة <code>while</code> في C#.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! حلقة <code>do-while</code> في C#.');

      // foreach
      if (/^foreach\s*\(/.test(c)) {
        const h = firstParens(c, 'foreach'.length);
        if (h === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
        if (!/^(var|int|string|double|float|bool|char|[A-Z]\w*)\s+\w+\s+in\s+\S+/.test(h.trim())) {
          return er('❌ <code>foreach</code> يحتاج <code>in</code>: <code>foreach (var item in list)</code>.');
        }
        return ok('✅ صحيح! <code>foreach</code> في C#.');
      }

      if (/^for\s+[^(]/.test(c)) return er('❌ في C# الشرط بين أقواس: <code>for (int i=0; i&lt;5; i++) { }</code>');
      if (!/^for\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>for (int i=0; i&lt;5; i++) { }</code>');

      const header = firstParens(c, 'for'.length);
      if (header === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const h = header.trim();
      if (!h) return er('❌ أقواس <code>for</code> فارغة — مثال: <code>for (int i=0; i&lt;5; i++)</code>.');

      const segs = header.split(';');
      if (segs.length !== 3) return er(`❌ حلقة <code>for</code> تحتاج 3 أجزاء — وجدت ${segs.length}.`);
      const [init, cond, upd] = segs.map(s => s.trim());
      if (!init) return er('❌ ناقص جزء التهيئة.');
      if (!/^(int|long|short|byte|double|float|decimal|bool|char|var)\s+\w+\s*=/.test(init) && !/^\w+\s*=/.test(init)) {
        return er(`❌ تهيئة غير صحيحة في C#: <code>${init}</code> — مثال: <code>int i = 0</code>.`);
      }
      if (!cond) return er('❌ ناقص جزء الشرط.');
      if (!conditionLooksReal(cond)) return er(`❌ شرط <code>for</code> غير مكتمل: <code>${cond}</code> — يحتاج مقارنة. مثال: <code>i &lt; 5</code>.`);
      if (!upd) return er('❌ ناقص جزء التحديث.');
      if (!updateLooksReal(upd)) return er(`❌ جزء التحديث <code>${upd}</code> غير مكتمل — يحتاج <code>++</code>، <code>--</code>، <code>+=</code>، أو إسناد. مثال: <code>i++</code>.`);
      return ok('✅ صحيح! حلقة <code>for</code> في C#.');
    }

    function ktFor(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'kotlin'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Kotlin ما تستخدم <code>;</code>.');

      // while
      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة أو نداء دالة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! حلقة <code>while</code> في Kotlin.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! حلقة <code>do-while</code> في Kotlin.');
      if (/^repeat\s*\(\s*\d+\s*\)/.test(c)) return ok('✅ ممتاز! <code>repeat(n)</code> في Kotlin.');

      if (!/^for\s*\(/.test(c)) return er('❌ في Kotlin: <code>for (i in 0..4)</code> أو <code>for (item in list)</code>');
      const h = firstParens(c, 'for'.length);
      if (h === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      if (!h.trim()) return er('❌ أقواس <code>for</code> فارغة.');

      if (!/\sin\s/.test(h)) return er('❌ في Kotlin <code>for</code> يستخدم <code>in</code>: <code>for (i in 0..4)</code>.');

      // valid patterns
      if (/^\w+(?:\s*,\s*\w+)*\s+in\s+\d+\s*\.\.\s*\d+/.test(h.trim())) return ok('✅ صحيح! حلقة <code>for</code> مع نطاق رقمي في Kotlin.');
      if (/^\w+\s+in\s+\d+\s+(?:downTo|until)\s+\S+/.test(h.trim())) return ok('✅ صحيح! حلقة بنطاق متخصص.');
      if (/^\w+\s+in\s+\S/.test(h.trim())) return ok('✅ صحيح! حلقة <code>for</code> على مجموعة في Kotlin.');

      return er('❌ صياغة غير صحيحة — مثال: <code>for (i in 0..4)</code>');
    }

    function phpFor(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'php'); if (rj) return rj;

      // while
      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while ($i &lt; 10)</code>.');
        if (!/\$/.test(inner) && !/^(true|false|!)/.test(inner.trim())) return er('❌ في PHP المتغيرات بـ <code>$</code>: <code>while ($x &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة أو نداء دالة. مثال: <code>while ($i &lt; 10)</code>.`);
        return ok('✅ صحيح! حلقة <code>while</code> في PHP.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! <code>do-while</code> في PHP.');

      // foreach
      if (/^foreach\s*\(/.test(c)) {
        const h = firstParens(c, 'foreach'.length);
        if (h === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
        if (!/^\$\w+\s+as\s+\$\w+(?:\s*=>\s*\$\w+)?$/.test(h.trim())) {
          return er('❌ <code>foreach</code> في PHP: <code>foreach ($arr as $item)</code> — والمتغيرات بـ <code>$</code>.');
        }
        return ok('✅ صحيح! <code>foreach</code> في PHP.');
      }

      if (/^for\s+[^(]/.test(c)) return er('❌ في PHP الشرط بين أقواس: <code>for ($i=0; $i&lt;5; $i++) { }</code>');
      if (!/^for\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>for ($i=0; $i&lt;5; $i++) { }</code>');

      const header = firstParens(c, 'for'.length);
      if (header === null) return er('❌ ناقص قوس <code>(</code> أو <code>)</code>.');
      const h = header.trim();
      if (!h) return er('❌ أقواس <code>for</code> فارغة.');

      if (!/^\$/.test(h)) return er('❌ في PHP المتغيرات تبدأ بـ <code>$</code>: <code>for ($i=0; $i&lt;5; $i++)</code>.');

      const segs = h.split(';');
      if (segs.length !== 3) return er(`❌ حلقة <code>for</code> تحتاج 3 أجزاء — وجدت ${segs.length}.`);
      const [init, cond, upd] = segs.map(s => s.trim());
      if (!/^\$\w+\s*=/.test(init)) return er(`❌ تهيئة بدون <code>$</code> أو <code>=</code>: <code>${init}</code> — مثال: <code>$i = 0</code>.`);
      if (!/\$/.test(cond)) return er(`❌ شرط بدون <code>$</code>: <code>${cond}</code>.`);
      if (!conditionLooksReal(cond)) return er(`❌ شرط <code>for</code> غير مكتمل: <code>${cond}</code> — يحتاج مقارنة. مثال: <code>$i &lt; 5</code>.`);
      if (!/\$/.test(upd)) return er(`❌ تحديث بدون <code>$</code>: <code>${upd}</code>.`);
      if (!updateLooksReal(upd)) return er(`❌ جزء التحديث <code>${upd}</code> غير مكتمل — يحتاج <code>++</code>، <code>--</code>، <code>+=</code>، أو إسناد. مثال: <code>$i++</code>.`);
      return ok('✅ صحيح! حلقة <code>for</code> في PHP.');
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS — CONDITIONS
    // ════════════════════════════════════════════════════════════════

    function javaCond(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'java'); if (rj) return rj;

      if (/^else\s+if\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, c.indexOf('('));
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل <code>else if (...)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>else if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة.`);
        return ok('✅ صحيح! <code>else if</code> في Java.');
      }
      if (/^else\s*[\{]?$/.test(c)) return ok('✅ صحيح! <code>else</code> في Java.');

      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! <code>while</code> في Java.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! <code>do-while</code> في Java.');

      // Wrong: if without parens
      if (/^if\s+[^(]/.test(c)) return er('❌ في Java الشرط بين أقواس: <code>if (x &gt; 5) { }</code>');

      if (!/^if\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>if (x &gt; 5) { }</code>');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      const inner = firstParens(c, 'if'.length);
      if (inner === null || inner.trim() === '') return er('❌ ناقص شرط داخل <code>( )</code>.');

      // string equality with ==
      if (/("[^"]*"|"\w+")\s*==/.test(c) || /==\s*("[^"]*"|"\w+")/.test(c)) {
        return wn('⚠️ في Java <code>==</code> يقارن المراجع وليس محتوى النص — استخدم <code>.equals()</code>: <code>str1.equals(str2)</code>.');
      }
      const stripped = stripStrings(inner);
      if (stripped !== null && /^\s*\w+\s*=\s*[^=]/.test(stripped) && !/=\s*=/.test(stripped)) {
        return er('❌ يبدو أنك استخدمت <code>=</code> (تعيين) — للمقارنة استخدم <code>==</code>.');
      }
      if (!conditionLooksReal(inner)) return er(`❌ شرط <code>if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة (<code>&lt;</code>، <code>&gt;</code>، <code>==</code>...) أو نداء دالة.`);

      return ok('✅ صحيح! شرط <code>if</code> في Java.');
    }

    function pyCond(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'python'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Python ما تستخدم <code>;</code>.');

      // Python doesn't use braces
      const stripped = stripStrings(c);
      if (stripped !== null && /[{}]/.test(stripped)) return er('❌ Python ما تستخدم الأقواس المعقوفة <code>{ }</code> — استخدم النقطتين والمسافة البادئة.');

      // else if -> elif
      if (/^else\s+if\b/.test(c)) return er('❌ Python يستخدم <code>elif</code> وليس <code>else if</code>.');

      if (/^elif\b/.test(c)) {
        if (!c.includes(':')) return er('❌ ناقصت النقطتان <code>:</code> في النهاية.');
        const colonIdx = c.indexOf(':');
        const condPart = c.slice(4, colonIdx).trim();
        if (!condPart) return er('❌ ناقص شرط بعد <code>elif</code>.');
        if (!conditionLooksReal(condPart)) return er(`❌ شرط <code>elif</code> غير مكتمل: <code>${condPart}</code> — يحتاج مقارنة.`);
        return ok('✅ صحيح! <code>elif</code> في Python.');
      }
      if (/^else\s*:?/.test(c)) {
        if (!c.includes(':')) return er('❌ ناقصت النقطتان <code>:</code> بعد <code>else</code>.');
        return ok('✅ صحيح! <code>else</code> في Python.');
      }
      if (/^while\b/.test(c)) {
        if (!c.includes(':')) return er('❌ ناقصت النقطتان <code>:</code> بعد شرط <code>while</code>.');
        const colonIdx = c.indexOf(':');
        const condPart = c.slice(5, colonIdx).trim();
        if (!condPart) return er('❌ ناقص شرط بعد <code>while</code>.');
        if (!conditionLooksReal(condPart)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${condPart}</code> — يحتاج مقارنة. مثال: <code>while count &lt; 10:</code>.`);
        return ok('✅ صحيح! <code>while</code> في Python.');
      }

      // if must use :
      if (!/^if\b/.test(c)) return er('❌ غير صحيح — مثال: <code>if x &gt; 5: ...</code>');

      // Python doesn't need parens for the whole condition (though they are allowed)
      if (/^if\s*\(.+\)\s*:/.test(c)) return wn('⚠️ يعمل لكن Python ما تحتاج الأقواس حول الشرط: <code>if x &gt; 5:</code> أنظف.');

      if (!c.includes(':')) return er('❌ ناقصت النقطتان <code>:</code> — في Python: <code>if x &gt; 5: ...</code>');

      // Must have content between 'if' and ':'
      const colonIdx = c.indexOf(':');
      const condPart = c.slice(2, colonIdx).trim();
      if (!condPart) return er('❌ ناقص شرط بين <code>if</code> و <code>:</code>.');

      // Detect assignment instead of comparison (= vs ==)
      if (/^[a-zA-Z_]\w*\s*=\s*[^=]/.test(condPart)) {
        return er('❌ يبدو أنك استخدمت <code>=</code> (تعيين) — للمقارنة استخدم <code>==</code>.');
      }
      if (!conditionLooksReal(condPart)) return er(`❌ شرط <code>if</code> غير مكتمل: <code>${condPart}</code> — يحتاج مقارنة (<code>&lt;</code>، <code>&gt;</code>، <code>==</code>...) أو نداء دالة.`);

      return ok('✅ صحيح! شرط <code>if</code> في Python.');
    }

    function jsCond(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'js'); if (rj) return rj;

      if (/^else\s+if\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, c.indexOf('('));
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل <code>else if (...)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>else if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة.`);
        return ok('✅ صحيح! <code>else if</code> في JavaScript.');
      }
      if (/^else\s*[\{]?$/.test(c)) return ok('✅ صحيح! <code>else</code> في JavaScript.');

      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! <code>while</code> في JavaScript.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! <code>do-while</code> في JavaScript.');

      if (/^if\s+[^(]/.test(c)) return er('❌ في JavaScript الشرط بين أقواس: <code>if (x &gt; 5) { }</code>');
      if (!/^if\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>if (x &gt; 5) { }</code>');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      const inner = firstParens(c, 'if'.length);
      if (inner === null || inner.trim() === '') return er('❌ ناقص شرط داخل <code>( )</code>.');

      const stripped = stripStrings(inner);
      if (stripped !== null) {
        // Single = in if (without ==)
        if (/^\s*\w+\s*=\s*[^=]/.test(stripped) && !/=\s*=/.test(stripped)) {
          return er('❌ استخدمت <code>=</code> (تعيين). للمقارنة استخدم <code>===</code> (Strict).');
        }
        // == suggested → use ===
        if (/[^=!<>]==[^=]/.test(stripped)) {
          return wn('⚠️ يعمل لكن الأنسب في JS الحديثة <code>===</code> (لا يحوّل الأنواع).');
        }
      }
      if (!conditionLooksReal(inner)) return er(`❌ شرط <code>if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة (<code>===</code>، <code>&lt;</code>، <code>&gt;</code>...) أو نداء دالة.`);

      return ok('✅ صحيح! شرط <code>if</code> في JavaScript.');
    }

    function cppCond(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'cpp'); if (rj) return rj;

      // Pascal style 'then'
      if (/^if\b.*\bthen\b/.test(c)) return er('❌ <code>then</code> أسلوب Pascal/BASIC — في C++: <code>if (x &gt; 5) { }</code>');

      if (/^else\s+if\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, c.indexOf('('));
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل <code>else if (...)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>else if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة.`);
        return ok('✅ صحيح! <code>else if</code> في C++.');
      }
      if (/^else\s*[\{]?$/.test(c)) return ok('✅ صحيح! <code>else</code> في C++.');

      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! <code>while</code> في C++.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! <code>do-while</code> في C++.');

      if (/^if\s+[^(]/.test(c)) return er('❌ في C++ الشرط بين أقواس: <code>if (x &gt; 5) { }</code>');
      if (!/^if\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>if (x &gt; 5) { }</code>');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      const inner = firstParens(c, 'if'.length);
      if (inner === null || inner.trim() === '') return er('❌ ناقص شرط داخل <code>( )</code>.');

      const stripped = stripStrings(inner);
      if (stripped !== null && /^\s*\w+\s*=\s*[^=]/.test(stripped) && !/=\s*=/.test(stripped)) {
        return wn('⚠️ تنبيه: استخدمت <code>=</code> (تعيين). للمقارنة استخدم <code>==</code>.');
      }
      if (!conditionLooksReal(inner)) return er(`❌ شرط <code>if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة (<code>&lt;</code>، <code>&gt;</code>، <code>==</code>...) أو نداء دالة.`);

      return ok('✅ صحيح! شرط <code>if</code> في C++.');
    }

    function csCond(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'csharp'); if (rj) return rj;

      if (/^else\s+if\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, c.indexOf('('));
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل <code>else if (...)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>else if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة.`);
        return ok('✅ صحيح! <code>else if</code> في C#.');
      }
      if (/^else\s*[\{]?$/.test(c)) return ok('✅ صحيح! <code>else</code> في C#.');

      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! <code>while</code> في C#.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! <code>do-while</code> في C#.');

      if (/^if\s+[^(]/.test(c)) return er('❌ في C# الشرط بين أقواس: <code>if (x &gt; 5) { }</code>');
      if (!/^if\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>if (x &gt; 5) { }</code>');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      const inner = firstParens(c, 'if'.length);
      if (inner === null || inner.trim() === '') return er('❌ ناقص شرط داخل <code>( )</code>.');
      if (!conditionLooksReal(inner)) return er(`❌ شرط <code>if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة أو نداء دالة.`);

      return ok('✅ صحيح! شرط <code>if</code> في C#.');
    }

    function ktCond(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'kotlin'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Kotlin ما تستخدم <code>;</code>.');

      if (/^else\s+if\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, c.indexOf('('));
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل <code>else if (...)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>else if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة.`);
        return ok('✅ صحيح! <code>else if</code> في Kotlin.');
      }
      if (/^else\s*[\{]?$/.test(c)) return ok('✅ صحيح! <code>else</code> في Kotlin.');
      if (/^when\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'when'.length);
        if (inner === null || !inner.trim()) return er('❌ <code>when</code> يحتاج موضوعاً داخل الأقواس. مثال: <code>when (x) { ... }</code>.');
        return ok('✅ صحيح! <code>when</code> في Kotlin.');
      }
      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while (i &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة. مثال: <code>while (i &lt; 10)</code>.`);
        return ok('✅ صحيح! <code>while</code> في Kotlin.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! <code>do-while</code> في Kotlin.');

      if (/^if\s+[^(]/.test(c)) return er('❌ في Kotlin الشرط بين أقواس: <code>if (x &gt; 5) { }</code>');
      if (!/^if\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>if (x &gt; 5) { }</code> أو <code>when (x) { ... }</code>');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      const inner = firstParens(c, 'if'.length);
      if (inner === null || inner.trim() === '') return er('❌ ناقص شرط داخل <code>( )</code>.');
      if (!conditionLooksReal(inner)) return er(`❌ شرط <code>if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة أو نداء دالة.`);

      return ok('✅ صحيح! شرط <code>if</code> في Kotlin.');
    }

    function phpCond(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'php'); if (rj) return rj;

      if (/^else\s+if\s*\(/.test(c) || /^elseif\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, c.indexOf('('));
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل <code>elseif (...)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>elseif</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة.`);
        return ok('✅ صحيح! <code>elseif</code> في PHP.');
      }
      if (/^else\s*[\{]?$/.test(c)) return ok('✅ صحيح! <code>else</code> في PHP.');

      if (/^while\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'while'.length);
        if (inner === null || !inner.trim()) return er('❌ ناقص الشرط داخل أقواس <code>while</code>. مثال: <code>while ($i &lt; 10)</code>.');
        if (!/\$/.test(inner) && !/^(true|false|!)/.test(inner.trim())) return er('❌ في PHP المتغيرات بـ <code>$</code>: <code>while ($x &lt; 10)</code>.');
        if (!conditionLooksReal(inner)) return er(`❌ شرط <code>while</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة. مثال: <code>while ($i &lt; 10)</code>.`);
        return ok('✅ صحيح! <code>while</code> في PHP.');
      }
      if (/^do\s*\{?$/.test(c)) return ok('✅ صحيح! <code>do-while</code> في PHP.');

      if (/^if\s+[^(]/.test(c)) return er('❌ في PHP الشرط بين أقواس: <code>if ($x &gt; 5) { }</code>');
      if (!/^if\s*\(/.test(c)) return er('❌ غير صحيح — مثال: <code>if ($x &gt; 5) { }</code>');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة <code>( )</code>.');
      const inner = firstParens(c, 'if'.length);
      if (inner === null || inner.trim() === '') return er('❌ ناقص شرط داخل <code>( )</code>.');

      const stripped = stripStrings(inner);
      if (stripped !== null) {
        // Detect identifiers that should have $
        const tokens = stripped.match(/[a-zA-Z_]\w*/g) || [];
        const allowed = new Set(['true', 'false', 'null', 'TRUE', 'FALSE', 'NULL', 'isset', 'empty', 'is_array', 'is_string', 'is_int', 'is_numeric', 'is_null', 'is_bool', 'is_object', 'is_float', 'count', 'strlen', 'and', 'or', 'xor', 'not', 'instanceof']);
        for (const t of tokens) {
          if (allowed.has(t)) continue;
          if (allowed.has(t.toLowerCase())) continue;
          const idx = stripped.indexOf(t);
          if (idx !== -1 && stripped.slice(idx + t.length).trimStart().startsWith('(')) continue;
          if (idx !== -1 && idx >= 2 && stripped.slice(idx - 2, idx) === '->') continue;
          if (idx !== -1 && idx >= 2 && stripped.slice(idx - 2, idx) === '::') continue;
          if (idx !== -1 && stripped.slice(idx + t.length, idx + t.length + 2) === '::') continue;
          if (idx > 0 && stripped[idx - 1] === '$') continue;
          return er(`❌ في PHP المتغير <code>${t}</code> يبدأ بـ <code>$</code>: <code>if ($${t} &gt; 5)</code>.`);
        }
      }
      if (!conditionLooksReal(inner)) return er(`❌ شرط <code>if</code> غير مكتمل: <code>${inner.trim()}</code> — يحتاج مقارنة أو نداء دالة.`);

      return ok('✅ صحيح! شرط <code>if</code> في PHP.');
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS — SWITCH
    // ════════════════════════════════════════════════════════════════

    function javaSw(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'java'); if (rj) return rj;

      if (/^switch\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'switch'.length);
        if (inner === null || !inner.trim()) return er('❌ <code>switch</code> يحتاج موضوعاً داخل الأقواس. مثال: <code>switch (x) { ... }</code>.');
        return ok('✅ صحيح! <code>switch</code> في Java.');
      }
      if (/^case\s+\S.*:/.test(c)) return ok('✅ صحيح! سطر <code>case</code> — لا تنسَ <code>break;</code>.');
      if (/^case\s*:/.test(c)) return er('❌ <code>case</code> يحتاج قيمة قبل <code>:</code>. مثال: <code>case 1:</code>.');
      if (/^break\s*;/.test(c)) return ok('✅ صحيح! <code>break;</code> ضروري لمنع Fall-through.');
      if (/^default\s*:/.test(c)) return ok('✅ صحيح! الحالة الافتراضية <code>default</code>.');
      if (/^return\b/.test(c)) return ok('✅ صحيح! <code>return</code> داخل switch.');
      if (/^switch\s+[^(]/.test(c)) return er('❌ في Java الـ switch بين أقواس: <code>switch (x) { ... }</code>');

      return er('❌ غير صحيح — مثال: <code>switch (x) { case 1: doA(); break; default: doB(); }</code>');
    }

    function pySw(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      const rj = rejectWrongLang(c, 'python'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Python ما تستخدم <code>;</code>.');

      if (/^switch\s*[(\w]/.test(c)) return er('❌ Python ما يملك <code>switch</code> الكلاسيكي — استخدم <code>match</code> (Python 3.10+) أو <code>if/elif</code>.');
      if (/^match\s+\w+\s*:/.test(c)) return ok('✅ صحيح! <code>match</code> في Python 3.10+.');
      if (/^case\s+_\s*:/.test(c)) return ok('✅ صحيح! <code>case _</code> الحالة الافتراضية في match.');
      if (/^case\s+.+:/.test(c)) return ok('✅ صحيح! سطر <code>case</code> في match.');
      if (/^elif\s+.+:/.test(c)) return ok('✅ صحيح! <code>elif</code> كبديل لـ switch.');
      if (/^if\s+.+:/.test(c)) return ok('✅ صحيح! بداية سلسلة <code>if/elif</code> في Python.');

      return er('❌ مثال: <code>match x:</code> ثم <code>case 1: ...</code> — أو استخدم <code>if/elif</code>.');
    }

    function jsSw(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'js'); if (rj) return rj;

      if (/^switch\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'switch'.length);
        if (inner === null || !inner.trim()) return er('❌ <code>switch</code> يحتاج موضوعاً داخل الأقواس. مثال: <code>switch (x) { ... }</code>.');
        return ok('✅ صحيح! <code>switch</code> في JavaScript.');
      }
      if (/^case\s+\S.*:/.test(c)) return ok('✅ صحيح! سطر <code>case</code> — لا تنسَ <code>break;</code>.');
      if (/^case\s*:/.test(c)) return er('❌ <code>case</code> يحتاج قيمة قبل <code>:</code>. مثال: <code>case 1:</code>.');
      if (/^break\s*;/.test(c)) return ok('✅ صحيح! <code>break;</code>.');
      if (/^default\s*:/.test(c)) return ok('✅ صحيح! <code>default</code>.');
      if (/^return\b/.test(c)) return ok('✅ صحيح! <code>return</code> داخل switch.');
      if (/^switch\s+[^(]/.test(c)) return er('❌ في JavaScript الـ switch بين أقواس: <code>switch (x) { ... }</code>');

      return er('❌ غير صحيح — مثال: <code>switch (x) { case 1: doA(); break; default: doB(); }</code>');
    }

    function cppSw(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'cpp'); if (rj) return rj;

      if (/^switch\s*\(\s*(std::string|string)\b/.test(c)) return er('❌ C++ <code>switch</code> لا يقبل <code>string</code> — استخدم <code>int</code> أو <code>char</code> أو <code>enum</code> (أو <code>if/else</code>).');
      if (/^switch\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'switch'.length);
        if (inner === null || !inner.trim()) return er('❌ <code>switch</code> يحتاج موضوعاً داخل الأقواس. مثال: <code>switch (x) { ... }</code>.');
        return ok('✅ صحيح! <code>switch</code> في C++.');
      }
      if (/^case\s+\S.*:/.test(c)) return ok('✅ صحيح! <code>case</code> — لا تنسَ <code>break;</code>.');
      if (/^case\s*:/.test(c)) return er('❌ <code>case</code> يحتاج قيمة قبل <code>:</code>. مثال: <code>case 1:</code>.');
      if (/^break\s*;/.test(c)) return ok('✅ صحيح! <code>break;</code>.');
      if (/^default\s*:/.test(c)) return ok('✅ صحيح! <code>default</code>.');
      if (/^switch\s+[^(]/.test(c)) return er('❌ في C++ الـ switch بين أقواس: <code>switch (x) { ... }</code>');

      return er('❌ غير صحيح — مثال: <code>switch (x) { case 1: ... break; }</code>');
    }

    function csSw(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'csharp'); if (rj) return rj;

      if (/^switch\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'switch'.length);
        if (inner === null || !inner.trim()) return er('❌ <code>switch</code> يحتاج موضوعاً داخل الأقواس. مثال: <code>switch (x) { ... }</code>.');
        return ok('✅ صحيح! <code>switch</code> في C#.');
      }
      if (/^var\s+\w+\s*=\s*\w+\s+switch\b/.test(c)) return ok('✅ ممتاز! Switch Expression (C# 8+).');
      if (/^case\s+\S.*:/.test(c)) return ok('✅ صحيح! <code>case</code> — C# تتطلب <code>break;</code> أو <code>return</code>.');
      if (/^case\s*:/.test(c)) return er('❌ <code>case</code> يحتاج قيمة قبل <code>:</code>.');
      if (/^break\s*;/.test(c)) return ok('✅ صحيح! <code>break;</code>.');
      if (/^default\s*:/.test(c)) return ok('✅ صحيح! <code>default</code>.');

      return er('❌ غير صحيح — مثال: <code>switch (x) { case 1: ... break; }</code>');
    }

    function ktSw(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'kotlin'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Kotlin ما تستخدم <code>;</code>.');

      if (/^switch\s*[(\w]/.test(c)) return er('❌ Kotlin ما تملك <code>switch</code> — استخدم <code>when</code>: <code>when (x) { 1 -&gt; "..." }</code>');
      if (/^when\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'when'.length);
        if (inner === null || !inner.trim()) return er('❌ <code>when</code> يحتاج موضوعاً داخل الأقواس. مثال: <code>when (x) { 1 -&gt; "..." }</code>.');
        return ok('✅ صحيح! <code>when</code> في Kotlin (لا حاجة لـ break).');
      }
      if (/^when\s*\{/.test(c)) return ok('✅ صحيح! <code>when</code> بدون موضوع (يستبدل سلسلة <code>if/else</code>).');
      if (/^\d+\s*->/.test(c) || /^"[^"]*"\s*->/.test(c) || /^'.'\s*->/.test(c)) return ok('✅ صحيح! فرع في <code>when</code>.');
      if (/^else\s*->/.test(c)) return ok('✅ صحيح! الفرع الافتراضي.');
      if (/^in\s+\S/.test(c)) return ok('✅ ممتاز! استخدام <code>in</code> داخل <code>when</code>.');

      return er('❌ مثال: <code>when (x) { 1 -&gt; "واحد"; else -&gt; "أخرى" }</code>');
    }

    function phpSw(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'php'); if (rj) return rj;

      if (/^switch\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const inner = firstParens(c, 'switch'.length);
        if (inner === null || !inner.trim()) return er('❌ <code>switch</code> يحتاج موضوعاً داخل الأقواس. مثال: <code>switch ($x) { ... }</code>.');
        if (!/\$/.test(inner) && !/^(true|false|\d)/.test(inner.trim())) return er('❌ في PHP المتغيرات بـ <code>$</code>: <code>switch ($x)</code>.');
        return ok('✅ صحيح! <code>switch</code> في PHP.');
      }
      if (/^match\s*\(/.test(c)) return ok('✅ ممتاز! <code>match</code> (PHP 8) — أدق من <code>switch</code> ويستخدم <code>===</code>.');
      if (/^case\s+\S.*:/.test(c)) return ok('✅ صحيح! <code>case</code> — لا تنسَ <code>break;</code>.');
      if (/^case\s*:/.test(c)) return er('❌ <code>case</code> يحتاج قيمة قبل <code>:</code>.');
      if (/^break\s*;/.test(c)) return ok('✅ صحيح! <code>break;</code>.');
      if (/^default\s*:/.test(c)) return ok('✅ صحيح! <code>default</code>.');

      return er('❌ غير صحيح — مثال: <code>switch ($x) { case 1: echo "واحد"; break; }</code>');
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS — FUNCTIONS
    // ════════════════════════════════════════════════════════════════

    // Check Java/C++/C# typed-parameter lists
    function checkTypedParams(paramsStr, lang) {
      const t = paramsStr.trim();
      if (t === '') return { ok: true };
      // Split top-level commas only (avoid splitting inside generics)
      const parts = [];
      let depth = 0, start = 0;
      for (let i = 0; i < t.length; i++) {
        const ch = t[i];
        if (ch === '<' || ch === '(' || ch === '[') depth++;
        else if (ch === '>' || ch === ')' || ch === ']') depth--;
        else if (ch === ',' && depth === 0) { parts.push(t.slice(start, i).trim()); start = i + 1; }
      }
      parts.push(t.slice(start).trim());

      const typePats = {
        java:   /^(?:final\s+)?(?:int|long|short|byte|double|float|char|boolean|String|Object|[A-Z]\w*(?:<[^>]+>)?)(?:\s*\[\])?\s+[a-zA-Z_]\w*(?:\s*\[\])?$/,
        cpp:    /^(?:const\s+)?(?:int|long(?:\s+long)?|short|unsigned(?:\s+int)?|double|float|char|bool|auto|std::string|string|[A-Z]\w*(?:<[^>]+>)?)(?:\s*\[\])?\s*[*&]?\s*[a-zA-Z_]\w*(?:\s*=\s*[^,]+)?(?:\s*\[\])?$/,
        csharp: /^(?:(?:ref|out|in|params)\s+)?(?:int|long|short|byte|double|float|decimal|bool|char|string|object|var|[A-Z]\w*(?:<[^>]+>)?)(?:\s*\[\])?\s+[a-zA-Z_]\w*(?:\s*=\s*[^,]+)?$/
      };
      const pat = typePats[lang];
      for (const p of parts) {
        if (!pat.test(p)) return { ok: false, bad: p };
      }
      return { ok: true };
    }

    function javaFn(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'java'); if (rj) return rj;

      // Must start with optional modifiers, return type, name, (
      const m = c.match(/^((?:(?:public|private|protected|static|final|abstract|synchronized)\s+)*)?(void|int|long|short|byte|double|float|char|boolean|String|[A-Z]\w*(?:<[^>]+>)?(?:\[\])?)\s+([a-zA-Z_]\w*)\s*\(/);
      if (!m) {
        // missing return type
        if (/^[a-zA-Z_]\w*\s*\(.*\)\s*\{?/.test(c)) return er('❌ ناقص نوع الإرجاع — في Java كل دالة تحتاج نوع: <code>void</code>، <code>int</code>، ...');
        return er('❌ غير صحيح — مثال: <code>public int add(int a, int b) { return a + b; }</code>');
      }

      const headerEnd = c.indexOf('(', m[0].length - 1);
      const params = firstParens(c, m[3].length);
      if (params === null) return er('❌ الأقواس غير متوازنة.');

      const chk = checkTypedParams(params, 'java');
      if (!chk.ok) return er(`❌ البارامتر <code>${chk.bad}</code> ناقص النوع — في Java كل بارامتر يحتاج نوع: <code>int a, int b</code>.`);

      return ok('✅ صحيح! تعريف دالة في Java.');
    }

    function pyFn(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'python'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Python ما تستخدم <code>;</code>.');

      // lambda
      if (/^lambda\s+/.test(c) || /^lambda\s*:/.test(c)) {
        if (!c.includes(':')) return er('❌ <code>lambda</code> تحتاج <code>:</code> قبل التعبير.');
        return ok('✅ صحيح! <code>lambda</code> في Python.');
      }

      // decorator
      if (/^@/.test(c)) return ok('✅ صحيح! Decorator في Python.');

      if (!/^def\s+/.test(c)) return er('❌ في Python التعريف بـ <code>def</code>: <code>def add(a, b):</code>');

      const m = c.match(/^def\s+([a-zA-Z_]\w*)\s*\(/);
      if (!m) return er('❌ صياغة غير صحيحة — مثال: <code>def add(a, b):</code>');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
      if (!c.includes(':')) return er('❌ ناقصت النقطتان <code>:</code> في النهاية: <code>def add(a, b):</code>');

      return ok('✅ صحيح! تعريف دالة في Python.');
    }

    function jsFn(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'js'); if (rj) return rj;

      // Arrow function
      if (/^(?:const|let|var)\s+\w+\s*=\s*(?:async\s+)?\(?[\w,\s$]*\)?\s*=>/.test(c)) return ok('✅ ممتاز! Arrow Function في JavaScript.');
      if (/^(?:const|let|var)\s+\w+\s*=\s*function\b/.test(c)) return ok('✅ صحيح! Anonymous Function.');
      if (/^(?:async\s+)?function\s*\*?\s+\w+\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        return ok('✅ صحيح! تعريف دالة في JavaScript.');
      }
      if (/^(?:async\s+)?function\s*\(/.test(c)) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        return ok('✅ صحيح! Anonymous Function.');
      }
      // bare: sum(a,b){...}
      if (/^\w+\s*\(/.test(c) && /\)\s*\{/.test(c)) {
        return er('❌ ناقصة الكلمة المفتاحية — في JavaScript لتعريف دالة: <code>function sum(a, b) { ... }</code> أو Arrow: <code>const sum = (a, b) =&gt; ...</code>');
      }

      return er('❌ غير صحيح — مثال: <code>function add(a, b) { return a + b; }</code>');
    }

    function cppFn(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'cpp'); if (rj) return rj;

      // Lambda
      if (/^auto\s+\w+\s*=\s*\[/.test(c)) return ok('✅ ممتاز! Lambda في C++.');

      const m = c.match(/^(?:(?:inline|static|virtual|explicit|constexpr|friend)\s+)*(void|int|long(?:\s+long)?|short|unsigned(?:\s+int)?|double|float|bool|char|auto|std::string|string|[A-Z]\w*(?:<[^>]+>)?(?:\s*[*&])?)\s+(?:[\w:]+::)?([a-zA-Z_]\w*)\s*\(/);
      if (!m) {
        if (/^[a-zA-Z_]\w*\s*\(.*\)\s*\{?/.test(c)) return er('❌ ناقص نوع الإرجاع — في C++ كل دالة تحتاج نوع: <code>int</code>، <code>void</code>، ...');
        return er('❌ غير صحيح — مثال: <code>int add(int a, int b) { return a + b; }</code>');
      }

      const params = firstParens(c, c.indexOf('(', m[0].length - 1));
      if (params === null) return er('❌ الأقواس غير متوازنة.');

      const chk = checkTypedParams(params, 'cpp');
      if (!chk.ok && params.trim() !== '') return er(`❌ البارامتر <code>${chk.bad}</code> ناقص النوع — في C++ كل بارامتر يحتاج نوع: <code>int a, int b</code>.`);

      return ok('✅ صحيح! تعريف دالة في C++.');
    }

    function csFn(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'csharp'); if (rj) return rj;

      const m = c.match(/^(?:(?:public|private|protected|internal|static|virtual|override|abstract|async|sealed|partial)\s+)*(?:async\s+)?(void|Task(?:<[^>]+>)?|int|long|short|byte|double|float|decimal|bool|char|string|object|var|[A-Z]\w*(?:<[^>]+>)?(?:\[\])?)\s+([A-Za-z_]\w*)\s*\(/);
      if (!m) {
        if (/^[a-zA-Z_]\w*\s*\(.*\)\s*\{?/.test(c)) return er('❌ ناقص نوع الإرجاع — في C# كل دالة تحتاج نوع: <code>void</code>، <code>int</code>، ...');
        return er('❌ غير صحيح — مثال: <code>public int Add(int a, int b) { return a + b; }</code>');
      }

      const params = firstParens(c, c.indexOf('(', m[0].length - 1));
      if (params === null) return er('❌ الأقواس غير متوازنة.');

      const chk = checkTypedParams(params, 'csharp');
      if (!chk.ok && params.trim() !== '') return er(`❌ البارامتر <code>${chk.bad}</code> ناقص النوع — في C# كل بارامتر يحتاج نوع: <code>int a, int b</code>.`);

      return ok('✅ صحيح! تعريف دالة في C#.');
    }

    function ktFn(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'kotlin'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Kotlin ما تستخدم <code>;</code>.');

      // Lambda: val name = { ... }
      if (/^val\s+\w+\s*=\s*\{/.test(c)) return ok('✅ صحيح! Lambda في Kotlin.');
      if (!/^(?:(?:open|override|abstract|inline|suspend|private|public|protected|internal)\s+)*fun\s+/.test(c)) return er('❌ في Kotlin: <code>fun add(a: Int, b: Int): Int { ... }</code>');

      const m = c.match(/^(?:(?:open|override|abstract|inline|suspend|private|public|protected|internal)\s+)*fun\s+([a-zA-Z_]\w*)\s*\(/);
      if (!m) return er('❌ ناقص اسم الدالة بعد <code>fun</code>.');

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');

      const params = firstParens(c, c.indexOf('(', m[0].length - 1));
      if (params === null) return er('❌ الأقواس غير متوازنة.');

      // Each param must be `name: Type`
      if (params.trim() !== '') {
        const parts = params.split(',').map(p => p.trim());
        for (const p of parts) {
          if (!/^(?:vararg\s+)?[a-zA-Z_]\w*\s*:\s*[A-Z]\w*(?:<[^>]+>)?(?:\?)?(?:\s*=\s*[^,]+)?$/.test(p)) {
            return er(`❌ في Kotlin البارامتر <code>${p}</code> يحتاج نوع: <code>name: Type</code>.`);
          }
        }
      }

      // Single-expression function: fun f(): T = expr
      if (/=\s*[^{}]+$/.test(c) && !/\{/.test(c.split('=').slice(1).join('='))) return ok('✅ ممتاز! Single-expression function في Kotlin.');

      return ok('✅ صحيح! تعريف دالة في Kotlin.');
    }

    function phpFn(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'php'); if (rj) return rj;

      // Anonymous / arrow
      if (/^\$\w+\s*=\s*function\s*\(/.test(c)) return ok('✅ صحيح! Anonymous Function في PHP.');
      if (/^\$\w+\s*=\s*fn\s*\(/.test(c)) return ok('✅ ممتاز! Arrow Function (PHP 7.4+).');

      const m = c.match(/^(?:(?:public|private|protected|static|abstract|final)\s+)*function\s+([a-zA-Z_]\w*)\s*\(/);
      if (!m) {
        if (/^\w+\s*\(/.test(c) && /\)\s*\{/.test(c)) {
          return er('❌ ناقصة الكلمة المفتاحية <code>function</code> — في PHP: <code>function sum($a, $b) { return $a + $b; }</code>');
        }
        return er('❌ غير صحيح — مثال: <code>function add($a, $b) { return $a + $b; }</code>');
      }

      if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');

      const params = firstParens(c, c.indexOf('(', m[0].length - 1));
      if (params === null) return er('❌ الأقواس غير متوازنة.');

      // Each param must start with $ (optionally with type hint before)
      if (params.trim() !== '') {
        const parts = params.split(',').map(p => p.trim());
        for (const p of parts) {
          if (!/^(?:(?:\?)?[a-zA-Z_]\w*(?:\\\w+)*\s+)?(?:&\s*)?\$[a-zA-Z_]\w*(?:\s*=\s*[^,]+)?$/.test(p)) {
            return er(`❌ في PHP البارامتر <code>${p}</code> يحتاج <code>$</code>: مثال <code>$a, $b</code>.`);
          }
        }
      }

      return ok('✅ صحيح! تعريف دالة في PHP.');
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS — ARRAYS
    // ════════════════════════════════════════════════════════════════

    function javaArr(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'java'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      // Generics-typed collection without diamond <> or value: ArrayList<Integer> list = new ArrayList()
      // Java 7+ requires diamond on RHS, and the line needs `;`
      const gm = c.match(/^(ArrayList|List|LinkedList|HashSet|HashMap|TreeMap|TreeSet|Stack|Queue|Deque)<([^>]+)>\s+\w+\s*=\s*new\s+\1\s*(\(|<)/);
      if (gm) {
        // Must use diamond <> or repeated <Type>
        if (!/=\s*new\s+\w+\s*<[^>]*>\s*\(/.test(c)) return er(`❌ في Java 7+ يجب وضع <code>&lt;&gt;</code> (Diamond) على الجانب الأيمن: <code>new ${gm[1]}&lt;&gt;()</code> أو <code>new ${gm[1]}&lt;${gm[2]}&gt;()</code>.`);
        return ok('✅ ممتاز! مجموعة ديناميكية في Java.');
      }

      // Array literal form:  TYPE[] name = { ... };
      if (/^(?:(?:public|private|protected|static|final)\s+)*(int|long|double|float|String|char|boolean|byte|short|[A-Z]\w*)\[\]\s+\w+\s*=\s*\{[\s\S]*\}\s*;$/.test(c)) {
        const inner = bracketContent(c, '{', '}');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}. مثال صحيح: <code>{1, 2, 3}</code>.`);
        return ok('✅ صحيح! مصفوفة في Java.');
      }
      // Alternative form:  TYPE name[] = { ... };
      if (/^(int|double|String|long|float|char|boolean)\s+\w+\[\]\s*=\s*\{[\s\S]*\}\s*;$/.test(c)) {
        const inner = bracketContent(c, '{', '}');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}. مثال صحيح: <code>{1, 2, 3}</code>.`);
        return ok('✅ صحيح! صياغة بديلة للمصفوفة.');
      }
      // Sized: int[] arr = new int[5];
      if (/^(int|long|double|float|String|char|boolean|byte|short|[A-Z]\w*)\[\]\s+\w+\s*=\s*new\s+(int|long|double|float|String|char|boolean|byte|short|[A-Z]\w*)\s*\[\s*\d+\s*\]\s*;$/.test(c)) return ok('✅ صحيح! مصفوفة بحجم محدد في Java.');
      if (/^(int|long|double|float|String|char|boolean|byte|short|[A-Z]\w*)\[\]\s+\w+\s*=\s*new\s+(int|long|double|float|String|char|boolean|byte|short|[A-Z]\w*)\s*\[\s*\d+\s*\]\s*\{[\s\S]*\}\s*;$/.test(c)) {
        const inner = bracketContent(c, '{', '}');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}.`);
        return ok('✅ صحيح! مصفوفة بحجم وقيم.');
      }
      if (/^(int|double|float|String|char|boolean|long|short|byte|[A-Z]\w*)\[\]\s+\w+\s*;$/.test(c)) return ok('✅ تعريف مصفوفة بدون تهيئة.');
      if (/^\w+\.(add|remove|get|set|size|contains|indexOf|isEmpty|clear)\s*\(/.test(c)) return ok('✅ صحيح! عملية على مصفوفة/قائمة.');

      return er('❌ غير صحيح — مثال: <code>int[] nums = {1, 2, 3};</code> أو <code>String[] names = new String[3];</code>');
    }

    function pyArr(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'python'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Python ما تستخدم <code>;</code>.');

      if (/^(int|String|double|float)\[\]/.test(c)) return er('❌ هذا أسلوب Java — في Python: <code>nums = [1, 2, 3]</code>');

      if (/\[.+for\s+\w+\s+in\s+.+\]/.test(c)) return ok('✅ ممتاز! List Comprehension في Python!');
      // List literal: name = [...]
      if (/^[a-zA-Z_]\w*\s*=\s*\[/.test(c) && /\]$/.test(c)) {
        const inner = bracketContent(c, '[', ']');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر القائمة — ${bad}. مثال: <code>[1, 2, 3]</code>.`);
        return ok('✅ صحيح! قائمة (list) في Python.');
      }
      // Tuple: name = (...)
      if (/^[a-zA-Z_]\w*\s*=\s*\(/.test(c) && c.includes(')')) {
        const inner = bracketContent(c, '(', ')');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر الـ tuple — ${bad}.`);
        return ok('✅ صحيح! tuple في Python (ثابت).');
      }
      // Set / Dict literal: name = { ... }
      if (/^[a-zA-Z_]\w*\s*=\s*\{[^:]*\}$/.test(c)) {
        const inner = bracketContent(c, '{', '}');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر الـ set — ${bad}.`);
        return ok('✅ صحيح! set في Python (بدون تكرار).');
      }
      if (/^[a-zA-Z_]\w*\s*=\s*\{.+:.+\}$/.test(c)) return ok('✅ صحيح! dictionary في Python.');
      if (/^[a-zA-Z_]\w*\s*=\s*(?:list|tuple|set|dict|frozenset)\s*\(/.test(c)) return ok('✅ صحيح! إنشاء مجموعة باستخدام دالة بنّاء.');
      if (/^[a-zA-Z_]\w*\.(append|extend|insert|pop|remove|sort|reverse|clear|count|index|copy)\s*\(/.test(c)) return ok('✅ صحيح! عملية على قائمة.');
      if (/^[a-zA-Z_]\w*\[/.test(c)) return ok('✅ صحيح! الوصول إلى عنصر في قائمة/قاموس.');

      return er('❌ غير صحيح — مثال: <code>nums = [1, 2, 3]</code> أو <code>names = ["علي", "نورة"]</code>');
    }

    function jsArr(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'js'); if (rj) return rj;

      if (/^(int|double|String)\[\]/.test(c)) return er('❌ هذا أسلوب Java — في JavaScript: <code>const nums = [1, 2, 3];</code>');

      if (/^var\s+\w+\s*=\s*\[/.test(c)) {
        const inner = bracketContent(c, '[', ']');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}. مثال: <code>[1, 2, 3]</code>.`);
        return wn('⚠️ يعمل لكن استخدم <code>const</code> أو <code>let</code> بدلاً من <code>var</code>.');
      }
      if (/^(const|let)\s+\w+\s*=\s*\[/.test(c)) {
        const inner = bracketContent(c, '[', ']');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}. مثال: <code>[1, 2, 3]</code>.`);
        return ok('✅ صحيح! مصفوفة في JavaScript.');
      }
      if (/^(const|let)\s+\w+\s*=\s*new\s+Array\s*\(/.test(c)) return ok('✅ صحيح! إنشاء مصفوفة عبر <code>new Array</code>.');
      if (/^(const|let)\s+\w+\s*=\s*Array\.(from|of)\s*\(/.test(c)) return ok('✅ ممتاز! <code>Array.from</code>/<code>Array.of</code>.');
      // const result = arr.map(...)  /  const x = a.concat(b)  etc.
      if (/^(const|let|var)\s+\w+\s*=\s*\S.*\.\s*(push|pop|shift|unshift|splice|slice|concat|map|filter|reduce|reduceRight|sort|reverse|find|findIndex|includes|indexOf|lastIndexOf|join|flat|flatMap|every|some|forEach|at|keys|values|entries|fill|copyWithin)\s*\(/.test(c)) return ok('✅ صحيح! تخصيص نتيجة عملية على مصفوفة.');
      if (/^\w+\.(push|pop|shift|unshift|splice|slice|map|filter|reduce|forEach|sort|find|findIndex|includes|indexOf|join|concat|flat|flatMap|every|some)\s*\(/.test(c)) return ok('✅ صحيح! عملية على مصفوفة.');
      if (/^\w+\[/.test(c) && c.includes(']')) return ok('✅ صحيح! الوصول إلى عنصر في مصفوفة.');

      return er('❌ غير صحيح — مثال: <code>const nums = [1, 2, 3];</code>');
    }

    function cppArr(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'cpp'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      if (/^(int|long|double|float|char|bool|std::string|string)\s+\w+\s*\[\s*\d*\s*\]\s*=\s*\{[\s\S]*\}\s*;$/.test(c)) {
        const inner = bracketContent(c, '{', '}');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}. مثال: <code>{1, 2, 3}</code>.`);
        return ok('✅ صحيح! مصفوفة ثابتة في C++.');
      }
      if (/^(int|long|double|float|char|bool|std::string|string)\s+\w+\s*\[\s*\d*\s*\]\s*;$/.test(c)) return ok('✅ صحيح! مصفوفة ثابتة في C++ (بدون قيم).');
      if (/^(std::)?vector\s*<[^>]+>\s+\w+\s*=\s*\{[\s\S]*\}\s*;$/.test(c)) {
        const inner = bracketContent(c, '{', '}');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر vector — ${bad}.`);
        return ok('✅ ممتاز! <code>vector</code> ديناميكي مع قيم ابتدائية.');
      }
      if (/^(std::)?vector\s*<[^>]+>\s+\w+/.test(c)) return ok('✅ ممتاز! <code>vector</code> ديناميكي — الأفضل في C++ الحديثة.');
      if (/^(std::)?array\s*<[^>]+>\s+\w+/.test(c)) return ok('✅ صحيح! <code>std::array</code> بحجم ثابت آمن.');
      if (/^(std::)?(map|unordered_map|set|unordered_set|deque|list)\s*<[^>]+>/.test(c)) return ok('✅ صحيح! حاوية STL.');
      if (/^\w+\.(push_back|pop_back|emplace_back|insert|erase|size|at|front|back|empty|clear|begin|end)\s*\(/.test(c)) return ok('✅ صحيح! عملية على حاوية STL.');

      return er('❌ غير صحيح — مثال: <code>int nums[] = {1,2,3};</code> أو <code>vector&lt;int&gt; v = {1,2,3};</code>');
    }

    function csArr(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'csharp'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      if (/^(int|long|short|byte|double|float|decimal|string|bool|char|object|[A-Z]\w*)\[\]\s+\w+\s*=\s*(new\s+(int|long|short|byte|double|float|decimal|string|bool|char|object|[A-Z]\w*)\[\]\s*)?\{[\s\S]*\}\s*;$/.test(c)) {
        const inner = bracketContent(c, '{', '}');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}. مثال: <code>{1, 2, 3}</code>.`);
        return ok('✅ صحيح! مصفوفة في C#.');
      }
      if (/^(int|long|short|byte|double|float|decimal|string|bool|char|object|[A-Z]\w*)\[\]\s+\w+\s*=\s*new\s+(int|long|short|byte|double|float|decimal|string|bool|char|object|[A-Z]\w*)\s*\[\s*\d+\s*\]\s*;$/.test(c)) return ok('✅ صحيح! مصفوفة بحجم محدد.');
      if (/^(var\s+|List<[^>]+>\s+)\w+\s*=\s*new\s+List<[^>]+>/.test(c)) return ok('✅ ممتاز! <code>List&lt;T&gt;</code> مرنة.');
      if (/^(var\s+|Dictionary<[^>]+>\s+)\w+\s*=\s*new\s+Dictionary/.test(c)) return ok('✅ صحيح! <code>Dictionary&lt;K,V&gt;</code>.');
      // var x = something.LinqMethod(...).Chain(...)
      if (/^(var|int|long|short|byte|double|float|decimal|string|bool|object|[A-Z]\w*(?:<[^>]+>)?(?:\[\])?|List<[^>]+>|IEnumerable<[^>]+>)\s+\w+\s*=\s*\S.*\.\s*(Where|Select|SelectMany|OrderBy|OrderByDescending|GroupBy|ToList|ToArray|ToDictionary|FirstOrDefault|First|LastOrDefault|Last|Any|All|Count|Sum|Min|Max|Average|Distinct|Skip|Take|TakeWhile|SkipWhile|Reverse|Concat|Union|Intersect|Except|Zip|Aggregate|Cast|OfType)\s*\(/.test(c)) return ok('✅ ممتاز! LINQ في C#.');
      if (/^\w+\.(Add|Remove|RemoveAt|Insert|Contains|Sort|Reverse|Clear|Count|IndexOf|Find)\s*/.test(c)) return ok('✅ صحيح! عملية على List/Array.');
      if (/^\w+\.(Where|Select|OrderBy|GroupBy|ToList|ToArray|FirstOrDefault|Any|All|Count)\s*\(/.test(c)) return ok('✅ ممتاز! LINQ في C#.');

      return er('❌ غير صحيح — مثال: <code>int[] nums = {1, 2, 3};</code>');
    }

    function ktArr(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'kotlin'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Kotlin ما تستخدم <code>;</code>.');

      if (/^(int|long|double|String)\[\]/.test(c)) return er('❌ هذا أسلوب Java — في Kotlin: <code>val nums = listOf(1, 2, 3)</code>');

      if (/^(val|var)\s+\w+\s*=\s*(listOf|mutableListOf|arrayOf|intArrayOf|doubleArrayOf|longArrayOf|floatArrayOf|booleanArrayOf|charArrayOf|setOf|mutableSetOf|mapOf|mutableMapOf|emptyList|emptySet|emptyMap)\s*\(/.test(c)) {
        // Validate elements inside (...)
        const fnNameMatch = c.match(/=\s*(\w+)\s*\(/);
        const fnIdx = c.indexOf('(', fnNameMatch.index + fnNameMatch[0].indexOf('('));
        const inner = firstParens(c, fnNameMatch.index);
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المجموعة — ${bad}. مثال: <code>listOf(1, 2, 3)</code>.`);
        return ok('✅ صحيح! مجموعة في Kotlin.');
      }
      if (/^(val|var)\s+\w+\s*:\s*(List|MutableList|Array|IntArray|DoubleArray|FloatArray|BooleanArray|CharArray|Set|MutableSet|Map|MutableMap)\s*<[^>]*>/.test(c)) return ok('✅ صحيح! تعريف مع النوع.');
      // val/var x = collection.method { ... }  or  collection.method(...)
      if (/^(val|var)\s+\w+\s*=\s*\S.*\.\s*(map|filter|filterNot|reduce|fold|sorted|sortedBy|sortedDescending|groupBy|associate|associateBy|associateWith|forEach|any|all|none|first|last|firstOrNull|lastOrNull|find|findLast|count|sum|min|max|distinct|distinctBy|chunked|windowed|zip|unzip|take|takeLast|takeWhile|drop|dropLast|dropWhile|flatMap|flatten|partition|joinToString|toList|toMutableList|toSet|toMutableSet|toMap)\s*[\({]/.test(c)) return ok('✅ صحيح! نتيجة عملية على مجموعة.');
      if (/^\w+\.(add|remove|removeAt|get|set|size|filter|map|reduce|any|all|none|first|last|firstOrNull|find|contains|forEach|sorted|sortedBy|groupBy)\s*\(?/.test(c)) return ok('✅ صحيح! عملية على مجموعة.');

      return er('❌ غير صحيح — مثال: <code>val nums = listOf(1, 2, 3)</code> أو <code>val names = mutableListOf("علي")</code>');
    }

    function phpArr(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'php'); if (rj) return rj;
      if (!c.endsWith(';')) return er('❌ ناقصت الفاصلة المنقوطة <code>;</code>.');

      // Array funcs at start (no $)
      if (/^(array_push|array_pop|array_shift|array_unshift|array_merge|array_map|array_filter|array_reduce|array_search|array_keys|array_values|array_combine|sort|rsort|asort|arsort|ksort|krsort|usort|count|in_array|array_key_exists)\s*\(/.test(c)) return ok('✅ صحيح! دالة مصفوفة في PHP.');

      if (!/^\$/.test(c)) return er('❌ في PHP المصفوفات بمتغيرات تبدأ بـ <code>$</code>: <code>$nums = [1, 2, 3];</code>');

      if (/^\$\w+\s*=\s*\[/.test(c)) {
        const inner = bracketContent(c, '[', ']');
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}. مثال: <code>[1, 2, 3]</code>.`);
        return ok('✅ صحيح! مصفوفة في PHP.');
      }
      if (/^\$\w+\s*=\s*array\s*\(/.test(c)) {
        const startIdx = c.indexOf('array');
        const inner = firstParens(c, startIdx + 5);
        const bad = arrayElementsCheck(inner);
        if (bad) return er(`❌ خطأ في عناصر المصفوفة — ${bad}. مثال: <code>array(1, 2, 3)</code>.`);
        return ok('✅ صحيح! مصفوفة بالصياغة القديمة (يعمل لكن <code>[]</code> أحدث).');
      }
      // $x = array_map(...) and other array funcs as RHS
      if (/^\$\w+\s*=\s*(array_map|array_filter|array_reduce|array_merge|array_combine|array_slice|array_splice|array_keys|array_values|array_unique|array_reverse|array_search|array_flip|array_fill|array_diff|array_intersect|array_count_values|array_column|array_chunk|range|compact)\s*\(/.test(c)) return ok('✅ صحيح! نتيجة دالة مصفوفة في PHP.');
      if (/^\$\w+\[\s*[^\]]*\s*\]\s*=/.test(c)) return ok('✅ صحيح! تعيين عنصر في المصفوفة.');
      if (/^\$\w+\[\]\s*=/.test(c)) return ok('✅ صحيح! إضافة عنصر في النهاية.');

      return er('❌ غير صحيح — مثال: <code>$nums = [1, 2, 3];</code>');
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS — OOP
    // ════════════════════════════════════════════════════════════════

    function javaOop(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'java'); if (rj) return rj;

      if (/^class\s+[a-z]/.test(c)) return wn('⚠️ يعمل لكن اتفاقية Java: أسماء الكلاسات بحرف كبير (PascalCase): <code>class Car</code>.');

      // class/interface with full body { ... } — validate body for missing-;
      const classWithBody = c.match(/^(?:(?:public|private|protected|static|final|abstract)\s+)*(?:class|interface|enum)\s+[A-Z]\w*[^{]*\{([\s\S]*)\}\s*$/);
      if (classWithBody) {
        const body = classWithBody[1];
        const stripped = stripStrings(body); if (stripped === null) return er('❌ علامة تنصيص غير مغلقة في جسم الكلاس.');
        // Strip method bodies (balanced inner { ... }) so we only check field-level statements
        let bodyNoMethods = '', depth = 0;
        for (let i = 0; i < stripped.length; i++) {
          const ch = stripped[i];
          if (ch === '{') { depth++; continue; }
          if (ch === '}') { depth--; continue; }
          if (depth === 0) bodyNoMethods += ch;
        }
        const javaTypeAlt = 'int|long|short|byte|double|float|char|boolean|String|Object|void|var';
        const stmts = bodyNoMethods.split(';').map(s => s.trim()).filter(Boolean);
        for (const s of stmts) {
          if (smashedDeclarations(s, javaTypeAlt)) {
            return er(`❌ يبدو أن في جسم الكلاس فاصلة منقوطة <code>;</code> ناقصة — لا يمكن دمج تعريفَين بدون فاصل. تحقق من: <code>${s.trim().slice(0,60)}</code>`);
          }
        }
        return ok('✅ صحيح! تعريف كلاس مع جسم في Java.');
      }

      if (/^(?:public\s+|private\s+|protected\s+|static\s+|final\s+|abstract\s+)*class\s+[A-Z]\w*(?:\s+extends\s+\w+)?(?:\s+implements\s+[\w,\s.]+)?\s*\{?$/.test(c)) return ok('✅ صحيح! تعريف كلاس في Java.');
      if (/^(?:public\s+)?interface\s+[A-Z]\w*(?:\s+extends\s+[\w,\s.]+)?\s*\{?$/.test(c)) return ok('✅ صحيح! تعريف Interface في Java.');
      if (/^(?:public\s+)?enum\s+[A-Z]\w*/.test(c)) return ok('✅ صحيح! تعريف <code>enum</code> في Java.');
      if (/^@(?:Override|Deprecated|FunctionalInterface|SuppressWarnings|Nullable|NonNull|\w+)\b/.test(c)) return ok('✅ صحيح! Annotation في Java.');
      // method
      if (/^(?:(?:public|private|protected|static|final|abstract|synchronized)\s+)*(?:[A-Z]\w*(?:<[^>]+>)?|void|int|long|short|byte|double|float|char|boolean|String)(?:\[\])?\s+[a-zA-Z_]\w*\s*\(/.test(c)) {
        return ok('✅ صحيح! تعريف method في كلاس Java.');
      }
      // field
      if (/^(?:public|private|protected)\s+(?:static\s+)?(?:final\s+)?(?:int|long|short|byte|double|float|char|boolean|String|[A-Z]\w*(?:<[^>]+>)?(?:\[\])?)\s+[a-zA-Z_]\w*\s*[;=]/.test(c)) {
        return ok('✅ صحيح! تعريف field في كلاس Java.');
      }
      // constructor: ClassName(...)  (method-like but matches uppercase identifier directly)
      if (/^(?:public|private|protected)\s+[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! Constructor في كلاس Java.');
      if (/^new\s+[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! إنشاء Object عبر <code>new</code>.');
      if (/^this\.\w+\s*=/.test(c) || /^super\s*\(/.test(c)) return ok('✅ صحيح! استخدام <code>this</code>/<code>super</code>.');

      return er('❌ غير صحيح — مثال: <code>public class Car { private String brand; public Car(String b) { this.brand = b; } }</code>');
    }

    function pyOop(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'python'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Python ما تستخدم <code>;</code>.');

      if (/^class\s+[a-z]/.test(c)) return wn('⚠️ اتفاقية Python: أسماء الكلاسات بحرف كبير (PascalCase): <code>class Car:</code>.');
      if (/^class\s+[A-Z]\w*(?:\s*\([^)]*\))?\s*:\s*$/.test(c)) return ok('✅ صحيح! تعريف كلاس في Python.');
      if (/^def\s+__init__\s*\(\s*self/.test(c) && c.includes(':')) return ok('✅ صحيح! Constructor (<code>__init__</code>) في Python.');
      if (/^def\s+\w+\s*\(\s*self/.test(c) && c.includes(':')) return ok('✅ صحيح! method في الكلاس (مع <code>self</code>).');
      if (/^def\s+\w+\s*\(\s*cls/.test(c) && c.includes(':')) return ok('✅ صحيح! classmethod.');
      if (/^def\s+\w+\s*\((?!.*\bself\b)(?!.*\bcls\b)/.test(c) && c.includes(':')) return wn('⚠️ دوال الكلاس عادةً تحتاج <code>self</code> كأول معامل: <code>def myMethod(self):</code>');
      if (/^self\.\w+\s*=/.test(c)) return ok('✅ صحيح! تعيين خاصية على الكائن.');
      if (/^@(?:property|staticmethod|classmethod|abstractmethod|dataclass|\w+)/.test(c)) return ok('✅ صحيح! Decorator في Python.');
      if (/^[a-zA-Z_]\w*\s*=\s*[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! إنشاء Object في Python.');

      return er('❌ غير صحيح — مثال: <code>class Car:</code> أو <code>def __init__(self, brand):</code>');
    }

    function jsOop(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'js'); if (rj) return rj;

      if (/^class\s+[a-z]/.test(c)) return wn('⚠️ اتفاقية JS: أسماء الكلاسات بحرف كبير (PascalCase).');
      if (/^(?:export\s+)?(?:default\s+)?class\s+[A-Z]\w*(?:\s+extends\s+\w+)?\s*\{?\s*$/.test(c)) return ok('✅ صحيح! تعريف كلاس في JavaScript.');
      if (/^constructor\s*\(/.test(c)) return ok('✅ صحيح! Constructor.');
      if (/^#\w+(?:\s*=|\s*;)/.test(c)) return ok('✅ ممتاز! Private field (<code>#</code>) في ES2022.');
      if (/^(?:get|set)\s+\w+\s*\(/.test(c)) return ok('✅ صحيح! Getter/Setter.');
      if (/^(?:static\s+)?(?:async\s+)?#?\w+\s*\(.*\)\s*\{?\s*$/.test(c)) return ok('✅ صحيح! Method في كلاس.');
      if (/^new\s+[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! إنشاء Object.');
      if (/^this\.\w+\s*=/.test(c) || /^super\s*\(/.test(c)) return ok('✅ صحيح!');

      return er('❌ غير صحيح — مثال: <code>class Car { #brand; constructor(brand) { this.#brand = brand; } }</code>');
    }

    function cppOop(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'cpp'); if (rj) return rj;

      if (/^class\s+[a-z]/.test(c)) return wn('⚠️ اتفاقية C++: أسماء الكلاسات بحرف كبير.');
      if (/^class\s+[A-Z]\w*(?:\s*:\s*(?:public|private|protected)\s+[\w:]+)?\s*\{?\s*\}?\s*;?\s*$/.test(c)) {
        if (c.endsWith('}') && !c.endsWith('};')) return wn('⚠️ في C++ تعريف الكلاس ينتهي بـ <code>};</code> (مع فاصلة منقوطة).');
        return ok('✅ صحيح! تعريف كلاس في C++.');
      }
      if (/^struct\s+[A-Z]\w*/.test(c)) return ok('✅ صحيح! <code>struct</code> في C++.');
      if (/^(?:public|private|protected)\s*:\s*$/.test(c)) return ok('✅ صحيح! مستوى وصول في C++.');
      if (/^virtual\s+/.test(c)) return ok('✅ صحيح! <code>virtual</code> function — ضرورية للـ Polymorphism.');
      if (/^[A-Z]\w*\s*::\s*[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! تعريف Constructor خارج الكلاس.');
      if (/^[A-Z]\w*\s*::\s*[~]?\w+\s*\(/.test(c)) return ok('✅ صحيح! تعريف method/destructor خارج الكلاس.');
      if (/^new\s+[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! إنشاء Object على Heap — لا تنسَ <code>delete</code>.');
      if (/^[A-Z]\w*\s+\w+\s*(?:\([^)]*\))?\s*;/.test(c)) return ok('✅ صحيح! إنشاء Object على Stack.');

      return er('❌ غير صحيح — مثال: <code>class Car { private: string brand; public: Car(string b); };</code>');
    }

    function csOop(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'csharp'); if (rj) return rj;

      if (/^class\s+[a-z]/.test(c)) return wn('⚠️ اتفاقية C#: أسماء الكلاسات بحرف كبير (PascalCase).');
      // class/struct/etc. with body — validate the body for missing-; bugs
      const classWithBody = c.match(/^(?:public|private|protected|internal|abstract|sealed|static)?\s*(?:partial\s+)?(?:class|interface|struct|record)\s+[A-Z]\w*[^{]*\{([\s\S]*)\}\s*$/);
      if (classWithBody) {
        const body = classWithBody[1];
        // Split body by top-level ; — each statement must be self-contained
        const stripped = stripStrings(body); if (stripped === null) return er('❌ علامة تنصيص غير مغلقة في جسم الكلاس.');
        // Walk through, splitting by ; or by complete { ... } method bodies
        const csTypeAlt = 'int|long|short|byte|double|float|decimal|bool|char|string|object|void|var';
        // Strip method bodies (balanced { ... }) so we only check field-like statements
        let bodyNoMethods = '', depth = 0, buf = '';
        for (let i = 0; i < stripped.length; i++) {
          const ch = stripped[i];
          if (ch === '{') { depth++; if (depth === 1) continue; }
          if (ch === '}') { depth--; if (depth === 0) continue; }
          if (depth === 0) bodyNoMethods += ch;
        }
        // Now bodyNoMethods has fields + method headers. Split by ;
        const stmts = bodyNoMethods.split(';').map(s => s.trim()).filter(Boolean);
        for (const s of stmts) {
          // Map back to original (approximate — get same span from body)
          if (smashedDeclarations(s, csTypeAlt)) {
            return er(`❌ يبدو أن في جسم الكلاس فاصلة منقوطة <code>;</code> ناقصة — لا يمكن دمج تعريفَين بدون فاصل. تحقق من: <code>${s.trim().slice(0,60)}</code>`);
          }
        }
        return ok('✅ صحيح! تعريف كلاس مع جسم في C#.');
      }
      if (/^(?:public|private|protected|internal|abstract|sealed|static)?\s*(?:partial\s+)?(?:class|interface|struct|record|enum)\s+[A-Z]\w*/.test(c)) return ok('✅ صحيح! تعريف نوع في C#.');
      if (/^(?:public|private|protected|internal)\s+(?:override\s+|virtual\s+|abstract\s+|sealed\s+|static\s+|async\s+)*(?:void|int|long|short|byte|double|float|decimal|bool|char|string|object|var|Task(?:<[^>]+>)?|[A-Z]\w*(?:<[^>]+>)?(?:\[\])?)\s+[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! method في كلاس C#.');
      if (/^(?:public|private|protected|internal)\s+(?:int|string|bool|double|decimal|float|long|char|[A-Z]\w*(?:<[^>]+>)?)\s+\w+\s*\{\s*(?:get|set)/.test(c)) return ok('✅ ممتاز! Property في C#.');
      if (/^(?:public|private|protected|internal)\s+(?:readonly\s+|static\s+|const\s+)*(?:int|string|bool|double|[A-Z]\w*(?:<[^>]+>)?(?:\[\])?)\s+\w+\s*[;=]/.test(c)) return ok('✅ صحيح! field في C#.');
      if (/^(?:public|private|protected|internal)\s+[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! Constructor في C#.');
      if (/^new\s+[A-Z]\w*\s*[\({]/.test(c)) return ok('✅ صحيح! إنشاء Object.');
      if (/^\[/.test(c)) return ok('✅ صحيح! Attribute في C#.');

      return er('❌ غير صحيح — مثال: <code>public class Car { private string brand; public string Brand { get; set; } }</code>');
    }

    function ktOop(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      const rj = rejectWrongLang(c, 'kotlin'); if (rj) return rj;
      if (c.endsWith(';')) return er('❌ Kotlin ما تستخدم <code>;</code>.');

      if (/^class\s+[a-z]/.test(c)) return wn('⚠️ اتفاقية Kotlin: أسماء الكلاسات بحرف كبير (PascalCase).');

      // Class declaration with constructor parameters → validate each param
      const ctorM = c.match(/^(?:(?:open|abstract|sealed|inner|inline|enum|data)\s+)*class\s+[A-Z]\w*(?:<[^>]+>)?\s*\(/);
      if (ctorM) {
        if (!balancedParens(c)) return er('❌ الأقواس غير متوازنة.');
        const startIdx = c.indexOf('(', ctorM[0].length - 1);
        const params = firstParens(c, startIdx);
        if (params === null) return er('❌ الأقواس غير متوازنة.');
        const t = params.trim();
        if (t) {
          const parts = t.split(',').map(p => p.trim());
          for (const p of parts) {
            if (!p) continue;
            // Each constructor param: [vararg] [val|var] name: Type [= default]
            if (!/^(?:vararg\s+)?(?:(?:val|var|private\s+val|private\s+var|public\s+val|public\s+var|protected\s+val|protected\s+var|internal\s+val|internal\s+var|override\s+val|override\s+var)\s+)?[a-zA-Z_]\w*\s*:\s*[A-Z]\w*(?:<[^>]+>)?(?:\?)?(?:\s*=\s*[^,]+)?$/.test(p)) {
              return er(`❌ معامل الـ Constructor <code>${p}</code> غير صحيح — لازم <code>name: Type</code> (مع نقطتَين). مثال: <code>val brand: String</code>.`);
            }
          }
        }
        if (/^data\s+class/.test(c)) return ok('✅ ممتاز! <code>data class</code> — تولّد تلقائياً <code>toString/equals/copy</code>.');
        return ok('✅ صحيح! تعريف كلاس مع Constructor في Kotlin.');
      }

      if (/^(?:open\s+|abstract\s+|sealed\s+|inner\s+|inline\s+|enum\s+)?class\s+[A-Z]\w*(?:\s*:\s*[A-Z]\w*(?:\([^)]*\))?)?\s*\{?\s*\}?$/.test(c)) return ok('✅ صحيح! تعريف كلاس في Kotlin.');
      if (/^interface\s+[A-Z]\w*/.test(c)) return ok('✅ صحيح! Interface في Kotlin.');
      if (/^object\s+[A-Z]\w*/.test(c)) return ok('✅ صحيح! Singleton (<code>object</code>) في Kotlin.');
      if (/^companion\s+object/.test(c)) return ok('✅ صحيح! Companion Object.');
      if (/^(?:override\s+)?(?:open\s+)?(?:val|var)\s+\w+/.test(c)) return ok('✅ صحيح! خاصية كلاس.');
      if (/^(?:override\s+)?(?:open\s+|abstract\s+|inline\s+|suspend\s+|private\s+|protected\s+|public\s+|internal\s+)*fun\s+\w+/.test(c)) return ok('✅ صحيح! method في الكلاس.');
      if (/^init\s*\{/.test(c)) return ok('✅ صحيح! <code>init</code> block.');
      if (/^[a-zA-Z_]\w*\s*=\s*[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! إنشاء Object.');

      return er('❌ غير صحيح — مثال: <code>class Car(val brand: String)</code> أو <code>data class Student(val name: String, val age: Int)</code>');
    }

    function phpOop(c) {
      c = c.trim();
      if (!c) return er('❌ الكود فارغ');
      if (unclosedString(c)) return er('❌ علامة تنصيص غير مغلقة.');
      // Arabic chars OUTSIDE strings = invalid PHP identifier (e.g., $brandــــــ).
      // Arabic INSIDE "…" / '…' / `…` is fine — those become placeholders after stripStrings.
      if (hasArabicOutsideStrings(c)) return er('❌ الكود يحتوي على أحرف عربية خارج علامات التنصيص — في PHP أسماء المتغيرات والكلاسات والـ methods لازم تكون لاتينية (<code>a-z, 0-9, _</code>). النصوص العربية يجب أن تكون بين <code>"..."</code>.');
      const rj = rejectWrongLang(c, 'php'); if (rj) return rj;

      if (/^class\s+[a-z]/.test(c)) return wn('⚠️ اتفاقية PHP (PSR-1): أسماء الكلاسات بحرف كبير (PascalCase).');

      // Multi-line class with full body { ... } — validate each member
      const classWithBody = c.match(/^(?:(?:abstract|final|readonly)\s+)*class\s+[A-Z]\w*(?:\s+extends\s+\w+)?(?:\s+implements\s+[\w,\s\\]+)?\s*\{([\s\S]*)\}\s*$/);
      if (classWithBody) {
        const rawBody = classWithBody[1];
        // Strip // and /* */ comments before structural analysis
        const noComments = rawBody.replace(/\/\/[^\n]*/g, '').replace(/#[^\n]*/g, '').replace(/\/\*[\s\S]*?\*\//g, '');
        const stripped = stripStrings(noComments);
        if (stripped === null) return er('❌ علامة تنصيص غير مغلقة في جسم الكلاس.');
        // Strip nested method bodies { ... } so we only inspect member declarations
        let bodyNoMethods = '', depth = 0;
        for (let i = 0; i < stripped.length; i++) {
          const ch = stripped[i];
          if (ch === '{') { depth++; continue; }
          if (ch === '}') { depth--; continue; }
          if (depth === 0) bodyNoMethods += ch;
        }
        // Split by top-level ; — each piece is a member declaration
        const stmts = bodyNoMethods.split(';').map(s => s.trim()).filter(Boolean);
        for (const s of stmts) {
          // Property:  [vis] [static|readonly|abstract|final]* [?type]? $name [= default]
          const propRe = /^(?:public|private|protected)\s+(?:(?:static|readonly|abstract|final)\s+)*(?:\??[\w\\|]+\s+)?\$\w+(?:\s*=\s*[\s\S]+)?$/;
          // Method header (no body — body was stripped):
          //   [vis] [static|abstract|final]* function name(...) [: ReturnType]
          const methodRe = /^(?:public|private|protected)\s+(?:(?:static|abstract|final)\s+)*function\s+\w+\s*\([\s\S]*\)(?:\s*:\s*\??[\w\\|]+)?$/;
          // const NAME = value
          const constRe  = /^(?:(?:public|private|protected)\s+)?const\s+\w+\s*=\s*[\s\S]+$/;
          // use Trait
          const useRe    = /^use\s+[\w\\,\s]+$/;
          if (propRe.test(s) || methodRe.test(s) || constRe.test(s) || useRe.test(s)) continue;
          // Visibility but missing $ on field name → friendlier message
          if (/^(?:public|private|protected)\s+\w/.test(s) && !s.includes('$') && !/\bfunction\b/.test(s) && !/\bconst\b/.test(s)) {
            return er(`❌ خاصية بدون <code>$</code>: <code>${s.slice(0,80)}</code> — في PHP الخصائص لازم <code>$</code>: <code>private $brand;</code>`);
          }
          // Two declarations smashed without ; in between
          if (/\$\w+[\s\S]*\$\w+/.test(s)) {
            return er(`❌ يبدو أن في جسم الكلاس فاصلة منقوطة <code>;</code> ناقصة بين الأعضاء. تحقق من: <code>${s.slice(0,80)}</code>`);
          }
          return er(`❌ تعريف غير صحيح في جسم الكلاس: <code>${s.slice(0,80)}</code>. مثال صحيح: <code>private $brand;</code> أو <code>public function f() {}</code>`);
        }
        return ok('✅ صحيح! تعريف كلاس مع جسم في PHP.');
      }

      if (/^(?:abstract\s+|final\s+|readonly\s+)?class\s+[A-Z]\w*(?:\s+extends\s+\w+)?(?:\s+implements\s+[\w,\s\\]+)?\s*\{?$/.test(c)) return ok('✅ صحيح! تعريف كلاس في PHP.');
      if (/^interface\s+[A-Z]\w*/.test(c)) return ok('✅ صحيح! Interface.');
      if (/^trait\s+[A-Z]\w*/.test(c)) return ok('✅ صحيح! Trait (للوراثة المتعددة).');
      if (/^(?:public|private|protected)\s+(?:(?:static|readonly|abstract|final)\s+)*(?:(?:\??[\w\\|]+)\s+)?(?:function\s+\w+|\$\w+)/.test(c)) return ok('✅ صحيح! عضو كلاس في PHP.');
      if (/^function\s+__\w+\s*\(/.test(c)) return ok('✅ صحيح! Magic Method.');
      if (/^\$this->\w+/.test(c)) return ok('✅ صحيح! الوصول لخاصية عبر <code>$this</code>.');
      if (/^(?:parent|self|static)::\w+/.test(c)) return ok('✅ صحيح! استدعاء عضو من الكلاس الأب/الحالي.');
      if (/^new\s+[A-Z]\w*\s*\(/.test(c)) return ok('✅ صحيح! إنشاء Object.');

      return er('❌ غير صحيح — مثال: <code>class Car { private $brand; public function __construct($b) { $this->brand = $b; } }</code>');
    }

    // ════════════════════════════════════════════════════════════════
    //  VALIDATORS MAP — frozen, lookup by section id
    // ════════════════════════════════════════════════════════════════

    const validators = Object.freeze({
      'vars-java':    javaVar,   'vars-python': pyVar,    'vars-js':    jsVar,
      'vars-cpp':     cppVar,    'vars-csharp': csVar,    'vars-kotlin':ktVar,
      'vars-php':     phpVar,
      'pr-java':      javaPrint, 'pr-python':   pyPrint,  'pr-js':      jsPrint,
      'pr-cpp':       cppPrint,  'pr-csharp':   csPrint,  'pr-kotlin':  ktPrint,
      'pr-php':       phpPrint,
      'for-java':     javaFor,   'for-python':  pyFor,    'for-js':     jsFor,
      'for-cpp':      cppFor,    'for-csharp':  csFor,    'for-kotlin': ktFor,
      'for-php':      phpFor,
      'cond-java':    javaCond,  'cond-python': pyCond,   'cond-js':    jsCond,
      'cond-cpp':     cppCond,   'cond-csharp': csCond,   'cond-kotlin':ktCond,
      'cond-php':     phpCond,
      'sw-java':      javaSw,    'sw-python':   pySw,     'sw-js':      jsSw,
      'sw-cpp':       cppSw,     'sw-csharp':   csSw,     'sw-kotlin':  ktSw,
      'sw-php':       phpSw,
      'fn-java':      javaFn,    'fn-python':   pyFn,     'fn-js':      jsFn,
      'fn-cpp':       cppFn,     'fn-csharp':   csFn,     'fn-kotlin':  ktFn,
      'fn-php':       phpFn,
      'arr-java':     javaArr,   'arr-python':  pyArr,    'arr-js':     jsArr,
      'arr-cpp':      cppArr,    'arr-csharp':  csArr,    'arr-kotlin': ktArr,
      'arr-php':      phpArr,
      'oop-java':     javaOop,   'oop-python':  pyOop,    'oop-js':     jsOop,
      'oop-cpp':      cppOop,    'oop-csharp':  csOop,    'oop-kotlin': ktOop,
      'oop-php':      phpOop,
    });

    // ════════════════════════════════════════════════════════════════
    //  CHECK / RENDER / TAMPER-DETECT
    // ════════════════════════════════════════════════════════════════

    const stateMap = new WeakMap(); // result element → { kind, msg }

    function safeRun(fn, code) {
      try { return fn(code); } catch (e) { return er('❌ خطأ في معالجة الكود — راجع الصياغة.'); }
    }

    function renderResult(boxEl, taEl, resultEl, kind, msg) {
      // Set DOM first
      resultEl.className = 'quiz-result show ' + kind;
      resultEl.innerHTML = msg;
      // Snapshot the BROWSER-NORMALIZED innerHTML — not the input msg.
      // The browser may rewrite raw '>' inside <code> to '&gt;' (e.g. PHP "$this->x"),
      // and comparing to the un-normalized input would cause an infinite observer loop.
      stateMap.set(resultEl, { kind, msg: resultEl.innerHTML });
      taEl.classList.remove('valid', 'invalid');
      if (kind === 'ok') taEl.classList.add('valid');
      else if (kind === 'err' || kind === 'warn') taEl.classList.add('invalid');
    }

    function clearResult(boxEl) {
      const ta = boxEl.querySelector('.quiz-textarea');
      const result = boxEl.querySelector('.quiz-result');
      if (result) {
        stateMap.delete(result);
        result.className = 'quiz-result';
        result.innerHTML = '';
      }
      if (ta) ta.classList.remove('valid', 'invalid');
    }

    function checkCodeImpl(sectionId, btn) {
      const box = btn && btn.closest ? btn.closest('.quiz-box') : null;
      if (!box) return;
      const ta = box.querySelector('.quiz-textarea');
      const result = box.querySelector('.quiz-result');
      if (!ta || !result) return;
      const code = ta.value.trim();
      if (!code) { renderResult(box, ta, result, 'warn', '💬 اكتب كوداً أولاً لنتحقق منه.'); return; }
      const v = validators[sectionId];
      if (!v) { renderResult(box, ta, result, 'err', '⚠️ لا يوجد فاحص لهذا القسم.'); return; }
      const res = safeRun(v, code);
      renderResult(box, ta, result, res.kind, res.msg);
    }

    function insertHintImpl(chip) {
      const box = chip && chip.closest ? chip.closest('.quiz-box') : null;
      if (!box) return;
      const ta = box.querySelector('.quiz-textarea');
      if (!ta) return;
      ta.value = chip.textContent.trim();
      clearResult(box);
      ta.focus();
    }

    // ─── MutationObserver: detect manual DOM tampering on .quiz-result ───
    const observerOpts = { attributes: true, childList: true, subtree: false, characterData: false };
    let resultObserver = null;

    function setupResultObserver() {
      if (resultObserver) resultObserver.disconnect();
      resultObserver = new MutationObserver((records) => {
        const seen = new Set();
        for (const r of records) {
          const el = r.target;
          if (!(el instanceof Element)) continue;
          if (!el.classList.contains('quiz-result')) continue;
          if (seen.has(el)) continue;
          seen.add(el);
          const stored = stateMap.get(el);
          if (!stored) {
            // No legitimate state, but DOM was modified to show something
            if (el.classList.contains('show') || el.innerHTML.length > 0) {
              el.className = 'quiz-result';
              el.innerHTML = '';
            }
            continue;
          }
          const expectedClass = 'quiz-result show ' + stored.kind;
          if (el.className !== expectedClass) el.className = expectedClass;
          if (el.innerHTML !== stored.msg) el.innerHTML = stored.msg;
        }
      });
      document.querySelectorAll('.quiz-result').forEach(r => resultObserver.observe(r, observerOpts));
    }

    function setupInputInvalidation() {
      document.querySelectorAll('.quiz-textarea').forEach(ta => {
        ta.addEventListener('input', () => {
          const box = ta.closest('.quiz-box');
          if (!box) return;
          clearResult(box);
        });
        // Also clear on programmatic value changes via a periodic check
        let lastValue = ta.value;
        Object.defineProperty(ta, '__lastQuizValue', { value: lastValue, writable: true, configurable: false });
      });
    }

    // Also detect when textarea value is changed programmatically (.value = '...' from console)
    // by intercepting the prototype setter
    try {
      const proto = HTMLTextAreaElement.prototype;
      const desc = Object.getOwnPropertyDescriptor(proto, 'value');
      if (desc && desc.configurable && desc.set) {
        const origSet = desc.set;
        Object.defineProperty(proto, 'value', {
          get: desc.get,
          set: function (v) {
            origSet.call(this, v);
            if (this.classList && this.classList.contains('quiz-textarea')) {
              const box = this.closest && this.closest('.quiz-box');
              if (box) clearResult(box);
            }
          },
          configurable: true,
          enumerable: desc.enumerable
        });
      }
    } catch (e) { /* prototype may be locked — proceed */ }

    // ─── Expose checkCode / insertHint as NON-OVERRIDABLE ───
    function expose(name, fn) {
      try {
        Object.defineProperty(window, name, {
          value: fn,
          writable: false,
          configurable: false,
          enumerable: false
        });
      } catch (e) {
        try { window[name] = fn; } catch (_) {}
      }
    }
    expose('checkCode', checkCodeImpl);
    expose('insertHint', insertHintImpl);

    // ─── Boot ───
    function boot() { setupResultObserver(); setupInputInvalidation(); }
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', boot, { once: true });
    } else { boot(); }
  })();

