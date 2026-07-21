<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Switch.aspx.cs" Inherits="SwitchPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — Switch / Case</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>🔧 Switch / Case</h2>
    <p>التحويل المتعدد — بديل أنيق لسلسلة if-else</p>
  </div>
  <div class="content-wrap">
    <div class="topic-nav">
      <button type="button" class="topic-btn active" onclick="showTopic('sw','java',this)">Java</button>
      <button type="button" class="topic-btn" onclick="showTopic('sw','python',this)">Python</button>
      <button type="button" class="topic-btn" onclick="showTopic('sw','js',this)">JavaScript</button>
      <button type="button" class="topic-btn" onclick="showTopic('sw','cpp',this)">++C</button>
      <button type="button" class="topic-btn" onclick="showTopic('sw','csharp',this)">#C</button>
      <button type="button" class="topic-btn" onclick="showTopic('sw','kotlin',this)">Kotlin</button>
      <button type="button" class="topic-btn" onclick="showTopic('sw','php',this)">PHP</button>
    </div>

    <div class="info-box">
      <strong>Switch/Case</strong> تُستخدم عندما تريد مقارنة متغير بعدة قيم محددة. أكثر وضوحاً من if-else المتداخلة.
      تذكر: استخدم <code>break</code> في نهاية كل case لمنع الـ fall-through.
    </div>

    <div class="topic-section active" id="sw-java">
      <div class="section-title">Switch في Java</div>
      <div class="lang-grid">
        <div class="lang-card java">
          <div class="lang-header">Switch </div>
          <pre><span class="kw">int</span> day = <span class="num">3</span>;
<span class="kw">switch</span> (day) {
    <span class="kw">case</span> <span class="num">1</span>: System.out.<span class="fn">println</span>(<span class="str">"الأحد"</span>); <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">2</span>: System.out.<span class="fn">println</span>(<span class="str">"الاثنين"</span>); <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">3</span>: System.out.<span class="fn">println</span>(<span class="str">"الثلاثاء"</span>); <span class="kw">break</span>;
    <span class="kw">default</span>: System.out.<span class="fn">println</span>(<span class="str">"يوم آخر"</span>);
}</pre>
        </div>
        <div class="lang-card java">
          <div class="lang-header">Switch Expression (Java 14+)</div>
          <pre>String season = <span class="str">"صيف"</span>;
String msg = <span class="kw">switch</span> (season) {
    <span class="kw">case</span> <span class="str">"ربيع"</span> -> <span class="str">"الجو معتدل 🌸"</span>;
    <span class="kw">case</span> <span class="str">"صيف"</span> -> <span class="str">"الجو حار ☀️"</span>;
    <span class="kw">case</span> <span class="str">"خريف"</span> -> <span class="str">"الأوراق تتساقط 🍂"</span>;
    <span class="kw">case</span> <span class="str">"شتاء"</span> -> <span class="str">"الجو بارد ❄️"</span>;
    <span class="kw">default</span> -> <span class="str">"موسم غير معروف"</span>;
};
System.out.<span class="fn">println</span>(msg);</pre>
          <div class="lang-desc">Java 14+ تدعم Switch Expression بالسهم <code>-></code> — لا حاجة لـ <code>break</code> ويُعيد قيمة مباشرة.</div>
        </div>
        <div class="lang-card java">
          <div class="lang-header">Switch مع String</div>
          <pre>String lang = <span class="str">"Python"</span>;
<span class="kw">switch</span> (lang) {
    <span class="kw">case</span> <span class="str">"Java"</span>:
        System.out.<span class="fn">println</span>(<span class="str">"لغة قوية ☕"</span>);
        <span class="kw">break</span>;
    <span class="kw">case</span> <span class="str">"Python"</span>:
        System.out.<span class="fn">println</span>(<span class="str">"سهلة التعلم 🐍"</span>);
        <span class="kw">break</span>;
    <span class="kw">default</span>:
        System.out.<span class="fn">println</span>(<span class="str">"لغة أخرى"</span>);
}</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — Switch في Java</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">case 1: doA();<br>case 2: doB();</span></div>
          <div class="error-note">Fall-through — عند case 1 يُنفَّذ doA() وdoB() معاً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">case 1: doA(); break;<br>case 2: doB(); break;</span></div>
          <div class="error-note">break إلزامي في نهاية كل case</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">switch (str) { ... } // str قيمتها null</span></div>
          <div class="error-note">NullPointerException إذا كانت str قيمتها null</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (str != null) switch (str) { ... }</span></div>
          <div class="error-note">تحقق من null قبل switch على النصوص</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — Switch في Java</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">switch (day)</code><code class="quiz-hint-chip" onclick="insertHint(this)">case 1:</code><code class="quiz-hint-chip" onclick="insertHint(this)">break;</code><code class="quiz-hint-chip" onclick="insertHint(this)">default:</code><code class="quiz-hint-chip" onclick="insertHint(this)">switch (x) { case 1: doA(); break; }</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('sw-java', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <div class="topic-section" id="sw-python">
      <div class="section-title">Match/Case في Python (3.10+)</div>
      <div class="lang-grid">
        <div class="lang-card python">
          <div class="lang-header">match </div>
          <pre>day = <span class="num">3</span>
<span class="kw">match</span> day:
    <span class="kw">case</span> <span class="num">1</span>: <span class="fn">print</span>(<span class="str">"الأحد"</span>)
    <span class="kw">case</span> <span class="num">2</span>: <span class="fn">print</span>(<span class="str">"الاثنين"</span>)
    <span class="kw">case</span> <span class="num">3</span>: <span class="fn">print</span>(<span class="str">"الثلاثاء"</span>)
    <span class="kw">case</span> _: <span class="fn">print</span>(<span class="str">"يوم آخر"</span>)</pre>
          <div class="lang-desc">Python 3.10+ أضافت <code>match/case</code> — مشابهة لـ switch لكن أقوى وتدعم مطابقة الأنماط المعقدة.</div>
        </div>
        <div class="lang-card python">
          <div class="lang-header">match مع شروط (guard)</div>
          <pre>score = <span class="num">85</span>
<span class="kw">match</span> score:
    <span class="kw">case</span> s <span class="kw">if</span> s >= <span class="num">90</span>: <span class="fn">print</span>(<span class="str">"ممتاز"</span>)
    <span class="kw">case</span> s <span class="kw">if</span> s >= <span class="num">70</span>: <span class="fn">print</span>(<span class="str">"جيد جداً"</span>)
    <span class="kw">case</span> s <span class="kw">if</span> s >= <span class="num">60</span>: <span class="fn">print</span>(<span class="str">"جيد"</span>)
    <span class="kw">case</span> _: <span class="fn">print</span>(<span class="str">"راسب"</span>)</pre>
        </div>
        <div class="lang-card python">
          <div class="lang-header">محاكاة switch قبل 3.10</div>
          <pre><span class="cm"># قبل Python 3.10 — نستخدم dict</span>
days = {
    <span class="num">1</span>: <span class="str">"الأحد"</span>,
    <span class="num">2</span>: <span class="str">"الاثنين"</span>,
    <span class="num">3</span>: <span class="str">"الثلاثاء"</span>,
}
day = <span class="num">2</span>
result = days.<span class="fn">get</span>(day, <span class="str">"يوم غير معروف"</span>)
<span class="fn">print</span>(result)</pre>
          <div class="lang-desc">قبل Python 3.10 كان المبرمجون يستخدمون <code>dict.get(key, default)</code> كبديل لـ switch — لا تزال تُستخدم كثيراً.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — Switch في Python</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">MAX = 100<br>match x:<br>    case MAX: print("max")</span></div>
          <div class="error-note">MAX يُعامَل كمتغير جديد لا كقيمته 100</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">case 100: print("max")</span></div>
          <div class="error-note">match يعمل مع القيم الحرفية لا المتغيرات</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — Switch في Python</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">match x:</code><code class="quiz-hint-chip" onclick="insertHint(this)">case 1:</code><code class="quiz-hint-chip" onclick="insertHint(this)">case _:</code><code class="quiz-hint-chip" onclick="insertHint(this)">elif x == 1:</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('sw-python', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="sw-js">
      <div class="section-title">Switch في JavaScript</div>
      <div class="lang-grid">
        <div class="lang-card js">
          <div class="lang-header">Switch </div>
          <pre><span class="kw">const</span> day = <span class="num">3</span>;
<span class="kw">switch</span> (day) {
    <span class="kw">case</span> <span class="num">1</span>: console.<span class="fn">log</span>(<span class="str">"الأحد"</span>); <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">2</span>: console.<span class="fn">log</span>(<span class="str">"الاثنين"</span>); <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">3</span>: console.<span class="fn">log</span>(<span class="str">"الثلاثاء"</span>); <span class="kw">break</span>;
    <span class="kw">default</span>: console.<span class="fn">log</span>(<span class="str">"يوم آخر"</span>);
}</pre>
        </div>
        <div class="lang-card js">
          <div class="lang-header">تجميع cases</div>
          <pre><span class="kw">const</span> day = <span class="str">"السبت"</span>;
<span class="kw">switch</span> (day) {
    <span class="kw">case</span> <span class="str">"السبت"</span>:
    <span class="kw">case</span> <span class="str">"الأحد"</span>:
        console.<span class="fn">log</span>(<span class="str">"عطلة نهاية الأسبوع 🎉"</span>);
        <span class="kw">break</span>;
    <span class="kw">default</span>:
        console.<span class="fn">log</span>(<span class="str">"يوم عمل 💼"</span>);
}</pre>
          <div class="lang-desc">يمكن تجميع عدة حالات متتالية لتشاركها نفس الكود — مفيد عندما تريد نفس السلوك لأكثر من قيمة.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — Switch في JavaScript</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">case 1: doA();<br>case 2: doB();</span></div>
          <div class="error-note">Fall-through — يُنفَّذ doA() وdoB() معاً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">case 1: doA(); break;<br>case 2: doB(); break;</span></div>
          <div class="error-note">break إلزامي في كل case</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">switch ("5") { case 5: ... }</span></div>
          <div class="error-note">switch يستخدم === — "5" لا تساوي 5</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">switch (Number("5")) { case 5: ... }</span></div>
          <div class="error-note">حوّل النوع قبل switch إذا كنت غير متأكد</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — Switch في JavaScript</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">switch (x)</code><code class="quiz-hint-chip" onclick="insertHint(this)">case 1:</code><code class="quiz-hint-chip" onclick="insertHint(this)">break;</code><code class="quiz-hint-chip" onclick="insertHint(this)">default:</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('sw-js', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="sw-cpp">
      <div class="section-title">Switch في ++C</div>
      <div class="lang-grid">
        <div class="lang-card cpp">
          <div class="lang-header">Switch </div>
          <pre><span class="kw">int</span> grade = <span class="num">2</span>;
<span class="kw">switch</span> (grade) {
    <span class="kw">case</span> <span class="num">1</span>: cout &lt;&lt; <span class="str">"ممتاز"</span>; <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">2</span>: cout &lt;&lt; <span class="str">"جيد جداً"</span>; <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">3</span>: cout &lt;&lt; <span class="str">"جيد"</span>; <span class="kw">break</span>;
    <span class="kw">default</span>: cout &lt;&lt; <span class="str">"راسب"</span>;
}</pre>
        </div>
        <div class="lang-card cpp">
          <div class="lang-header">Switch مع Enum</div>
          <pre><span class="kw">enum</span> Color { RED, GREEN, BLUE };
Color c = GREEN;

<span class="kw">switch</span> (c) {
    <span class="kw">case</span> RED:   cout &lt;&lt; <span class="str">"أحمر 🔴"</span>; <span class="kw">break</span>;
    <span class="kw">case</span> GREEN: cout &lt;&lt; <span class="str">"أخضر 🟢"</span>; <span class="kw">break</span>;
    <span class="kw">case</span> BLUE:  cout &lt;&lt; <span class="str">"أزرق 🔵"</span>; <span class="kw">break</span>;
}</pre>
          <div class="lang-desc">استخدام Switch مع Enum شائع في ++C — يجعل الكود أوضح وأسهل قراءةً من مقارنة الأرقام مباشرةً.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — Switch في ++C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">switch (str) { ... }</span></div>
          <div class="error-note">++C switch لا يقبل std::string</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (str == "a") { ... }</span></div>
          <div class="error-note">استخدم if-else مع النصوص في ++C</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">case 1:<br>    int x = 5; break;</span></div>
          <div class="error-note">تعريف متغير بعد case بدون أقواس — خطأ</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">case 1: {<br>    int x = 5;<br>    break; }</span></div>
          <div class="error-note">ضع {} حول case إذا عرّفت متغيرات</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — Switch في C++</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">switch (x)</code><code class="quiz-hint-chip" onclick="insertHint(this)">case 1:</code><code class="quiz-hint-chip" onclick="insertHint(this)">break;</code><code class="quiz-hint-chip" onclick="insertHint(this)">default:</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('sw-cpp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="sw-csharp">
      <div class="section-title">Switch في #C</div>
      <div class="lang-grid">
        <div class="lang-card csharp">
          <div class="lang-header">Switch </div>
          <pre><span class="kw">int</span> day = <span class="num">3</span>;
<span class="kw">switch</span> (day) {
    <span class="kw">case</span> <span class="num">1</span>: Console.<span class="fn">WriteLine</span>(<span class="str">"الأحد"</span>); <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">2</span>: Console.<span class="fn">WriteLine</span>(<span class="str">"الاثنين"</span>); <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">3</span>: Console.<span class="fn">WriteLine</span>(<span class="str">"الثلاثاء"</span>); <span class="kw">break</span>;
    <span class="kw">default</span>: Console.<span class="fn">WriteLine</span>(<span class="str">"يوم آخر"</span>); <span class="kw">break</span>;
}</pre>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">Switch Expression (#C 8+)</div>
          <pre><span class="kw">int</span> score = <span class="num">85</span>;
<span class="kw">string</span> grade = score <span class="kw">switch</span> {
    >= <span class="num">90</span> => <span class="str">"ممتاز"</span>,
    >= <span class="num">80</span> => <span class="str">"جيد جداً"</span>,
    >= <span class="num">70</span> => <span class="str">"جيد"</span>,
    >= <span class="num">60</span> => <span class="str">"مقبول"</span>,
    _    => <span class="str">"راسب"</span>
};
Console.<span class="fn">WriteLine</span>(grade);</pre>
          <div class="lang-desc">#C switch expression يُعيد قيمة مباشرة ويدعم Pattern Matching — أقوى وأنظف من switch التقليدي.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — Switch في #C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">case 1:<br>    doA();<br>case 2:<br>    doB();</span></div>
          <div class="error-note">#C لا تسمح بـ Fall-through — خطأ في الترجمة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">case 1: doA(); break;<br>case 2: doB(); break;</span></div>
          <div class="error-note">break أو return إلزامي في #C</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — Switch في C#</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">switch (x)</code><code class="quiz-hint-chip" onclick="insertHint(this)">case 1:</code><code class="quiz-hint-chip" onclick="insertHint(this)">break;</code><code class="quiz-hint-chip" onclick="insertHint(this)">default:</code><code class="quiz-hint-chip" onclick="insertHint(this)">var r = x switch { 1 => "واحد", _ => "أخرى" };</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('sw-csharp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="sw-kotlin">
      <div class="section-title">when في Kotlin —  Switch</div>
      <div class="lang-grid">
        <div class="lang-card kotlin">
          <div class="lang-header">when</div>
          <pre><span class="kw">val</span> day = <span class="num">3</span>
<span class="kw">when</span> (day) {
    <span class="num">1</span> -> <span class="fn">println</span>(<span class="str">"الأحد"</span>)
    <span class="num">2</span> -> <span class="fn">println</span>(<span class="str">"الاثنين"</span>)
    <span class="num">3</span> -> <span class="fn">println</span>(<span class="str">"الثلاثاء"</span>)
    <span class="kw">else</span> -> <span class="fn">println</span>(<span class="str">"يوم آخر"</span>)
}</pre>
          <div class="lang-desc">Kotlin لا تحتاج <code>break</code> في <code>when</code> — كل حالة تنتهي تلقائياً بدون fall-through.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">when كـ Expression + نطاقات</div>
          <pre><span class="kw">val</span> score = <span class="num">85</span>
<span class="kw">val</span> grade = <span class="kw">when</span> (score) {
    <span class="kw">in</span> <span class="num">90</span>..<span class="num">100</span> -> <span class="str">"ممتاز"</span>
    <span class="kw">in</span> <span class="num">80</span>..<span class="num">89</span>  -> <span class="str">"جيد جداً"</span>
    <span class="kw">in</span> <span class="num">70</span>..<span class="num">79</span>  -> <span class="str">"جيد"</span>
    <span class="kw">in</span> <span class="num">60</span>..<span class="num">69</span>  -> <span class="str">"مقبول"</span>
    <span class="kw">else</span>        -> <span class="str">"راسب"</span>
}
<span class="fn">println</span>(grade)  <span class="cm">// جيد جداً</span></pre>
          <div class="lang-desc"><code>in</code> في <code>when</code> يتحقق من النطاق مباشرةً — أنظف بكثير من كتابة <code>x >= 60 && x < 70</code>.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">when مع قيم متعددة وأنواع</div>
          <pre><span class="kw">val</span> lang = <span class="str">"Kotlin"</span>
<span class="kw">when</span> (lang) {
    <span class="str">"Java"</span>, <span class="str">"Kotlin"</span> -> <span class="fn">println</span>(<span class="str">"JVM 🚀"</span>)
    <span class="str">"Python"</span>         -> <span class="fn">println</span>(<span class="str">"سهل 🐍"</span>)
    <span class="kw">else</span>             -> <span class="fn">println</span>(<span class="str">"لغة أخرى"</span>)
}

<span class="cm">// when بدون متغير (مثل if-else)</span>
<span class="kw">val</span> x = <span class="num">15</span>
<span class="kw">when</span> {
    x &lt; <span class="num">0</span>  -> <span class="fn">println</span>(<span class="str">"سالب"</span>)
    x == <span class="num">0</span> -> <span class="fn">println</span>(<span class="str">"صفر"</span>)
    x > <span class="num">0</span>  -> <span class="fn">println</span>(<span class="str">"موجب"</span>)
}</pre>
          <div class="lang-desc"><code>when</code> بدون متغير يعمل مثل if-else. يمكن دمج قيم متعددة في حالة واحدة بفاصلة.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — Switch في Kotlin</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">val result = when (x) {<br>    1 -&gt; "واحد"<br>}</span></div>
          <div class="error-note">when كـ expression بدون else — خطأ في الترجمة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">val result = when (x) {<br>    1 -&gt; "واحد"<br>    else -&gt; "غير معروف"<br>}</span></div>
          <div class="error-note">else إلزامي عند استخدام when كـ expression</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — Switch في Kotlin</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">when (x)</code><code class="quiz-hint-chip" onclick="insertHint(this)">1 -> "واحد"</code><code class="quiz-hint-chip" onclick="insertHint(this)">else -> "أخرى"</code><code class="quiz-hint-chip" onclick="insertHint(this)">in 1..5 -> "صغير"</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('sw-kotlin', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    
    <!-- PHP SWITCH -->
    <div class="topic-section" id="sw-php">
      <div class="section-title">Switch و match في PHP</div>
      <div class="lang-grid">
        <div class="lang-card php">
          <div class="lang-header">Switch</div>
          <pre>$day = <span class="num">3</span>;
<span class="kw">switch</span> ($day) {
    <span class="kw">case</span> <span class="num">1</span>: <span class="kw">echo</span> <span class="str">"الأحد"</span>;     <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">2</span>: <span class="kw">echo</span> <span class="str">"الاثنين"</span>;    <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">3</span>: <span class="kw">echo</span> <span class="str">"الثلاثاء"</span>;   <span class="kw">break</span>;
    <span class="kw">case</span> <span class="num">6</span>:
    <span class="kw">case</span> <span class="num">7</span>: <span class="kw">echo</span> <span class="str">"عطلة"</span>;       <span class="kw">break</span>;
    <span class="kw">default</span>: <span class="kw">echo</span> <span class="str">"يوم عمل"</span>;
}</pre>
          <div class="lang-desc">تحذير: PHP switch يستخدم <code>==</code> وليس <code>===</code> — قد يُطابق قيماً من أنواع مختلفة بشكل غير متوقع.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">match — PHP 8+</div>
          <pre>$day = <span class="num">3</span>;
$name = <span class="kw">match</span>($day) {
    <span class="num">1</span> =&gt; <span class="str">"الأحد"</span>,
    <span class="num">2</span> =&gt; <span class="str">"الاثنين"</span>,
    <span class="num">3</span> =&gt; <span class="str">"الثلاثاء"</span>,
    <span class="num">6</span>, <span class="num">7</span> =&gt; <span class="str">"عطلة"</span>,
    <span class="kw">default</span> =&gt; <span class="str">"يوم آخر"</span>
};
<span class="kw">echo</span> $name; <span class="cm">// الثلاثاء</span></pre>
          <div class="lang-desc"><code>match</code> أحدث وأفضل من <code>switch</code> في PHP: مقارنة صارمة، يُعيد قيمة، لا يحتاج <code>break</code>.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — Switch في PHP</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">switch ("0") {<br>    case false: echo "false"; } // يطبع false!</span></div>
          <div class="error-note">switch يستخدم == — "0" تساوي false</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">match("0") {<br>    false =&gt; "false"<br>}  // لا يطابق</span></div>
          <div class="error-note">match يستخدم === — أأمن من switch</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — Switch في PHP</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">switch ($x)</code><code class="quiz-hint-chip" onclick="insertHint(this)">case 1:</code><code class="quiz-hint-chip" onclick="insertHint(this)">break;</code><code class="quiz-hint-chip" onclick="insertHint(this)">default:</code><code class="quiz-hint-chip" onclick="insertHint(this)">match($x) { 1 => "واحد", default => "أخرى" };</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('sw-php', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
  </div>
</div>

</asp:Content>
