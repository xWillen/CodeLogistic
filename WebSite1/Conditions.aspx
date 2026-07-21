<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Conditions.aspx.cs" Inherits="ConditionsPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — If/While / الشروط</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>🔀 If-Else · While · Do-While</h2>
    <p>مقارنة الجمل الشرطية والحلقات في لغات مختلفة</p>
  </div>
  <div class="content-wrap">
    <div class="topic-nav">
      <button type="button" class="topic-btn active" onclick="showTopic('cond','java',this)">Java</button>
      <button type="button" class="topic-btn" onclick="showTopic('cond','python',this)">Python</button>
      <button type="button" class="topic-btn" onclick="showTopic('cond','js',this)">JavaScript</button>
      <button type="button" class="topic-btn" onclick="showTopic('cond','cpp',this)">++C</button>
      <button type="button" class="topic-btn" onclick="showTopic('cond','csharp',this)">#C</button>
      <button type="button" class="topic-btn" onclick="showTopic('cond','kotlin',this)">Kotlin</button>
      <button type="button" class="topic-btn" onclick="showTopic('cond','php',this)">PHP</button>
    </div>

    <!-- ═══════════════════════ JAVA ═══════════════════════ -->
    <div class="topic-section active" id="cond-java">
      <div class="section-title">If · While · Do-While في Java</div>
      <div class="lang-grid">

        <div class="lang-card java">
          <div class="lang-header">If — Else If — Else</div>
<pre><span class="kw">int</span> score = <span class="num">75</span>;                    <span class="cm">// درجة الطالب</span>

<span class="kw">if</span> (score >= <span class="num">90</span>) {                 <span class="cm">// إذا كانت الدرجة 90 فأكثر</span>
    System.out.<span class="fn">println</span>(<span class="str">"ممتاز 🌟"</span>);
} <span class="kw">else if</span> (score >= <span class="num">70</span>) {         <span class="cm">// إذا كانت 70 فأكثر (دون 90)</span>
    System.out.<span class="fn">println</span>(<span class="str">"جيد جداً 👍"</span>);
} <span class="kw">else if</span> (score >= <span class="num">60</span>) {         <span class="cm">// إذا كانت 60 فأكثر</span>
    System.out.<span class="fn">println</span>(<span class="str">"جيد"</span>);
} <span class="kw">else</span> {                            <span class="cm">// كل ما دون 60</span>
    System.out.<span class="fn">println</span>(<span class="str">"راسب ❌"</span>);
}

<span class="cm">// Ternary — بديل مختصر لـ if-else بسيط</span>
<span class="kw">String</span> result = (score >= <span class="num">60</span>) ? <span class="str">"ناجح"</span> : <span class="str">"راسب"</span>;
System.out.<span class="fn">println</span>(result);        <span class="cm">// ناجح</span>

<span class="cm">// شرط مركّب بـ && و||</span>
<span class="kw">boolean</span> teen = (score >= <span class="num">60</span> && score &lt; <span class="num">90</span>); <span class="cm">// بين 60 و90</span>
<span class="kw">boolean</span> ex   = (score >= <span class="num">90</span> || score == <span class="num">0</span>);  <span class="cm">// ممتاز أو صفر</span></pre>
          <div class="lang-desc">Java تحتاج أقواساً <code>{}</code> دائماً حول الجسم حتى لو سطر واحد — من عادات الكود الاحترافي.</div>
        </div>

        <div class="lang-card java">
          <div class="lang-header">While</div>
<pre><span class="kw">int</span> count = <span class="num">1</span>;                    <span class="cm">// متغير العداد</span>

<span class="cm">// while يكرر طالما الشرط صحيح</span>
<span class="kw">while</span> (count <= <span class="num">5</span>) {             <span class="cm">// فحص الشرط قبل كل تكرار</span>
    System.out.<span class="fn">println</span>(<span class="str">"العدد: "</span> + count); <span class="cm">// طباعة القيمة</span>
    count++;                       <span class="cm">// زيادة العداد — منع الحلقة اللانهائية</span>
}
<span class="cm">// النتيجة: العدد: 1 .. العدد: 5</span>

<span class="cm">// while مع break و continue</span>
<span class="kw">int</span> x = <span class="num">0</span>;
<span class="kw">while</span> (<span class="kw">true</span>) {                    <span class="cm">// حلقة لانهائية — نخرج بـ break</span>
    x++;
    <span class="kw">if</span> (x == <span class="num">3</span>) <span class="kw">continue</span>;        <span class="cm">// تخطي x=3</span>
    <span class="kw">if</span> (x > <span class="num">5</span>)  <span class="kw">break</span>;            <span class="cm">// خروج عند x=6</span>
    System.out.<span class="fn">print</span>(x + <span class="str">" "</span>);   <span class="cm">// يطبع: 1 2 4 5</span>
}</pre>
          <div class="lang-desc"><code>while (true)</code> مع <code>break</code> شائعة جداً للقوائم التفاعلية. <code>continue</code> تتخطى بقية الكود وتكمل الحلقة.</div>
        </div>

        <div class="lang-card java">
          <div class="lang-header">Do-While</div>
<pre><span class="cm">// do-while: ينفّذ الجسم أولاً ثم يفحص الشرط</span>
<span class="kw">int</span> num = <span class="num">1</span>;
<span class="kw">do</span> {
    System.out.<span class="fn">println</span>(<span class="str">"العدد: "</span> + num); <span class="cm">// يُنفَّذ دائماً مرة</span>
    num++;                                 <span class="cm">// زيادة العداد</span>
} <span class="kw">while</span> (num <= <span class="num">5</span>);                   <span class="cm">// فحص بعد التنفيذ</span>

<span class="cm">// مثال عملي: قائمة تفاعلية</span>
Scanner sc = <span class="kw">new</span> <span class="fn">Scanner</span>(System.in);
<span class="kw">int</span> choice;
<span class="kw">do</span> {
    System.out.<span class="fn">println</span>(<span class="str">"1.إضافة 2.حذف 0.خروج"</span>); <span class="cm">// عرض القائمة</span>
    choice = sc.<span class="fn">nextInt</span>();               <span class="cm">// قراءة اختيار المستخدم</span>
} <span class="kw">while</span> (choice != <span class="num">0</span>);               <span class="cm">// كرر حتى يختار خروج</span>
System.out.<span class="fn">println</span>(<span class="str">"تم الخروج"</span>);</pre>
          <div class="lang-desc">Do-While تضمن تنفيذ الكود مرة واحدة على الأقل قبل فحص الشرط — مثالية لطلب مدخلات من المستخدم.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الشروط في Java</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">str1 == str2</span></div>
          <div class="error-note">يقارن المرجع لا المحتوى — قد يُعطي false</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">str1.equals(str2)</span></div>
          <div class="error-note">استخدم .equals() لمقارنة النصوص</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if (x = 5)</span></div>
          <div class="error-note">= تعيين وليس مقارنة — خطأ في الترجمة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (x == 5)</span></div>
          <div class="error-note">== للمقارنة دائماً</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الشروط في Java</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">if (x > 0)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (x == 5)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (name.equals("علي"))</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (x >= 0 && x <= 10)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('cond-java', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <!-- ═══════════════════════ PYTHON ═══════════════════════ -->
    <div class="topic-section" id="cond-python">
      <div class="section-title">If · While · Do-While في Python</div>
      <div class="lang-grid">

        <div class="lang-card python">
          <div class="lang-header">If — Elif — Else</div>
<pre>score = <span class="num">75</span>                         <span class="cm"># درجة الطالب</span>

<span class="cm"># if/elif/else — المسافة البادئة بدلاً من الأقواس</span>
<span class="kw">if</span> score >= <span class="num">90</span>:                    <span class="cm"># 90 فأكثر</span>
    <span class="fn">print</span>(<span class="str">"ممتاز 🌟"</span>)
<span class="kw">elif</span> score >= <span class="num">70</span>:                  <span class="cm"># 70-89 — elif بدلاً من else if</span>
    <span class="fn">print</span>(<span class="str">"جيد جداً 👍"</span>)
<span class="kw">elif</span> score >= <span class="num">60</span>:                  <span class="cm"># 60-69</span>
    <span class="fn">print</span>(<span class="str">"جيد"</span>)
<span class="kw">else</span>:                               <span class="cm"># أقل من 60</span>
    <span class="fn">print</span>(<span class="str">"راسب ❌"</span>)

<span class="cm"># Ternary (Conditional Expression)</span>
result = <span class="str">"ناجح"</span> <span class="kw">if</span> score >= <span class="num">60</span> <span class="kw">else</span> <span class="str">"راسب"</span>  <span class="cm"># قيمة if شرط else قيمة</span>
<span class="fn">print</span>(result)                      <span class="cm"># ناجح</span>

<span class="cm"># match/case (Python 3.10+) — بديل switch</span>
<span class="kw">match</span> score // <span class="num">10</span>:                <span class="cm"># تقريب للعشرة</span>
    <span class="kw">case</span> <span class="num">10</span> | <span class="num">9</span>: <span class="fn">print</span>(<span class="str">"ممتاز"</span>)   <span class="cm"># 100 أو 90</span>
    <span class="kw">case</span> <span class="num">8</span> | <span class="num">7</span>: <span class="fn">print</span>(<span class="str">"جيد جداً"</span>) <span class="cm"># 80 أو 70</span>
    <span class="kw">case</span> _:      <span class="fn">print</span>(<span class="str">"راسب"</span>)    <span class="cm"># _ يطابق أي قيمة</span></pre>
          <div class="lang-desc">Python تعتمد على المسافة البادئة (Indentation) وليس الأقواس لتحديد الكتل. <code>elif</code> اختصار لـ <code>else if</code>.</div>
        </div>

        <div class="lang-card python">
          <div class="lang-header">While</div>
<pre>count = <span class="num">1</span>                           <span class="cm"># متغير العداد</span>

<span class="cm"># while الأساسي</span>
<span class="kw">while</span> count <= <span class="num">5</span>:                  <span class="cm"># استمر طالما count لا تتجاوز 5</span>
    <span class="fn">print</span>(<span class="str">f"العدد: {count}"</span>)       <span class="cm"># f-string للتنسيق</span>
    count += <span class="num">1</span>                      <span class="cm"># += بدلاً من count++</span>

<span class="cm"># while مع else — ميزة فريدة في Python!</span>
count = <span class="num">1</span>
<span class="kw">while</span> count <= <span class="num">5</span>:
    <span class="fn">print</span>(count, end=<span class="str">" "</span>)          <span class="cm"># طباعة بدون سطر جديد</span>
    count += <span class="num">1</span>
<span class="kw">else</span>:                               <span class="cm"># يُنفَّذ بعد انتهاء الحلقة طبيعياً</span>
    <span class="fn">print</span>(<span class="str">"
انتهت الحلقة!"</span>)      <span class="cm"># لا يُنفَّذ إذا انتهت بـ break</span>

<span class="cm"># break و continue</span>
<span class="kw">for</span> i <span class="kw">in</span> <span class="fn">range</span>(<span class="num">1</span>, <span class="num">11</span>):
    <span class="kw">if</span> i % <span class="num">2</span> == <span class="num">0</span>: <span class="kw">continue</span>      <span class="cm"># تخطي الأرقام الزوجية</span>
    <span class="kw">if</span> i > <span class="num">7</span>: <span class="kw">break</span>               <span class="cm"># توقف عند 7</span>
    <span class="fn">print</span>(i, end=<span class="str">" "</span>)             <span class="cm"># 1 3 5 7</span></pre>
          <div class="lang-desc">Python تملك <code>while-else</code> فريدة — الـ <code>else</code> يُنفَّذ فقط إذا انتهت الحلقة بشكل طبيعي بدون break.</div>
        </div>

        <div class="lang-card python">
          <div class="lang-header">Do-While (محاكاة)</div>
<pre><span class="cm"># Python لا تملك do-while — نحاكيها بـ while True</span>
num = <span class="num">1</span>
<span class="kw">while True</span>:                         <span class="cm"># حلقة لا تنتهي ظاهرياً</span>
    <span class="fn">print</span>(<span class="str">f"العدد: {num}"</span>)          <span class="cm"># يُنفَّذ أولاً دون فحص</span>
    num += <span class="num">1</span>                         <span class="cm"># زيادة العداد</span>
    <span class="kw">if</span> num > <span class="num">5</span>:                     <span class="cm"># فحص الشرط بعد التنفيذ</span>
        <span class="kw">break</span>                        <span class="cm"># خروج من الحلقة</span>

<span class="cm"># قائمة تفاعلية — تُعرض مرة دائماً</span>
<span class="kw">while True</span>:
    choice = <span class="fn">input</span>(<span class="str">"1.إضافة 2.حذف 0.خروج: "</span>) <span class="cm"># قراءة الإدخال</span>
    <span class="kw">if</span> not choice.<span class="fn">isdigit</span>():        <span class="cm"># تحقق: هل هو رقم؟</span>
        <span class="fn">print</span>(<span class="str">"أدخل رقماً فقط"</span>)    <span class="cm"># رسالة خطأ</span>
        <span class="kw">continue</span>                     <span class="cm"># أعد طلب الإدخال</span>
    <span class="kw">if</span> choice == <span class="str">"0"</span>: <span class="kw">break</span>        <span class="cm"># خروج إذا اختار 0</span>
<span class="fn">print</span>(<span class="str">"تم الخروج"</span>)</pre>
          <div class="lang-desc">Python لا تملك do-while. البديل الشائع هو <code>while True</code> مع <code>break</code> داخل الحلقة.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الشروط في Python</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if x == None:</span></div>
          <div class="error-note">== مع None غير مُفضّل</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if x is None:</span></div>
          <div class="error-note">استخدم is وis not مع None دائماً</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if x &gt; 0 and x &lt; 10:</span></div>
          <div class="error-note">يعمل لكن ليس Pythonic</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if 0 &lt; x &lt; 10:</span></div>
          <div class="error-note">Python تدعم المقارنة المتسلسلة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الشروط في Python</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">if x > 0:</code><code class="quiz-hint-chip" onclick="insertHint(this)">if name == "علي":</code><code class="quiz-hint-chip" onclick="insertHint(this)">elif x < 0:</code><code class="quiz-hint-chip" onclick="insertHint(this)">while count < 10:</code><code class="quiz-hint-chip" onclick="insertHint(this)">if 0 < x < 10:</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('cond-python', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <!-- ═══════════════════════ JAVASCRIPT ═══════════════════════ -->
    <div class="topic-section" id="cond-js">
      <div class="section-title">If · While · Do-While في JavaScript</div>
      <div class="lang-grid">

        <div class="lang-card js">
          <div class="lang-header">If — Else If — Else</div>
<pre><span class="kw">const</span> score = <span class="num">75</span>;                  <span class="cm">// درجة الطالب</span>

<span class="cm">// if/else if/else </span>
<span class="kw">if</span> (score >= <span class="num">90</span>) {
    console.<span class="fn">log</span>(<span class="str">"ممتاز 🌟"</span>);       <span class="cm">// 90 فأكثر</span>
} <span class="kw">else if</span> (score >= <span class="num">70</span>) {
    console.<span class="fn">log</span>(<span class="str">"جيد جداً 👍"</span>);    <span class="cm">// 70-89</span>
} <span class="kw">else if</span> (score >= <span class="num">60</span>) {
    console.<span class="fn">log</span>(<span class="str">"جيد"</span>);            <span class="cm">// 60-69</span>
} <span class="kw">else</span> {
    console.<span class="fn">log</span>(<span class="str">"راسب ❌"</span>);        <span class="cm">// أقل من 60</span>
}

<span class="cm">// Ternary — مختصر لـ if-else بسيط</span>
<span class="kw">const</span> res = score >= <span class="num">60</span> ? <span class="str">"ناجح"</span> : <span class="str">"راسب"</span>; <span class="cm">// شرط ? صحيح : خطأ</span>
console.<span class="fn">log</span>(res);                   <span class="cm">// ناجح</span>

<span class="cm">// Nullish Coalescing — بديل لـ || مع null/undefined</span>
<span class="kw">const</span> name = <span class="kw">null</span>;
<span class="kw">const</span> label = name ?? <span class="str">"زائر"</span>;      <span class="cm">// إذا كان null/undefined يأخذ "زائر"</span>
console.<span class="fn">log</span>(label);                 <span class="cm">// زائر</span></pre>
          <div class="lang-desc">JS تملك <code>??</code> للتعامل مع null/undefined، و<code>?.</code> للوصول الآمن لخصائص الكائنات — أدوات قوية في الكود الحديث.</div>
        </div>

        <div class="lang-card js">
          <div class="lang-header">While</div>
<pre><span class="kw">let</span> count = <span class="num">1</span>;                     <span class="cm">// متغير العداد</span>

<span class="cm">// while الأساسي</span>
<span class="kw">while</span> (count <= <span class="num">5</span>) {              <span class="cm">// فحص قبل كل تكرار</span>
    console.<span class="fn">log</span>(<span class="str">`العدد: ${count}`</span>); <span class="cm">// Template Literal</span>
    count++;                         <span class="cm">// زيادة العداد</span>
}

<span class="cm">// while لمعالجة بيانات حتى شرط</span>
<span class="kw">const</span> stack = [<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>, <span class="num">40</span>];  <span class="cm">// مصفوفة بيانات</span>
<span class="kw">while</span> (stack.length > <span class="num">0</span>) {        <span class="cm">// استمر طالما المصفوفة غير فارغة</span>
    <span class="kw">const</span> item = stack.<span class="fn">pop</span>();      <span class="cm">// إزالة آخر عنصر</span>
    console.<span class="fn">log</span>(<span class="str">`معالجة: ${item}`</span>); <span class="cm">// معالجة العنصر</span>
}

<span class="cm">// while مع break</span>
<span class="kw">let</span> x = <span class="num">0</span>;
<span class="kw">while</span> (<span class="kw">true</span>) {                     <span class="cm">// حلقة لانهائية</span>
    <span class="kw">if</span> (++x > <span class="num">5</span>) <span class="kw">break</span>;           <span class="cm">// خروج عند تجاوز 5</span>
    <span class="kw">if</span> (x === <span class="num">3</span>) <span class="kw">continue</span>;        <span class="cm">// تخطي 3</span>
    console.<span class="fn">log</span>(x);                 <span class="cm">// 1 2 4 5</span>
}</pre>
          <div class="lang-desc"><code>while</code> تستمر طالما الشرط صحيح — استخدمها عندما لا تعرف عدد التكرارات مسبقاً.</div>
        </div>

        <div class="lang-card js">
          <div class="lang-header">Do-While</div>
<pre><span class="cm">// do-while الأساسي</span>
<span class="kw">let</span> num = <span class="num">1</span>;
<span class="kw">do</span> {
    console.<span class="fn">log</span>(<span class="str">`العدد: ${num}`</span>);  <span class="cm">// يُنفَّذ قبل الفحص</span>
    num++;                           <span class="cm">// زيادة العداد</span>
} <span class="kw">while</span> (num <= <span class="num">5</span>);              <span class="cm">// فحص بعد التنفيذ</span>

<span class="cm">// التحقق من إدخال المستخدم</span>
<span class="kw">let</span> input;
<span class="kw">do</span> {
    input = <span class="fn">prompt</span>(<span class="str">"أدخل رقماً بين 1 و 10:"</span>); <span class="cm">// طلب الإدخال</span>
    input = <span class="fn">parseInt</span>(input);       <span class="cm">// تحويل النص لرقم</span>
} <span class="kw">while</span> (<span class="fn">isNaN</span>(input)             <span class="cm">// كرر إذا لم يكن رقماً</span>
      || input &lt; <span class="num">1</span>                 <span class="cm">// أو أقل من 1</span>
      || input > <span class="num">10</span>);             <span class="cm">// أو أكبر من 10</span>
console.<span class="fn">log</span>(<span class="str">`اخترت: ${input}`</span>);  <span class="cm">// إدخال صحيح</span></pre>
          <div class="lang-desc">Do-While تُنفّذ الكود أولاً ثم تتحقق من الشرط — مثالية لطلب مدخلات المستخدم وضمان عرضها مرة على الأقل.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الشروط في JavaScript</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if (0 == "0")  // true!</span></div>
          <div class="error-note">== يُحوّل الأنواع تلقائياً — نتائج مفاجئة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (0 === "0")  // false ✓</span></div>
          <div class="error-note">استخدم === دائماً — يقارن القيمة والنوع</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if (x) { ... } // 0 و "" و null تُعطي false</span></div>
          <div class="error-note">Falsy values في JS: 0، ""، null، undefined</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (x !== null &amp;&amp; x !== undefined)</span></div>
          <div class="error-note">كن صريحاً في الشرط إذا أردت التحقق من null فقط</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الشروط في JavaScript</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">if (x > 0)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (x === 5)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (name !== null)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (arr.length > 0)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('cond-js', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <!-- ═══════════════════════ ++C ═══════════════════════ -->
    <div class="topic-section" id="cond-cpp">
      <div class="section-title">If · While · Do-While في ++C</div>
      <div class="lang-grid">

        <div class="lang-card cpp">
          <div class="lang-header">If — Else If — Else</div>
<pre><span class="kw">int</span> score = <span class="num">75</span>;                   <span class="cm">// درجة الطالب</span>

<span class="cm">// if/else if/else ال</span>
<span class="kw">if</span> (score >= <span class="num">90</span>) {
    std::cout &lt;&lt; <span class="str">"ممتاز 🌟
"</span>;   <span class="cm">// 90 فأكثر</span>
} <span class="kw">else if</span> (score >= <span class="num">70</span>) {
    std::cout &lt;&lt; <span class="str">"جيد جداً
"</span>;   <span class="cm">// 70-89</span>
} <span class="kw">else if</span> (score >= <span class="num">60</span>) {
    std::cout &lt;&lt; <span class="str">"جيد
"</span>;        <span class="cm">// 60-69</span>
} <span class="kw">else</span> {
    std::cout &lt;&lt; <span class="str">"راسب ❌
"</span>;    <span class="cm">// أقل من 60</span>
}

<span class="cm">// Ternary</span>
std::string res = (score >= <span class="num">60</span>) ? <span class="str">"ناجح"</span> : <span class="str">"راسب"</span>;
std::cout &lt;&lt; res &lt;&lt; <span class="str">"
"</span>;       <span class="cm">// ناجح</span>

<span class="cm">// constexpr if — يُقيَّم وقت الترجمة (++C17)</span>
<span class="kw">constexpr int</span> LIMIT = <span class="num">100</span>;       <span class="cm">// ثابت معروف وقت الترجمة</span>
<span class="kw">if constexpr</span> (LIMIT > <span class="num">50</span>) {      <span class="cm">// يُحسم وقت الترجمة لا التشغيل</span>
    std::cout &lt;&lt; <span class="str">"LIMIT كبير
"</span>;
}</pre>
          <div class="lang-desc"><code>if constexpr</code> يُحسم وقت الترجمة وليس التشغيل — يُلغي الكود الغير مستخدم ويُسرّع البرنامج.</div>
        </div>

        <div class="lang-card cpp">
          <div class="lang-header">While</div>
<pre><span class="kw">int</span> count = <span class="num">1</span>;                    <span class="cm">// متغير العداد</span>

<span class="cm">// while الأساسي</span>
<span class="kw">while</span> (count <= <span class="num">5</span>) {             <span class="cm">// فحص قبل كل تكرار</span>
    std::cout &lt;&lt; <span class="str">"العدد: "</span> &lt;&lt; count &lt;&lt; <span class="str">"
"</span>; <span class="cm">// طباعة</span>
    count++;                       <span class="cm">// زيادة العداد</span>
}

<span class="cm">// while لقراءة إدخالات حتى شرط</span>
<span class="kw">int</span> sum = <span class="num">0</span>, num;
<span class="kw">while</span> (std::cin &gt;&gt; num           <span class="cm">// قراءة رقم من المستخدم</span>
       &amp;&amp; num != <span class="num">0</span>) {           <span class="cm">// توقف عند إدخال 0</span>
    sum += num;                    <span class="cm">// جمع الأرقام</span>
}
std::cout &lt;&lt; <span class="str">"المجموع: "</span> &lt;&lt; sum; <span class="cm">// طباعة المجموع النهائي</span>

<span class="cm">// while مع break</span>
<span class="kw">int</span> x = <span class="num">0</span>;
<span class="kw">while</span> (<span class="kw">true</span>) {                    <span class="cm">// حلقة لانهائية</span>
    <span class="kw">if</span> (++x > <span class="num">5</span>) <span class="kw">break</span>;          <span class="cm">// خروج عند تجاوز 5</span>
    std::cout &lt;&lt; x &lt;&lt; <span class="str">" "</span>;      <span class="cm">// 1 2 3 4 5</span>
}</pre>
          <div class="lang-desc">++C تسمح بقراءة الإدخال مباشرة في شرط الـ <code>while</code> — أسلوب احترافي شائع في برامج ++C.</div>
        </div>

        <div class="lang-card cpp">
          <div class="lang-header">Do-While</div>
<pre><span class="cm">// do-while الأساسي</span>
<span class="kw">int</span> num = <span class="num">1</span>;
<span class="kw">do</span> {
    std::cout &lt;&lt; <span class="str">"العدد: "</span> &lt;&lt; num &lt;&lt; <span class="str">"
"</span>; <span class="cm">// يُنفَّذ قبل الفحص</span>
    num++;                          <span class="cm">// زيادة العداد</span>
} <span class="kw">while</span> (num <= <span class="num">5</span>);             <span class="cm">// فحص بعد التنفيذ</span>

<span class="cm">// التحقق من إدخال المستخدم</span>
<span class="kw">int</span> age;
<span class="kw">do</span> {
    std::cout &lt;&lt; <span class="str">"أدخل عمرك (1-120): "</span>; <span class="cm">// طلب الإدخال</span>
    std::cin  &gt;&gt; age;               <span class="cm">// قراءة العمر</span>
} <span class="kw">while</span> (age &lt; <span class="num">1</span> || age > <span class="num">120</span>); <span class="cm">// كرر إذا كان خارج النطاق</span>
std::cout &lt;&lt; <span class="str">"عمرك: "</span> &lt;&lt; age;   <span class="cm">// إدخال صحيح</span></pre>
          <div class="lang-desc">Do-While تضمن عرض الطلب مرة واحدة على الأقل قبل التحقق من صحة المدخلات.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الشروط في ++C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if (x = 5) { ... }</span></div>
          <div class="error-note">= تعيين لا مقارنة — الشرط دائماً true</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (x == 5) { ... }</span></div>
          <div class="error-note">== للمقارنة دائماً</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">while (1) { ... } // بدون break</span></div>
          <div class="error-note">حلقة لا نهائية — تُجمّد البرنامج</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">while (true) {<br>    if (done) break;<br>}</span></div>
          <div class="error-note">تأكد دائماً من وجود شرط خروج</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الشروط في C++</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">if (x > 0)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (x == 5)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">do { } while (x > 0);</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (x >= 0 && x <= 10)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('cond-cpp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <!-- ═══════════════════════ #C ═══════════════════════ -->
    <div class="topic-section" id="cond-csharp">
      <div class="section-title">If · While · Do-While في #C</div>
      <div class="lang-grid">

        <div class="lang-card csharp">
          <div class="lang-header">If — Else If — Else</div>
<pre><span class="kw">int</span> score = <span class="num">75</span>;                   <span class="cm">// درجة الطالب</span>

<span class="cm">// if/else if/else ال</span>
<span class="kw">if</span> (score >= <span class="num">90</span>) {
    Console.<span class="fn">WriteLine</span>(<span class="str">"ممتاز 🌟"</span>); <span class="cm">// 90 فأكثر</span>
} <span class="kw">else if</span> (score >= <span class="num">70</span>) {
    Console.<span class="fn">WriteLine</span>(<span class="str">"جيد جداً"</span>); <span class="cm">// 70-89</span>
} <span class="kw">else if</span> (score >= <span class="num">60</span>) {
    Console.<span class="fn">WriteLine</span>(<span class="str">"جيد"</span>);     <span class="cm">// 60-69</span>
} <span class="kw">else</span> {
    Console.<span class="fn">WriteLine</span>(<span class="str">"راسب ❌"</span>); <span class="cm">// أقل من 60</span>
}

<span class="cm">// switch expression (#C 8+) — بديل أنيق</span>
<span class="kw">string</span> grade = score <span class="kw">switch</span> {
    >= <span class="num">90</span> => <span class="str">"ممتاز"</span>,               <span class="cm">// >= 90</span>
    >= <span class="num">70</span> => <span class="str">"جيد جداً"</span>,            <span class="cm">// >= 70</span>
    >= <span class="num">60</span> => <span class="str">"جيد"</span>,                 <span class="cm">// >= 60</span>
    _    => <span class="str">"راسب"</span>                  <span class="cm">// _ = أي قيمة أخرى (wildcard)</span>
};
Console.<span class="fn">WriteLine</span>(grade);         <span class="cm">// جيد جداً</span>

<span class="cm">// Pattern Matching (#C 9+)</span>
<span class="kw">string</span> category = score <span class="kw">switch</span> {
    > <span class="num">100</span> <span class="kw">or</span> &lt; <span class="num">0</span> => <span class="str">"خارج النطاق"</span>, <span class="cm">// or بين شرطين</span>
    >= <span class="num">90</span>         => <span class="str">"ممتاز"</span>,        <span class="cm">// Pattern بسيط</span>
    _             => <span class="str">"مقبول"</span>         <span class="cm">// الباقي</span>
};</pre>
          <div class="lang-desc">#C 8+ تدعم Switch Expression بصياغة <code>=></code> — أنظف وأقصر من switch التقليدي ويُعيد قيمة مباشرة.</div>
        </div>

        <div class="lang-card csharp">
          <div class="lang-header">While</div>
<pre><span class="kw">int</span> count = <span class="num">1</span>;                    <span class="cm">// متغير العداد</span>

<span class="cm">// while الأساسي</span>
<span class="kw">while</span> (count <= <span class="num">5</span>) {             <span class="cm">// فحص قبل كل تكرار</span>
    Console.<span class="fn">WriteLine</span>(<span class="str">$"العدد: {count}"</span>); <span class="cm">// $ للـ interpolation</span>
    count++;                       <span class="cm">// زيادة العداد</span>
}

<span class="cm">// while لقراءة وتحليل بيانات</span>
<span class="kw">var</span> numbers = <span class="kw">new</span> Queue&lt;<span class="kw">int</span>&gt;(<span class="kw">new</span>[] {<span class="num">5</span>, <span class="num">3</span>, <span class="num">8</span>, <span class="num">1</span>}); <span class="cm">// طابور أرقام</span>
<span class="kw">int</span> max = <span class="kw">int</span>.MinValue;           <span class="cm">// أصغر قيمة ممكنة كبداية</span>
<span class="kw">while</span> (numbers.Count > <span class="num">0</span>) {     <span class="cm">// طالما الطابور غير فارغ</span>
    <span class="kw">int</span> n = numbers.<span class="fn">Dequeue</span>();   <span class="cm">// إزالة وقراءة أول عنصر</span>
    <span class="kw">if</span> (n > max) max = n;         <span class="cm">// تحديث الحد الأقصى</span>
}
Console.<span class="fn">WriteLine</span>(<span class="str">$"الأكبر: {max}"</span>); <span class="cm">// 8</span></pre>
          <div class="lang-desc"><code>while</code> مثالية لمعالجة قوائم البيانات — تستمر حتى تنتهي العناصر.</div>
        </div>

        <div class="lang-card csharp">
          <div class="lang-header">Do-While</div>
<pre><span class="cm">// do-while الأساسي</span>
<span class="kw">int</span> num = <span class="num">1</span>;
<span class="kw">do</span> {
    Console.<span class="fn">WriteLine</span>(<span class="str">$"العدد: {num}"</span>); <span class="cm">// يُنفَّذ قبل الفحص</span>
    num++;                               <span class="cm">// زيادة العداد</span>
} <span class="kw">while</span> (num <= <span class="num">5</span>);                 <span class="cm">// فحص بعد التنفيذ</span>

<span class="cm">// التحقق من إدخال المستخدم مع TryParse</span>
<span class="kw">int</span> age;
<span class="kw">do</span> {
    Console.<span class="fn">Write</span>(<span class="str">"أدخل عمرك (1-120): "</span>);  <span class="cm">// طلب الإدخال</span>
} <span class="kw">while</span> (!<span class="kw">int</span>.<span class="fn">TryParse</span>(              <span class="cm">// TryParse آمن لا يُسبّب exception</span>
    Console.<span class="fn">ReadLine</span>(), <span class="kw">out</span> age)       <span class="cm">// out يضع النتيجة في age</span>
    || age &lt; <span class="num">1</span> || age > <span class="num">120</span>);         <span class="cm">// تحقق من النطاق</span>
Console.<span class="fn">WriteLine</span>(<span class="str">$"عمرك: {age}"</span>);   <span class="cm">// إدخال صحيح</span></pre>
          <div class="lang-desc"><code>int.TryParse</code> آمن — إذا فشل التحويل يُعيد <code>false</code> بدلاً من إيقاف البرنامج. أفضل من <code>int.Parse</code>.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الشروط في #C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">string s = null;<br>if (s.Length &gt; 0)</span></div>
          <div class="error-note">NullReferenceException — s قيمتها null</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (!string.IsNullOrEmpty(s))</span></div>
          <div class="error-note">IsNullOrEmpty للتحقق الآمن من النصوص</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الشروط في C#</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">if (x > 0)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (x == 5)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">do { } while (cond);</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (!string.IsNullOrEmpty(s))</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('cond-csharp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <!-- ═══════════════════════ KOTLIN ═══════════════════════ -->
    <div class="topic-section" id="cond-kotlin">
      <div class="section-title">If · When · While · Do-While في Kotlin</div>
      <div class="lang-grid">

        <div class="lang-card kotlin">
          <div class="lang-header">🔀 if كـ Expression + when</div>
<pre><span class="kw">val</span> score = <span class="num">75</span>                         <span class="cm">// درجة الطالب</span>

<span class="cm">// if كـ Expression يُعيد قيمة مباشرة</span>
<span class="kw">val</span> result = <span class="kw">if</span> (score >= <span class="num">90</span>) <span class="str">"ممتاز"</span>   <span class="cm">// 90+</span>
             <span class="kw">else if</span> (score >= <span class="num">70</span>) <span class="str">"جيد جداً"</span> <span class="cm">// 70-89</span>
             <span class="kw">else if</span> (score >= <span class="num">60</span>) <span class="str">"جيد"</span>    <span class="cm">// 60-69</span>
             <span class="kw">else</span> <span class="str">"راسب"</span>                     <span class="cm">// أقل من 60</span>
<span class="fn">println</span>(result)                        <span class="cm">// جيد جداً</span>

<span class="cm">// بديل Ternary — if في سطر واحد</span>
<span class="kw">val</span> pass = <span class="kw">if</span> (score >= <span class="num">60</span>) <span class="str">"ناجح"</span> <span class="kw">else</span> <span class="str">"راسب"</span> <span class="cm">// أنيق ومباشر</span>

<span class="cm">// when على متغير — أقوى من switch</span>
<span class="kw">val</span> grade = <span class="kw">when</span> (score) {
    <span class="kw">in</span> <span class="num">90</span>..<span class="num">100</span> -> <span class="str">"ممتاز 🌟"</span>          <span class="cm">// نطاق شامل</span>
    <span class="kw">in</span> <span class="num">70</span>..<span class="num">89</span>  -> <span class="str">"جيد جداً 👍"</span>       <span class="cm">// نطاق آخر</span>
    <span class="kw">in</span> <span class="num">60</span>..<span class="num">69</span>  -> <span class="str">"جيد"</span>               <span class="cm">// نطاق آخر</span>
    <span class="kw">else</span>        -> <span class="str">"راسب ❌"</span>           <span class="cm">// أي قيمة أخرى</span>
}
<span class="fn">println</span>(grade)                         <span class="cm">// جيد جداً 👍</span></pre>
          <div class="lang-desc">في Kotlin كل من <code>if</code> و<code>when</code> تعبيران يُعيدان قيمة مباشرة — يمكن استخدامهما في التعيين بدون return.</div>
        </div>

        <div class="lang-card kotlin">
          <div class="lang-header">While</div>
<pre><span class="kw">var</span> count = <span class="num">1</span>                          <span class="cm">// var قابل للتغيير</span>

<span class="cm">// while الأساسي</span>
<span class="kw">while</span> (count <= <span class="num">5</span>) {                  <span class="cm">// فحص قبل كل تكرار</span>
    <span class="fn">println</span>(<span class="str">"العدد: $count"</span>)          <span class="cm">// String Template بدون +</span>
    count++                             <span class="cm">// زيادة العداد</span>
}

<span class="cm">// while مع break و continue</span>
<span class="kw">var</span> x = <span class="num">0</span>
<span class="kw">while</span> (<span class="kw">true</span>) {                        <span class="cm">// حلقة لانهائية</span>
    x++
    <span class="kw">if</span> (x == <span class="num">3</span>) <span class="kw">continue</span>              <span class="cm">// تخطي x=3</span>
    <span class="kw">if</span> (x > <span class="num">5</span>)  <span class="kw">break</span>                 <span class="cm">// خروج عند x=6</span>
    <span class="fn">print</span>(<span class="str">"$x "</span>)                      <span class="cm">// 1 2 4 5</span>
}

<span class="cm">// while مع Label — للحلقات المتداخلة</span>
<span class="kw">outer@</span> <span class="kw">while</span> (<span class="kw">true</span>) {               <span class="cm">// Label للحلقة الخارجية</span>
    <span class="kw">while</span> (<span class="kw">true</span>) {
        <span class="kw">break</span> <span class="kw">@outer</span>                  <span class="cm">// خروج من الحلقة الخارجية مباشرة</span>
    }
}</pre>
          <div class="lang-desc"><code>break@label</code> يخرج من حلقة محددة بالاسم — مفيد جداً في الحلقات المتداخلة عندما تريد الخروج من الداخلية والخارجية معاً.</div>
        </div>

        <div class="lang-card kotlin">
          <div class="lang-header">Do-While</div>
<pre><span class="cm">// do-while الأساسي</span>
<span class="kw">var</span> num = <span class="num">1</span>
<span class="kw">do</span> {
    <span class="fn">println</span>(<span class="str">"العدد: $num"</span>)            <span class="cm">// يُنفَّذ قبل فحص الشرط</span>
    num++                               <span class="cm">// زيادة العداد</span>
} <span class="kw">while</span> (num <= <span class="num">5</span>)                   <span class="cm">// لا فاصلة منقوطة بعدها</span>

<span class="cm">// التحقق من إدخال المستخدم</span>
<span class="kw">var</span> input: String
<span class="kw">do</span> {
    <span class="fn">print</span>(<span class="str">"أدخل رقماً (1-10): "</span>)     <span class="cm">// عرض الطلب</span>
    input = <span class="fn">readLine</span>() ?: <span class="str">""</span>          <span class="cm">// ?: للتعامل مع null</span>
    <span class="kw">val</span> n = input.<span class="fn">toIntOrNull</span>()       <span class="cm">// تحويل آمن — null إذا فشل</span>
} <span class="kw">while</span> (input.<span class="fn">toIntOrNull</span>() == <span class="kw">null</span>  <span class="cm">// كرر إذا لم يكن رقماً</span>
       || input.<span class="fn">toInt</span>() !<span class="kw">in</span> <span class="num">1</span>..<span class="num">10</span>)   <span class="cm">// أو خارج النطاق</span>
<span class="fn">println</span>(<span class="str">"اخترت: $input"</span>)             <span class="cm">// إدخال صحيح</span></pre>
          <div class="lang-desc"><code>toIntOrNull()</code> يُعيد <code>null</code> بدل إيقاف البرنامج إذا فشل التحويل — أكثر أماناً من <code>toInt()</code>.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الشروط في Kotlin</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">val name: String? = null<br>if (name.length &gt; 0)</span></div>
          <div class="error-note">NullPointerException — name قد تكون null</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (!name.isNullOrEmpty())</span></div>
          <div class="error-note">استخدم دوال Kotlin الآمنة مع Nullable</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if (x.equals(5))</span></div>
          <div class="error-note">طريقة Java — غير ضرورية في Kotlin</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (x == 5)</span></div>
          <div class="error-note">== في Kotlin يقارن القيمة مثل equals()</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الشروط في Kotlin</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">if (x > 0)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (x == 5)</code><code class="quiz-hint-chip" onclick="insertHint(this)">when (x)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (!name.isNullOrEmpty())</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('cond-kotlin', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    
    <!-- PHP CONDITIONS -->
    <div class="topic-section" id="cond-php">
      <div class="section-title">If · While · Do-While في PHP</div>
      <div class="lang-grid">
        <div class="lang-card php">
          <div class="lang-header">If — Elseif — Else</div>
<pre>$score = <span class="num">75</span>;

<span class="kw">if</span> ($score &gt;= <span class="num">90</span>) {
    <span class="kw">echo</span> <span class="str">"ممتاز 🌟\n"</span>;
} <span class="kw">elseif</span> ($score &gt;= <span class="num">70</span>) {
    <span class="kw">echo</span> <span class="str">"جيد جداً 👍\n"</span>;
} <span class="kw">elseif</span> ($score &gt;= <span class="num">60</span>) {
    <span class="kw">echo</span> <span class="str">"جيد\n"</span>;
} <span class="kw">else</span> {
    <span class="kw">echo</span> <span class="str">"راسب ❌\n"</span>;
}

<span class="cm">// Ternary</span>
$result = ($score &gt;= <span class="num">60</span>) ? <span class="str">"ناجح"</span> : <span class="str">"راسب"</span>;
<span class="cm">// Null Coalescing — PHP 7+</span>
$name = $data[<span class="str">"name"</span>] ?? <span class="str">"مجهول"</span>;</pre>
          <div class="lang-desc"><code>??</code> اختصار مفيد: إذا كانت القيمة اليسرى null تُعيد اليمنى، وإلا تُعيد اليسرى — بديل أنيق لـ if/else.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">While</div>
<pre>$count = <span class="num">1</span>;
<span class="kw">while</span> ($count &lt;= <span class="num">5</span>) {
    <span class="kw">echo</span> <span class="str">"العدد: $count\n"</span>;
    $count++;
}

<span class="cm">// مع break و continue</span>
$x = <span class="num">0</span>;
<span class="kw">while</span> (<span class="kw">true</span>) {
    $x++;
    <span class="kw">if</span> ($x == <span class="num">3</span>) <span class="kw">continue</span>;
    <span class="kw">if</span> ($x &gt;  <span class="num">5</span>) <span class="kw">break</span>;
    <span class="kw">echo</span> <span class="str">"$x "</span>; <span class="cm">// 1 2 4 5</span>
}</pre>
          <div class="lang-desc"><code>break 2</code> ميزة خاصة بـ PHP تخرج من حلقتين متداخلتين في نفس الوقت — غير موجودة في معظم اللغات الأخرى.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Do-While</div>
<pre>$num = <span class="num">1</span>;
<span class="kw">do</span> {
    <span class="kw">echo</span> <span class="str">"العدد: $num\n"</span>;
    $num++;
} <span class="kw">while</span> ($num &lt;= <span class="num">5</span>);

<span class="cm">// تحقق من إدخال المستخدم</span>
<span class="kw">do</span> {
    $input = <span class="fn">readline</span>(<span class="str">"أدخل 1-10: "</span>);
} <span class="kw">while</span> (!<span class="fn">is_numeric</span>($input)
       || $input &lt; <span class="num">1</span> || $input &gt; <span class="num">10</span>);
<span class="kw">echo</span> <span class="str">"اخترت: $input"</span>;</pre>
          <div class="lang-desc"><code>is_numeric()</code> تتحقق أن القيمة رقمية سواء كانت عدداً أو نصاً يمثّل رقماً مثل "42" — أشمل من <code>is_int()</code>.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الشروط في PHP</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if (0 == "a")  // true!</span></div>
          <div class="error-note">PHP == مرن جداً — "a" تساوي 0 عند المقارنة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (0 === "a")  // false ✓</span></div>
          <div class="error-note">استخدم === دائماً في PHP</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">if ($arr["key"] == true)</span></div>
          <div class="error-note">Undefined index إذا المفتاح غير موجود</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (isset($arr["key"]) &amp;&amp; $arr["key"])</span></div>
          <div class="error-note">تحقق من وجود المفتاح بـ isset() أولاً</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الشروط في PHP</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">if ($x > 0)</code><code class="quiz-hint-chip" onclick="insertHint(this)">if ($x === 5)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while ($i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">do { } while ($x > 0);</code><code class="quiz-hint-chip" onclick="insertHint(this)">if (isset($arr["key"]))</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('cond-php', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
  </div>
</div>



</asp:Content>
