<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Print.aspx.cs" Inherits="PrintPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — Print / الطباعة</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>🖨️ Print / الطباعة</h2>
    <p>طريقة عرض النصوص والمتغيرات في لغات البرمجة</p>
  </div>
  <div class="content-wrap">
    <div class="topic-nav">
      <button type="button" class="topic-btn active" onclick="showTopic('pr','java',this)">Java</button>
      <button type="button" class="topic-btn" onclick="showTopic('pr','python',this)">Python</button>
      <button type="button" class="topic-btn" onclick="showTopic('pr','js',this)">JavaScript</button>
      <button type="button" class="topic-btn" onclick="showTopic('pr','cpp',this)">++C</button>
      <button type="button" class="topic-btn" onclick="showTopic('pr','csharp',this)">#C</button>
      <button type="button" class="topic-btn" onclick="showTopic('pr','kotlin',this)">Kotlin</button>
      <button type="button" class="topic-btn" onclick="showTopic('pr','php',this)">PHP</button>
    </div>

    <div class="info-box">
      <strong>الطباعة (Print)</strong> هي أول شيء تتعلمه في أي لغة — تُستخدم لعرض النصوص، المتغيرات، والنتائج.
      كل لغة لها طريقتها الخاصة وميزاتها في التنسيق والدمج.
    </div>

    <!-- JAVA -->
    <div class="topic-section active" id="pr-java">
      <div class="section-title">الطباعة في Java</div>
      <div class="lang-grid">
        <div class="lang-card java">
          <div class="lang-header">println و print</div>
          <pre>System.out.<span class="fn">println</span>(<span class="str">"مرحباً بالعالم!"</span>);  <span class="cm">// مع سطر جديد</span>
System.out.<span class="fn">print</span>(<span class="str">"علي "</span>);            <span class="cm">// بدون سطر جديد</span>
System.out.<span class="fn">print</span>(<span class="str">"نورة"</span>);
<span class="cm">// النتيجة: علي نورة</span>

<span class="kw">int</span> age = <span class="num">25</span>;
System.out.<span class="fn">println</span>(<span class="str">"العمر: "</span> + age);</pre>
          <div class="lang-desc"><code>println</code> تطبع وتنزل سطراً جديداً. <code>print</code> تطبع بدون سطر جديد — مفيدة لطباعة عدة قيم في سطر واحد.</div>
        </div>
        <div class="lang-card java">
          <div class="lang-header">printf — طباعة منسّقة</div>
          <pre><span class="kw">String</span> name = <span class="str">"علي"</span>;
<span class="kw">int</span> age = <span class="num">25</span>;
<span class="kw">double</span> gpa = <span class="num">3.857</span>;

System.out.<span class="fn">printf</span>(<span class="str">"الاسم: %s%n"</span>, name);
System.out.<span class="fn">printf</span>(<span class="str">"العمر: %d سنة%n"</span>, age);
System.out.<span class="fn">printf</span>(<span class="str">"المعدل: %.2f%n"</span>, gpa);
<span class="cm">// المعدل: 3.86</span></pre>
          <div class="lang-desc"><code>%s</code> للنص، <code>%d</code> للأرقام الصحيحة، <code>%.2f</code> للعشريات بمنزلتين — نفس صياغة لغة C.</div>
        </div>
        <div class="lang-card java">
          <div class="lang-header">String.format</div>
          <pre><span class="kw">String</span> name = <span class="str">"نورة"</span>;
<span class="kw">int</span> score = <span class="num">95</span>;

<span class="kw">String</span> msg = String.<span class="fn">format</span>(
    <span class="str">"الطالبة %s حصلت على %d"</span>, name, score
);
System.out.<span class="fn">println</span>(msg);

<span class="cm">// أو مباشرة في println:</span>
System.out.<span class="fn">println</span>(
    String.<span class="fn">format</span>(<span class="str">"%.1f%%"</span>, <span class="num">98.6</span>)
);</pre>
          <div class="lang-desc"><code>String.format</code> تُنتج نصاً منسّقاً دون طباعة — احفظه في متغير واستخدمه لاحقاً أو مرّره لدالة أخرى.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الطباعة في Java</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">System.out.println(3/2);</span></div>
          <div class="error-note">نتيجة 1 — قسمة int على int تُقطع الكسر</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">System.out.println(3.0/2); // 1.5</span></div>
          <div class="error-note">اجعل أحد الرقمين عشرياً للحصول على 1.5</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">System.out.printf("%d", 3.14);</span></div>
          <div class="error-note">%d للأرقام الصحيحة فقط — يُسبّب خطأ</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">System.out.printf("%.2f", 3.14);</span></div>
          <div class="error-note">%f أو %.2f للأرقام العشرية</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الطباعة في Java</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">System.out.println("مرحباً");</code><code class="quiz-hint-chip" onclick="insertHint(this)">System.out.print("اسمي: ");</code><code class="quiz-hint-chip" onclick="insertHint(this)">System.out.printf("%.2f%n", 3.14);</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('pr-java', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <!-- PYTHON -->
    <div class="topic-section" id="pr-python">
      <div class="section-title">الطباعة في Python</div>
      <div class="lang-grid">
        <div class="lang-card python">
          <div class="lang-header">print </div>
          <pre><span class="fn">print</span>(<span class="str">"مرحباً بالعالم!"</span>)

name = <span class="str">"علي"</span>
age = <span class="num">25</span>
<span class="fn">print</span>(<span class="str">"الاسم:"</span>, name, <span class="str">"| العمر:"</span>, age)

<span class="cm"># تحكم في الفاصل والنهاية</span>
<span class="fn">print</span>(<span class="str">"علي"</span>, <span class="str">"نورة"</span>, <span class="str">"محمد"</span>, sep=<span class="str">" - "</span>)
<span class="fn">print</span>(<span class="str">"السطر الأول"</span>, end=<span class="str">" | "</span>)
<span class="fn">print</span>(<span class="str">"نفس السطر"</span>)</pre>
          <div class="lang-desc"><code>sep</code> يُغيّر الفاصل بين القيم (افتراضي: مسافة). <code>end</code> يُغيّر نهاية الطباعة (افتراضي: سطر جديد).</div>
        </div>
        <div class="lang-card python">
          <div class="lang-header">f-string </div>
          <pre>name = <span class="str">"نورة"</span>
score = <span class="num">95</span>
gpa = <span class="num">3.857</span>

<span class="fn">print</span>(<span class="str">f"الاسم: {name}"</span>)
<span class="fn">print</span>(<span class="str">f"الدرجة: {score}"</span>)
<span class="fn">print</span>(<span class="str">f"المعدل: {gpa:.2f}"</span>)   <span class="cm"># 3.86</span>
<span class="fn">print</span>(<span class="str">f"الضعف: {score * 2}"</span>) <span class="cm"># تعبيرات مباشرة</span>
<span class="fn">print</span>(<span class="str">f"{'ممتاز' if score >= 90 else 'جيد'}"</span>)</pre>
          <div class="lang-desc">f-string من Python 3.6+ — الأسلوب الأحدث والأنظف. تدعم التعبيرات الحسابية داخل <code>{}</code> مباشرة.</div>
        </div>
        <div class="lang-card python">
          <div class="lang-header">pprint للبيانات المعقدة</div>
          <pre><span class="kw">from</span> pprint <span class="kw">import</span> pprint

data = {
    <span class="str">"name"</span>: <span class="str">"علي"</span>,
    <span class="str">"courses"</span>: [<span class="str">"Python"</span>, <span class="str">"Java"</span>, <span class="str">"++C"</span>],
    <span class="str">"scores"</span>: {<span class="str">"math"</span>: <span class="num">95</span>, <span class="str">"cs"</span>: <span class="num">98</span>}
}

<span class="fn">pprint</span>(data)  <span class="cm"># طباعة منظّمة وجميلة</span>
<span class="fn">print</span>(<span class="fn">type</span>(data))  <span class="cm"># &lt;class 'dict'&gt;</span></pre>
          <div class="lang-desc"><code>pprint</code> تطبع القوائم والقواميس المعقدة بشكل منسّق وسهل القراءة — مفيدة جداً في التنقيح والتطوير.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الطباعة في Python</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">print("العمر: " + 25)</span></div>
          <div class="error-note">TypeError — لا يمكن دمج String مع int</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">print(f"العمر: {25}")</span></div>
          <div class="error-note">f-string أو مرّر القيم كوسائط منفصلة</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">print("النتيجة: " + str(3/2))</span></div>
          <div class="error-note">طريقة قديمة ومطوّلة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">print(f"النتيجة: {3/2:.2f}")</span></div>
          <div class="error-note">f-string تدعم التنسيق مباشرةً</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الطباعة في Python</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">print("مرحباً")</code><code class="quiz-hint-chip" onclick="insertHint(this)">print(f"اسمي {name}")</code><code class="quiz-hint-chip" onclick="insertHint(this)">print("العدد:", 42)</code><code class="quiz-hint-chip" onclick="insertHint(this)">print("a", "b", sep=", ")</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('pr-python', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <!-- JAVASCRIPT -->
    <div class="topic-section" id="pr-js">
      <div class="section-title">الطباعة في JavaScript</div>
      <div class="lang-grid">
        <div class="lang-card js">
          <div class="lang-header">console </div>
          <pre>console.<span class="fn">log</span>(<span class="str">"مرحباً بالعالم!"</span>);

<span class="kw">const</span> name = <span class="str">"علي"</span>;
<span class="kw">const</span> age = <span class="num">25</span>;
console.<span class="fn">log</span>(<span class="str">"الاسم:"</span>, name, <span class="str">"| العمر:"</span>, age);
console.<span class="fn">log</span>(<span class="str">`مرحباً ${name}!`</span>);  <span class="cm">// Template Literal</span>

<span class="cm">// أنواع أخرى من الطباعة</span>
console.<span class="fn">warn</span>(<span class="str">"تحذير! ⚠️"</span>);
console.<span class="fn">error</span>(<span class="str">"خطأ! ❌"</span>);
console.<span class="fn">info</span>(<span class="str">"معلومة ℹ️"</span>);</pre>
          <div class="lang-desc"><code>console.warn</code> يُظهر تحذيراً باللون الأصفر. <code>console.error</code> باللون الأحمر — سهّلا تتبع الأخطاء.</div>
        </div>
        <div class="lang-card js">
          <div class="lang-header">console.table و console.group</div>
          <pre><span class="kw">const</span> students = [
    { name: <span class="str">"علي"</span>, score: <span class="num">95</span> },
    { name: <span class="str">"نورة"</span>, score: <span class="num">88</span> },
    { name: <span class="str">"محمد"</span>, score: <span class="num">92</span> }
];
console.<span class="fn">table</span>(students); <span class="cm">// جدول مرتّب</span>

console.<span class="fn">group</span>(<span class="str">"نتائج الطلاب"</span>);
students.<span class="fn">forEach</span>(s =>
    console.<span class="fn">log</span>(<span class="str">`${s.name}: ${s.score}`</span>)
);
console.<span class="fn">groupEnd</span>();</pre>
          <div class="lang-desc"><code>console.table</code> تعرض المصفوفات والكائنات كجدول منسّق في الـ Console — أوضح بكثير من console.log العادي.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الطباعة في JavaScript</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">console.log("مرحبا" + 2 + 3); // "مرحبا23"</span></div>
          <div class="error-note">+ مع string يُدمج بدلاً من الحساب</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">console.log(`مرحبا ${2 + 3}`); // "مرحبا5"</span></div>
          <div class="error-note">Template literal يُنفّذ الحساب داخل ${}</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">console.log({name:"علي"}); // [object Object]</span></div>
          <div class="error-note">console.log لا يُظهر محتوى الكائن</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">console.table({name:"علي"});</span></div>
          <div class="error-note">console.table للكائنات والمصفوفات</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الطباعة في JavaScript</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">console.log("مرحباً");</code><code class="quiz-hint-chip" onclick="insertHint(this)">console.log(`اسمي ${name}`);</code><code class="quiz-hint-chip" onclick="insertHint(this)">console.table([1,2,3]);</code><code class="quiz-hint-chip" onclick="insertHint(this)">console.error("خطأ!");</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('pr-js', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <!-- ++C -->
    <div class="topic-section" id="pr-cpp">
      <div class="section-title">الطباعة في ++C</div>
      <div class="lang-grid">
        <div class="lang-card cpp">
          <div class="lang-header">cout </div>
          <pre><span class="kw">#include</span> &lt;iostream&gt;
<span class="kw">using namespace</span> std;

cout &lt;&lt; <span class="str">"مرحباً بالعالم!"</span> &lt;&lt; endl;

<span class="kw">string</span> name = <span class="str">"علي"</span>;
<span class="kw">int</span> age = <span class="num">25</span>;
cout &lt;&lt; <span class="str">"الاسم: "</span> &lt;&lt; name &lt;&lt; endl;
cout &lt;&lt; <span class="str">"العمر: "</span> &lt;&lt; age &lt;&lt; endl;

<span class="cm">// بدون سطر جديد:</span>
cout &lt;&lt; <span class="str">"علي "</span> &lt;&lt; <span class="str">"نورة"</span>;</pre>
          <div class="lang-desc">الفرق: <code>endl</code> ينزل سطراً ويُفرغ Buffer الكتابة (أبطأ). <code>"\n"</code> ينزل سطراً فقط (أسرع). استخدم <code>"\n"</code> في الغالب.</div>
        </div>
        <div class="lang-card cpp">
          <div class="lang-header">printf و setprecision</div>
          <pre><span class="kw">#include</span> &lt;iomanip&gt;

<span class="kw">double</span> gpa = <span class="num">3.857</span>;
printf(<span class="str">"المعدل: %.2f\n"</span>, gpa);  <span class="cm">// 3.86</span>

<span class="cm">// أو مع cout:</span>
cout &lt;&lt; fixed &lt;&lt; setprecision(<span class="num">2</span>);
cout &lt;&lt; <span class="str">"المعدل: "</span> &lt;&lt; gpa &lt;&lt; endl;

<span class="cm">// محاذاة النص:</span>
cout &lt;&lt; setw(<span class="num">10</span>) &lt;&lt; <span class="str">"علي"</span> &lt;&lt; endl;
cout &lt;&lt; setw(<span class="num">10</span>) &lt;&lt; <span class="str">"نورة"</span> &lt;&lt; endl;</pre>
          <div class="lang-desc"><code>setw(10)</code> يُحدد عرض العمود. <code>setprecision(2)</code> يُحدد عدد المنازل العشرية. كلاهما من مكتبة <code>&lt;iomanip&gt;</code>.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الطباعة في ++C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">cout &lt;&lt; 7/2; // النتيجة: 3</span></div>
          <div class="error-note">قسمة int على int تُقطع الكسر</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">cout &lt;&lt; 7.0/2; // النتيجة: 3.5</span></div>
          <div class="error-note">اجعل أحد الرقمين عشرياً</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">cout &lt;&lt; endl &lt;&lt; endl;</span></div>
          <div class="error-note">endl يُفرغ الـ Buffer مع كل استخدام — بطيء</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">cout &lt;&lt; "\n\n";</span></div>
          <div class="error-note">\n أسرع بكثير من endl في الحلقات</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الطباعة في C++</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">cout << "مرحباً" << endl;</code><code class="quiz-hint-chip" onclick="insertHint(this)">cout << "العدد: " << x << "\n";</code><code class="quiz-hint-chip" onclick="insertHint(this)">printf("%.2f\n", 3.14);</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('pr-cpp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <!-- #C -->
    <div class="topic-section" id="pr-csharp">
      <div class="section-title">الطباعة في #C</div>
      <div class="lang-grid">
        <div class="lang-card csharp">
          <div class="lang-header">WriteLine و Write</div>
          <pre>Console.<span class="fn">WriteLine</span>(<span class="str">"مرحباً بالعالم!"</span>); <span class="cm">// مع سطر جديد</span>
Console.<span class="fn">Write</span>(<span class="str">"علي "</span>);               <span class="cm">// بدون سطر جديد</span>
Console.<span class="fn">Write</span>(<span class="str">"نورة"</span>);
<span class="cm">// النتيجة: علي نورة</span>

<span class="kw">string</span> name = <span class="str">"علي"</span>;
<span class="kw">int</span> age = <span class="num">25</span>;
Console.<span class="fn">WriteLine</span>(<span class="str">"الاسم: "</span> + name);
Console.<span class="fn">WriteLine</span>(<span class="str">$"العمر: {age}"</span>);</pre>
          <div class="lang-desc"><code>WriteLine</code> تطبع وتنزل سطراً. <code>Write</code> تطبع بدون سطر جديد — مثل Java تماماً.</div>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">String Interpolation و Format</div>
          <pre><span class="kw">string</span> name = <span class="str">"نورة"</span>;
<span class="kw">double</span> gpa = <span class="num">3.857</span>;
<span class="kw">int</span> score = <span class="num">95</span>;

<span class="cm">// Interpolation (الأحدث والأنظف)</span>
Console.<span class="fn">WriteLine</span>(<span class="str">$"الطالبة: {name}"</span>);
Console.<span class="fn">WriteLine</span>(<span class="str">$"المعدل: {gpa:F2}"</span>);   <span class="cm">// 3.86</span>
Console.<span class="fn">WriteLine</span>(<span class="str">$"الدرجة: {score:D3}"</span>);  <span class="cm">// 095</span>

<span class="cm">// Format </span>
Console.<span class="fn">WriteLine</span>(
    <span class="str">"الاسم: {0} | المعدل: {1:F2}"</span>, name, gpa
);</pre>
          <div class="lang-desc"><code>:F2</code> لمنزلتين عشريتين. <code>:D3</code> لرقم صحيح بثلاثة خانات. <code>:C</code> لتنسيق العملة تلقائياً.</div>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">Console.ForegroundColor</div>
          <pre>Console.ForegroundColor = ConsoleColor.Green;
Console.<span class="fn">WriteLine</span>(<span class="str">"✅ العملية نجحت!"</span>);

Console.ForegroundColor = ConsoleColor.Red;
Console.<span class="fn">WriteLine</span>(<span class="str">"❌ حدث خطأ!"</span>);

Console.ForegroundColor = ConsoleColor.Yellow;
Console.<span class="fn">WriteLine</span>(<span class="str">"⚠️ تحذير!"</span>);

Console.<span class="fn">ResetColor</span>(); <span class="cm">// إعادة اللون الافتراضي</span></pre>
          <div class="lang-desc">#C تدعم تلوين نص الـ Console — مفيد للتمييز بين رسائل النجاح (أخضر) والأخطاء (أحمر) والتحذيرات (أصفر).</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الطباعة في #C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">Console.WriteLine("قيمة: " + x + y);</span></div>
          <div class="error-note">إذا x=1 وy=2 النتيجة "قيمة: 12" لا "قيمة: 3"</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">Console.WriteLine($"قيمة: {x + y}");</span></div>
          <div class="error-note">$"" تُنفّذ الحسابات داخل {}</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الطباعة في C#</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">Console.WriteLine("مرحباً");</code><code class="quiz-hint-chip" onclick="insertHint(this)">Console.Write("اسمي: ");</code><code class="quiz-hint-chip" onclick="insertHint(this)">Console.WriteLine($"القيمة: {x}");</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('pr-csharp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="pr-kotlin">
      <div class="section-title">الطباعة في Kotlin</div>
      <div class="lang-grid">
        <div class="lang-card kotlin">
          <div class="lang-header">println و print</div>
          <pre>println(<span class="str">"مرحباً بالعالم!"</span>)  <span class="cm">// مع سطر جديد</span>
print(<span class="str">"علي "</span>)               <span class="cm">// بدون سطر جديد</span>
print(<span class="str">"نورة"</span>)
<span class="cm">// النتيجة: علي نورة</span>

<span class="kw">val</span> name = <span class="str">"علي"</span>
<span class="kw">val</span> age = <span class="num">25</span>
println(<span class="str">"الاسم: "</span> + name)
println(<span class="str">"العمر: $age"</span>)  <span class="cm">// String Template</span></pre>
          <div class="lang-desc"><code>println</code> و<code>print</code> في Kotlin دوال مستوى أعلى — لا تحتاج كتابة اسم الكلاس قبلها كما في Java.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">String Templates </div>
          <pre><span class="kw">val</span> name = <span class="str">"نورة"</span>
<span class="kw">val</span> score = <span class="num">95</span>
<span class="kw">val</span> gpa = <span class="num">3.857</span>

println(<span class="str">"الاسم: $name"</span>)
println(<span class="str">"الدرجة: $score"</span>)
println(<span class="str">"المعدل: ${"%.2f".format(gpa)}"</span>)  <span class="cm">// 3.86</span>

<span class="cm">// تعبيرات مباشرة</span>
println(<span class="str">"ضعف الدرجة: ${score * 2}"</span>)
println(<span class="str">"${if (score >= 90) "ممتاز" else "جيد"}"</span>)

<span class="cm">// متعدد الأسطر (Triple quotes)</span>
println(<span class="str">"""
اسم: $name
معدل: $gpa
"""</span>.<span class="fn">trimIndent</span>())</pre>
          <div class="lang-desc">String Templates في Kotlin: <code>$variable</code> للمتغيرات . <code>${expression}</code> للتعبيرات الحسابية.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">طباعة القوائم والكائنات</div>
          <pre><span class="kw">val</span> nums = listOf(<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>, <span class="num">4</span>, <span class="num">5</span>)
println(nums)              <span class="cm">// [1, 2, 3, 4, 5]</span>
println(nums.<span class="fn">joinToString</span>(<span class="str">" - "</span>))  <span class="cm">// 1 - 2 - 3 - 4 - 5</span>

<span class="kw">data class</span> <span class="fn">Student</span>(<span class="kw">val</span> name: String, <span class="kw">val</span> gpa: Double)
<span class="kw">val</span> s = <span class="fn">Student</span>(<span class="str">"علي"</span>, <span class="num">3.8</span>)
println(s)  <span class="cm">// Student(name=علي, gpa=3.8)</span>

<span class="cm">// طباعة منسّقة</span>
<span class="kw">val</span> pi = <span class="num">3.14159</span>
println(<span class="str">"%.3f".format(pi)</span>)  <span class="cm">// 3.142</span></pre>
          <div class="lang-desc"><code>joinToString</code> تُحوّل القائمة لنص مع فاصل مخصص — أنيق جداً بدلاً من حلقة for لطباعة العناصر.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الطباعة في Kotlin</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">println("طول: $name.length")</span></div>
          <div class="error-note">يطبع "$name.length" حرفياً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">println("طول: ${name.length}")</span></div>
          <div class="error-note">${} للتعبيرات التي تحتوي نقطة</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">print(7/2) // النتيجة: 3</span></div>
          <div class="error-note">قسمة Int على Int تُقطع الكسر</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">print(7.0/2) // النتيجة: 3.5</span></div>
          <div class="error-note">اجعل أحد الرقمين Double</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الطباعة في Kotlin</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">println("مرحباً")</code><code class="quiz-hint-chip" onclick="insertHint(this)">print("اسمي: ")</code><code class="quiz-hint-chip" onclick="insertHint(this)">println("اسمي $name")</code><code class="quiz-hint-chip" onclick="insertHint(this)">println("الناتج: ${x * 2}")</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('pr-kotlin', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    
    <!-- PHP PRINT -->
    <div class="topic-section" id="pr-php">
      <div class="section-title">الطباعة في PHP</div>
      <div class="lang-grid">
        <div class="lang-card php">
          <div class="lang-header">echo و print</div>
          <pre><span class="kw">echo</span> <span class="str">"مرحباً بالعالم!\n"</span>;
$name = <span class="str">"علي"</span>;
$age  = <span class="num">25</span>;
<span class="kw">echo</span> <span class="str">"الاسم: $name\n"</span>;   <span class="cm">// "" تُفسّر المتغيرات</span>
<span class="kw">echo</span> <span class="str">"العمر: {$age}\n"</span>;  <span class="cm">// {} للتوضيح</span>
<span class="kw">echo</span> <span class="str">'لا تفسير: $name'</span>;  <span class="cm">// '' = نص حرفي</span></pre>
          <div class="lang-desc"><code>echo</code> أسرع وأكثر استخداماً من <code>print</code>. الأقواس المزدوجة <code>""</code> تُفسّر المتغيرات، المفردة <code>''</code> لا تفعل.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">printf و sprintf</div>
          <pre>$name = <span class="str">"نورة"</span>;
$gpa  = <span class="num">3.857</span>;
$score = <span class="num">95</span>;

<span class="fn">printf</span>(<span class="str">"الاسم: %s\n"</span>, $name);
<span class="fn">printf</span>(<span class="str">"المعدل: %.2f\n"</span>, $gpa);   <span class="cm">// 3.86</span>
<span class="fn">printf</span>(<span class="str">"الدرجة: %d\n"</span>, $score);

<span class="cm">// sprintf تُخزّن بدون طباعة</span>
$msg = <span class="fn">sprintf</span>(<span class="str">"الطالبة %s: %d"</span>, $name, $score);
<span class="kw">echo</span> $msg;</pre>
          <div class="lang-desc">نفس صياغة C: <code>%s</code> للنص، <code>%d</code> للأرقام، <code>%.2f</code> للعشريات. <code>sprintf</code> تُعيد النص بدلاً من طباعته.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">print_r و var_dump</div>
          <pre>$arr = [<span class="str">"علي"</span>, <span class="str">"نورة"</span>, <span class="str">"محمد"</span>];

<span class="fn">print_r</span>($arr);    <span class="cm">// عرض مقروء للمصفوفة</span>
<span class="cm">// Array ( [0] => علي [1] => نورة ... )</span>

<span class="fn">var_dump</span>($arr);   <span class="cm">// مع الأنواع والأحجام</span>
<span class="cm">// array(3) { [0]=> string(3) "علي" ... }</span>

<span class="fn">var_export</span>($arr); <span class="cm">// صياغة PHP صالحة للنسخ</span></pre>
          <div class="lang-desc"><code>var_dump</code> للتنقيح المفصّل — تُظهر النوع والحجم والقيمة. <code>print_r</code> أبسط وأقرب للقراءة البشرية.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الطباعة في PHP</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">echo 'مرحباً $name';</span></div>
          <div class="error-note">المفردة لا تُفسّر المتغيرات — يطبع $name حرفياً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">echo "مرحباً $name";</span></div>
          <div class="error-note">الأقواس المزدوجة تُفسّر المتغيرات</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">print_r($arr); // في الإنتاج</span></div>
          <div class="error-note">يُظهر بيانات حساسة للمستخدم</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">error_log(print_r($arr, true));</span></div>
          <div class="error-note">سجّل في الـ log بدلاً من العرض</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الطباعة في PHP</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">echo "مرحباً";</code><code class="quiz-hint-chip" onclick="insertHint(this)">echo "$name";</code><code class="quiz-hint-chip" onclick="insertHint(this)">printf("%.2f", 3.14);</code><code class="quiz-hint-chip" onclick="insertHint(this)">print_r($array);</code><code class="quiz-hint-chip" onclick="insertHint(this)">var_dump($x);</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('pr-php', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      </div>
      </div>
    </div>

  </div>
</div>




 




</asp:Content>
