<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Functions.aspx.cs" Inherits="FunctionsPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — Functions / الدوال</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>⚙️ Functions / الدوال</h2>
    <p>أساس إعادة استخدام الكود — تعلّم كيف تكتب دوالاً احترافية</p>
  </div>
  <div class="content-wrap">
    <div class="topic-nav">
      <button type="button" class="topic-btn active" onclick="showTopic('fn','java',this)">Java</button>
      <button type="button" class="topic-btn" onclick="showTopic('fn','python',this)">Python</button>
      <button type="button" class="topic-btn" onclick="showTopic('fn','js',this)">JavaScript</button>
      <button type="button" class="topic-btn" onclick="showTopic('fn','cpp',this)">++C</button>
      <button type="button" class="topic-btn" onclick="showTopic('fn','csharp',this)">#C</button>
      <button type="button" class="topic-btn" onclick="showTopic('fn','kotlin',this)">Kotlin</button>
      <button type="button" class="topic-btn" onclick="showTopic('fn','php',this)">PHP</button>
    </div>

    <div class="info-box">
      <strong>الدوال (Functions)</strong> تُستخدم لتجميع كود يُكرَّر في مكان واحد. تُحسّن القراءة وتُسهّل الصيانة.
      كل دالة تحتوي على: <code>اسم</code> + <code>معاملات (parameters)</code> + <code>نوع الإرجاع</code> + <code>الكود</code>.
    </div>

    <div class="topic-section active" id="fn-java">
      <div class="section-title">الدوال في Java</div>
      <div class="lang-grid">
        <div class="lang-card java">
          <div class="lang-header">دالة </div>
          <pre><span class="kw">public static void</span> <span class="fn">greet</span>(String name) {
    System.out.<span class="fn">println</span>(<span class="str">"مرحباً "</span> + name);
}

<span class="cm">// الاستدعاء:</span>
<span class="fn">greet</span>(<span class="str">"علي"</span>);
<span class="fn">greet</span>(<span class="str">"نورة"</span>);</pre>
        </div>
        <div class="lang-card java">
          <div class="lang-header">دالة بقيمة مُرجعة</div>
          <pre><span class="kw">public static int</span> <span class="fn">add</span>(<span class="kw">int</span> a, <span class="kw">int</span> b) {
    <span class="kw">return</span> a + b;
}

<span class="kw">public static double</span> <span class="fn">average</span>(<span class="kw">int</span>[] nums) {
    <span class="kw">int</span> sum = <span class="num">0</span>;
    <span class="kw">for</span> (<span class="kw">int</span> n : nums) sum += n;
    <span class="kw">return</span> (<span class="kw">double</span>) sum / nums.length;
}</pre>
        </div>
        <div class="lang-card java">
          <div class="lang-header">Method Overloading</div>
          <pre><span class="kw">public static int</span> <span class="fn">multiply</span>(<span class="kw">int</span> a, <span class="kw">int</span> b) {
    <span class="kw">return</span> a * b;
}

<span class="kw">public static double</span> <span class="fn">multiply</span>(<span class="kw">double</span> a, <span class="kw">double</span> b) {
    <span class="kw">return</span> a * b;
}
<span class="cm">// نفس الاسم — نوع مختلف</span>
System.out.<span class="fn">println</span>(<span class="fn">multiply</span>(<span class="num">3</span>, <span class="num">4</span>));
System.out.<span class="fn">println</span>(<span class="fn">multiply</span>(<span class="num">2.5</span>, <span class="num">3.0</span>));</pre>
          <div class="lang-desc">Java تدعم Overloading: نفس اسم الدالة مع معاملات مختلفة — Java تختار الصحيحة تلقائياً عند الاستدعاء.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الدوال في Java</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">void add(int a, int b) {<br>    return a + b; }</span></div>
          <div class="error-note">void تعني لا تُعيد قيمة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">int add(int a, int b) {<br>    return a + b; }</span></div>
          <div class="error-note">حدّد نوع القيمة المُعادة</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">int divide(int a, int b) { return a/b; }<br>divide(10, 0)</span></div>
          <div class="error-note">ArithmeticException إذا b = 0</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (b == 0) throw new IllegalArgumentException("صفر!");<br>return a / b;</span></div>
          <div class="error-note">تحقق من الحالات الاستثنائية قبل الحساب</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الدوال في Java</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">public void greet(String name)</code><code class="quiz-hint-chip" onclick="insertHint(this)">public int add(int a, int b)</code><code class="quiz-hint-chip" onclick="insertHint(this)">private static double avg(int[] arr)</code><code class="quiz-hint-chip" onclick="insertHint(this)">public String getName()</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('fn-java', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="fn-python">
      <div class="section-title">الدوال في Python</div>
      <div class="lang-grid">
        <div class="lang-card python">
          <div class="lang-header">دالة  + قيمة افتراضية</div>
          <pre><span class="kw">def</span> <span class="fn">greet</span>(name, greeting=<span class="str">"مرحباً"</span>):
    <span class="fn">print</span>(<span class="str">f"{greeting} {name}!"</span>)

<span class="fn">greet</span>(<span class="str">"علي"</span>)
<span class="fn">greet</span>(<span class="str">"نورة"</span>, <span class="str">"أهلاً"</span>)</pre>
          <div class="lang-desc">القيم الافتراضية تجعل المعاملات اختيارية عند الاستدعاء — تُبسّط استخدام الدالة وتُقلّل الحاجة لتعريفات متعددة.</div>
        </div>
        <div class="lang-card python">
          <div class="lang-header">Lambda (دوال مجهولة)</div>
          <pre>square = <span class="kw">lambda</span> x: x ** <span class="num">2</span>
add = <span class="kw">lambda</span> a, b: a + b

<span class="fn">print</span>(<span class="fn">square</span>(<span class="num">5</span>))   <span class="cm"># 25</span>
<span class="fn">print</span>(<span class="fn">add</span>(<span class="num">3</span>, <span class="num">7</span>))   <span class="cm"># 10</span>

<span class="cm"># مع sort</span>
names = [<span class="str">"محمد"</span>, <span class="str">"علي"</span>, <span class="str">"نورة"</span>]
names.<span class="fn">sort</span>(key=<span class="kw">lambda</span> x: <span class="fn">len</span>(x))</pre>
        </div>
        <div class="lang-card python">
          <div class="lang-header">*args و **kwargs</div>
          <pre><span class="kw">def</span> <span class="fn">total</span>(*args):
    <span class="kw">return</span> <span class="fn">sum</span>(args)

<span class="fn">print</span>(<span class="fn">total</span>(<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>))        <span class="cm"># 6</span>
<span class="fn">print</span>(<span class="fn">total</span>(<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>, <span class="num">40</span>))  <span class="cm"># 100</span>

<span class="kw">def</span> <span class="fn">info</span>(**kwargs):
    <span class="kw">for</span> k, v <span class="kw">in</span> kwargs.<span class="fn">items</span>():
        <span class="fn">print</span>(<span class="str">f"{k}: {v}"</span>)

<span class="fn">info</span>(name=<span class="str">"علي"</span>, age=<span class="num">25</span>)</pre>
          <div class="lang-desc"><code>*args</code> تجمع أي عدد من القيم في tuple. <code>**kwargs</code> تجمع المعاملات المسماة في dict.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الدوال في Python</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">def add(a, b=[]):<br>    b.append(a); return b</span></div>
          <div class="error-note">القائمة الافتراضية مشتركة بين الاستدعاءات</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">def add(a, b=None):<br>    if b is None: b = []<br>    b.append(a); return b</span></div>
          <div class="error-note">لا تستخدم قوائم كقيم افتراضية مباشرةً</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">def greet(name):<br>    message = "مرحباً " + name<br>print(message)</span></div>
          <div class="error-note">message متغير محلي — لا يُرى خارج الدالة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">def greet(name):<br>    return "مرحباً " + name<br>msg = greet("علي")</span></div>
          <div class="error-note">أعِد القيمة بـ return واستخدمها خارج الدالة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الدوال في Python</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">def greet(name):</code><code class="quiz-hint-chip" onclick="insertHint(this)">def add(a, b):</code><code class="quiz-hint-chip" onclick="insertHint(this)">def greet(name: str) -> str:</code><code class="quiz-hint-chip" onclick="insertHint(this)">lambda x: x * 2</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('fn-python', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="fn-js">
      <div class="section-title">الدوال في JavaScript</div>
      <div class="lang-grid">
        <div class="lang-card js">
          <div class="lang-header">Function Declaration</div>
          <pre><span class="kw">function</span> <span class="fn">greet</span>(name) {
    <span class="kw">return</span> <span class="str">`مرحباً ${name}!`</span>;
}
console.<span class="fn">log</span>(<span class="fn">greet</span>(<span class="str">"علي"</span>));</pre>
        </div>
        <div class="lang-card js">
          <div class="lang-header">Arrow Function</div>
          <pre><span class="cm">// Arrow Function</span>
<span class="kw">const</span> add = (a, b) =&gt; a + b;
<span class="kw">const</span> square = x =&gt; x ** <span class="num">2</span>;
<span class="kw">const</span> greet = name =&gt; {
    <span class="kw">const</span> msg = <span class="str">`مرحباً ${name}`</span>;
    <span class="kw">return</span> msg;
};

console.<span class="fn">log</span>(<span class="fn">add</span>(<span class="num">3</span>,<span class="num">4</span>));
console.<span class="fn">log</span>(<span class="fn">square</span>(<span class="num">5</span>));</pre>
          <div class="lang-desc">Arrow Functions أقصر من الدوال العادية وتُستخدم كثيراً مع <code>map</code>، <code>filter</code>، <code>forEach</code>.</div>
        </div>
        <div class="lang-card js">
          <div class="lang-header">Default Parameters + Rest</div>
          <pre><span class="kw">function</span> <span class="fn">greet</span>(name = <span class="str">"زائر"</span>) {
    console.<span class="fn">log</span>(<span class="str">`أهلاً ${name}`</span>);
}
<span class="fn">greet</span>();        <span class="cm">// أهلاً زائر</span>
<span class="fn">greet</span>(<span class="str">"نورة"</span>);  <span class="cm">// أهلاً نورة</span>

<span class="kw">function</span> <span class="fn">total</span>(...nums) {
    <span class="kw">return</span> nums.<span class="fn">reduce</span>((a,b) =&gt; a+b, <span class="num">0</span>);
}
console.<span class="fn">log</span>(<span class="fn">total</span>(<span class="num">1</span>,<span class="num">2</span>,<span class="num">3</span>,<span class="num">4</span>)); <span class="cm">// 10</span></pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الدوال في JavaScript</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">const obj = { name: "علي",<br>  greet: () =&gt; `مرحبا ${this.name}` };</span></div>
          <div class="error-note">Arrow function لا تملك this — undefined</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">greet() { return `مرحبا ${this.name}`; }</span></div>
          <div class="error-note">استخدم function عادية داخل الكائنات</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">function add(a, b) {<br>    return<br>    a + b; }</span></div>
          <div class="error-note">ASI — JS يُضيف ; بعد return — يُعيد undefined</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">return a + b;</span></div>
          <div class="error-note">return والقيمة في نفس السطر دائماً</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الدوال في JavaScript</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">function greet(name)</code><code class="quiz-hint-chip" onclick="insertHint(this)">const add = (a, b) => a + b;</code><code class="quiz-hint-chip" onclick="insertHint(this)">const greet = function(name) { }</code><code class="quiz-hint-chip" onclick="insertHint(this)">const double = n => n * 2;</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('fn-js', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="fn-cpp">
      <div class="section-title">الدوال في ++C</div>
      <div class="lang-grid">
        <div class="lang-card cpp">
          <div class="lang-header">دالة </div>
          <pre><span class="kw">void</span> <span class="fn">greet</span>(string name) {
    cout &lt;&lt; <span class="str">"مرحباً "</span> &lt;&lt; name &lt;&lt; endl;
}

<span class="kw">int</span> <span class="fn">add</span>(<span class="kw">int</span> a, <span class="kw">int</span> b) {
    <span class="kw">return</span> a + b;
}

<span class="fn">greet</span>(<span class="str">"علي"</span>);
cout &lt;&lt; <span class="fn">add</span>(<span class="num">3</span>, <span class="num">4</span>);</pre>
        </div>
        <div class="lang-card cpp">
          <div class="lang-header">Default Parameters + Overloading</div>
          <pre><span class="kw">void</span> <span class="fn">greet</span>(string name, string msg = <span class="str">"مرحباً"</span>) {
    cout &lt;&lt; msg &lt;&lt; <span class="str">" "</span> &lt;&lt; name &lt;&lt; endl;
}

<span class="kw">int</span> <span class="fn">area</span>(<span class="kw">int</span> side) { <span class="kw">return</span> side * side; }
<span class="kw">int</span> <span class="fn">area</span>(<span class="kw">int</span> w, <span class="kw">int</span> h) { <span class="kw">return</span> w * h; }

<span class="fn">greet</span>(<span class="str">"نورة"</span>);
cout &lt;&lt; <span class="fn">area</span>(<span class="num">5</span>) &lt;&lt; endl;
cout &lt;&lt; <span class="fn">area</span>(<span class="num">4</span>, <span class="num">6</span>) &lt;&lt; endl;</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الدوال في ++C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">void process(vector&lt;int&gt; v)</span></div>
          <div class="error-note">يُنسخ الـ vector كاملاً — بطيء</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">void process(const vector&lt;int&gt;&amp; v)</span></div>
          <div class="error-note">مرّر بـ const reference لتجنب النسخ</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">int* makeArray() {<br>    int arr[5]={1,2,3};<br>    return arr; }</span></div>
          <div class="error-note">إعادة مؤشر لمتغير محلي — Undefined Behavior</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">vector&lt;int&gt; makeArray() {<br>    return {1,2,3}; }</span></div>
          <div class="error-note">استخدم vector للمصفوفات المُعادة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الدوال في C++</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">void greet(string name)</code><code class="quiz-hint-chip" onclick="insertHint(this)">int add(int a, int b)</code><code class="quiz-hint-chip" onclick="insertHint(this)">double avg(vector<int>& nums)</code><code class="quiz-hint-chip" onclick="insertHint(this)">auto square = [](int n) { return n*n; };</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('fn-cpp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="fn-csharp">
      <div class="section-title">الدوال في #C</div>
      <div class="lang-grid">
        <div class="lang-card csharp">
          <div class="lang-header">دالة </div>
          <pre><span class="kw">static void</span> <span class="fn">Greet</span>(<span class="kw">string</span> name) {
    Console.<span class="fn">WriteLine</span>(<span class="str">$"مرحباً {name}!"</span>);
}

<span class="kw">static int</span> <span class="fn">Add</span>(<span class="kw">int</span> a, <span class="kw">int</span> b) => a + b;

<span class="fn">Greet</span>(<span class="str">"علي"</span>);
Console.<span class="fn">WriteLine</span>(<span class="fn">Add</span>(<span class="num">3</span>, <span class="num">4</span>));</pre>
          <div class="lang-desc">Expression Body <code>=></code> للدوال ذات السطر الواحد — يُختصر الكود بدون <code>return</code> أو أقواس صريحة.</div>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">Optional + Named Parameters</div>
          <pre><span class="kw">static void</span> <span class="fn">Info</span>(
    <span class="kw">string</span> name,
    <span class="kw">int</span> age = <span class="num">0</span>,
    <span class="kw">string</span> city = <span class="str">"غير محدد"</span>)
{
    Console.<span class="fn">WriteLine</span>(<span class="str">$"{name} | {age} | {city}"</span>);
}

<span class="fn">Info</span>(<span class="str">"علي"</span>);
<span class="fn">Info</span>(<span class="str">"نورة"</span>, age: <span class="num">25</span>, city: <span class="str">"الرياض"</span>);</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الدوال في #C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">void Greet(string name = "علي", int age)</span></div>
          <div class="error-note">معاملات إلزامية لا تأتي بعد الاختيارية</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">void Greet(int age, string name = "علي")</span></div>
          <div class="error-note">المعاملات الاختيارية دائماً في النهاية</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الدوال في C#</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">public void Greet(string name)</code><code class="quiz-hint-chip" onclick="insertHint(this)">public int Add(int a, int b)</code><code class="quiz-hint-chip" onclick="insertHint(this)">private string GetName()</code><code class="quiz-hint-chip" onclick="insertHint(this)">public static double Avg(int[] arr)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('fn-csharp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="fn-kotlin">
      <div class="section-title">الدوال في Kotlin</div>
      <div class="lang-grid">
        <div class="lang-card kotlin">
          <div class="lang-header">fun </div>
          <pre><span class="cm">// دالة </span>
<span class="kw">fun</span> <span class="fn">greet</span>(name: String) {
    <span class="fn">println</span>(<span class="str">"مرحباً $name!"</span>)
}

<span class="cm">// بقيمة مُرجعة</span>
<span class="kw">fun</span> <span class="fn">add</span>(a: Int, b: Int): Int {
    <span class="kw">return</span> a + b
}

<span class="cm">// Single-expression (مختصر)</span>
<span class="kw">fun</span> <span class="fn">square</span>(x: Int) = x * x

<span class="fn">greet</span>(<span class="str">"علي"</span>)
<span class="fn">println</span>(<span class="fn">add</span>(<span class="num">3</span>, <span class="num">4</span>))
<span class="fn">println</span>(<span class="fn">square</span>(<span class="num">5</span>))  <span class="cm">// 25</span></pre>
          <div class="lang-desc">الدالة ذات السطر الواحد تُكتب بـ <code>=</code> بدون <code>return</code> أو أقواس — Kotlin تستنتج القيمة المُعادة تلقائياً.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">قيم افتراضية + Named Args</div>
          <pre><span class="kw">fun</span> <span class="fn">info</span>(
    name: String,
    age: Int = <span class="num">0</span>,
    city: String = <span class="str">"غير محدد"</span>
) {
    <span class="fn">println</span>(<span class="str">"$name | $age | $city"</span>)
}

<span class="fn">info</span>(<span class="str">"علي"</span>)
<span class="fn">info</span>(<span class="str">"نورة"</span>, age = <span class="num">25</span>, city = <span class="str">"الرياض"</span>)
<span class="fn">info</span>(name = <span class="str">"محمد"</span>, city = <span class="str">"جدة"</span>)</pre>
          <div class="lang-desc">Named Arguments تجعل الكود أوضح وتسمح بتغيير ترتيب المعاملات — لا داعي لحفظ الترتيب عند الاستدعاء.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">Lambda و Higher-Order Functions</div>
          <pre><span class="cm">// Lambda</span>
<span class="kw">val</span> double = { x: Int -> x * <span class="num">2</span> }
<span class="kw">val</span> add = { a: Int, b: Int -> a + b }

<span class="fn">println</span>(<span class="fn">double</span>(<span class="num">5</span>))   <span class="cm">// 10</span>
<span class="fn">println</span>(<span class="fn">add</span>(<span class="num">3</span>, <span class="num">4</span>)) <span class="cm">// 7</span>

<span class="cm">// مع المصفوفات</span>
<span class="kw">val</span> nums = listOf(<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>, <span class="num">4</span>, <span class="num">5</span>)
<span class="kw">val</span> evens = nums.<span class="fn">filter</span> { it % <span class="num">2</span> == <span class="num">0</span> }
<span class="kw">val</span> doubled = nums.<span class="fn">map</span> { it * <span class="num">2</span> }
<span class="fn">println</span>(evens)    <span class="cm">// [2, 4]</span>
<span class="fn">println</span>(doubled)  <span class="cm">// [2, 4, 6, 8, 10]</span></pre>
          <div class="lang-desc"><code>it</code> هو الاسم الافتراضي للمعامل الوحيد في Lambda — اختصار يُغني عن كتابة <code>{ x -> x * 2 }</code>.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الدوال في Kotlin</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">fun divide(a: Int, b: Int) = a / b<br>divide(10, 0)</span></div>
          <div class="error-note">ArithmeticException — القسمة على صفر</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">fun divide(a: Int, b: Int): Int? {<br>    if (b == 0) return null<br>    return a / b<br>}</span></div>
          <div class="error-note">أعِد null بدلاً من إيقاف البرنامج</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الدوال في Kotlin</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">fun greet(name: String)</code><code class="quiz-hint-chip" onclick="insertHint(this)">fun add(a: Int, b: Int): Int</code><code class="quiz-hint-chip" onclick="insertHint(this)">fun double(n: Int) = n * 2</code><code class="quiz-hint-chip" onclick="insertHint(this)">val square = { n: Int -> n * n }</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('fn-kotlin', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    
    <!-- PHP FUNCTIONS -->
    <div class="topic-section" id="fn-php">
      <div class="section-title">الدوال في PHP</div>
      <div class="lang-grid">
        <div class="lang-card php">
          <div class="lang-header">دالة أساسية</div>
          <pre><span class="kw">function</span> <span class="fn">greet</span>(<span class="kw">string</span> $name): <span class="kw">void</span> {
    <span class="kw">echo</span> <span class="str">"مرحباً $name!\n"</span>;
}
<span class="fn">greet</span>(<span class="str">"علي"</span>);
<span class="fn">greet</span>(<span class="str">"نورة"</span>);

<span class="cm">// قيمة افتراضية</span>
<span class="kw">function</span> <span class="fn">greetWith</span>(<span class="kw">string</span> $name, <span class="kw">string</span> $g = <span class="str">"مرحباً"</span>): <span class="kw">string</span> {
    <span class="kw">return</span> <span class="str">"$g $name!"</span>;
}
<span class="kw">echo</span> <span class="fn">greetWith</span>(<span class="str">"علي"</span>);
<span class="kw">echo</span> <span class="fn">greetWith</span>(<span class="str">"علي"</span>, <span class="str">"أهلاً"</span>);</pre>
          <div class="lang-desc">Type Hints (PHP 7+) تضمن أن المعاملات من النوع الصحيح. بدونها PHP تقبل أي نوع مما قد يُسبّب أخطاء غير متوقعة.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Arrow Function</div>
          <pre><span class="cm">// Anonymous Function</span>
$square = <span class="kw">function</span>(<span class="kw">int</span> $n): <span class="kw">int</span> {
    <span class="kw">return</span> $n * $n;
};
<span class="kw">echo</span> $square(<span class="num">5</span>); <span class="cm">// 25</span>

<span class="cm">// Arrow Function — PHP 7.4+</span>
$double = <span class="kw">fn</span>($n) =&gt; $n * <span class="num">2</span>;
<span class="kw">echo</span> $double(<span class="num">6</span>); <span class="cm">// 12</span>

<span class="cm">// مع array_map</span>
$nums    = [<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>];
$doubled = <span class="fn">array_map</span>(<span class="kw">fn</span>($n) =&gt; $n * <span class="num">2</span>, $nums);</pre>
          <div class="lang-desc">Arrow Functions تلتقط المتغيرات المحيطة تلقائياً. الدوال المجهولة تحتاج <code>use ($var)</code> صراحةً.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Variadic و Named Arguments</div>
          <pre><span class="cm">// Variadic</span>
<span class="kw">function</span> <span class="fn">sum</span>(<span class="kw">int</span> ...$nums): <span class="kw">int</span> {
    <span class="kw">return</span> <span class="fn">array_sum</span>($nums);
}
<span class="kw">echo</span> <span class="fn">sum</span>(<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>, <span class="num">4</span>); <span class="cm">// 10</span>

<span class="cm">// Named Arguments — PHP 8+</span>
<span class="kw">function</span> <span class="fn">info</span>(<span class="kw">string</span> $name, <span class="kw">int</span> $age): <span class="kw">string</span> {
    <span class="kw">return</span> <span class="str">"$name ($age)"</span>;
}
<span class="kw">echo</span> <span class="fn">info</span>(age: <span class="num">25</span>, name: <span class="str">"نورة"</span>); <span class="cm">// أي ترتيب</span></pre>
          <div class="lang-desc">Named Arguments (PHP 8+) تُتيح تمرير الوسائط بأي ترتيب — مفيدة جداً مع الدوال ذات المعاملات الكثيرة.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — الدوال في PHP</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">$x = 10;<br>function add($a) { return $a + $x; }</span></div>
          <div class="error-note">$x غير موجود داخل الدالة — PHP تعزل النطاق</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">function add($a) use ($x) { return $a + $x; }</span></div>
          <div class="error-note">استخدم use لالتقاط المتغيرات الخارجية</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — الدوال في PHP</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">function greet($name)</code><code class="quiz-hint-chip" onclick="insertHint(this)">function add($a, $b)</code><code class="quiz-hint-chip" onclick="insertHint(this)">function greet(string $name): void</code><code class="quiz-hint-chip" onclick="insertHint(this)">$double = fn($n) => $n * 2;</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('fn-php', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
  </div>
</div>

</asp:Content>
