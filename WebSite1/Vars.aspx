<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Vars.aspx.cs" Inherits="VarsPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — Variables / المتغيرات</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>📋 Variables / المتغيرات</h2>
    <p>كيف تعرّف المتغيرات وأنواع البيانات في كل لغة</p>
  </div>
  <div class="content-wrap">
    <div class="topic-nav">
      <button type="button" class="topic-btn active" onclick="showTopic('vars','java',this)">Java</button>
      <button type="button" class="topic-btn" onclick="showTopic('vars','python',this)">Python</button>
      <button type="button" class="topic-btn" onclick="showTopic('vars','js',this)">JavaScript</button>
      <button type="button" class="topic-btn" onclick="showTopic('vars','cpp',this)">++C</button>
      <button type="button" class="topic-btn" onclick="showTopic('vars','csharp',this)">#C</button>
      <button type="button" class="topic-btn" onclick="showTopic('vars','kotlin',this)">Kotlin</button>
      <button type="button" class="topic-btn" onclick="showTopic('vars','php',this)">PHP</button>
    </div>

    <div class="info-box">
      <strong>المتغير (Variable)</strong> هو اسم يُشير لمكان في الذاكرة يخزّن قيمة. كل لغة لها طريقتها الخاصة في تعريف المتغيرات وأنواعها.
    </div>

    <!-- ═══ JAVA ═══ -->
    <div class="topic-section active" id="vars-java">
      <div class="section-title">المتغيرات في Java</div>
      <div class="lang-grid">
        <div class="lang-card java">
          <div class="lang-header">الأعداد الصحيحة</div>
<pre><span class="kw">byte</span>   b = <span class="num">127</span>;              <span class="cm">// -128 إلى 127</span>
<span class="kw">short</span>  s = <span class="num">32_000</span>;           <span class="cm">// -32768 إلى 32767</span>
<span class="kw">int</span>    i = <span class="num">1_000_000</span>;        <span class="cm">// الأكثر استخداماً</span>
<span class="kw">long</span>   l = <span class="num">9_000_000_000L</span>;  <span class="cm">// L في النهاية إلزامي</span>

<span class="cm">// مثال عملي</span>
<span class="kw">int</span>  age     = <span class="num">25</span>;
<span class="kw">long</span> phone   = <span class="num">0512345678L</span>;
<span class="kw">int</span>  year    = <span class="num">2026</span>;</pre>
          <div class="lang-desc">استخدم <code>int</code> للأرقام العادية. <code>long</code> فقط للأرقام الكبيرة جداً (أكثر من 2 مليار).</div>
        </div>
        <div class="lang-card java">
          <div class="lang-header">الأعداد العشرية</div>
<pre><span class="kw">float</span>  f = <span class="num">3.14f</span>;     <span class="cm">// f في النهاية إلزامي — 4 bytes</span>
<span class="kw">double</span> d = <span class="num">3.14159</span>;  <span class="cm">// الافتراضي — 8 bytes أدق</span>

<span class="cm">// مثال عملي</span>
<span class="kw">double</span> gpa     = <span class="num">3.85</span>;
<span class="kw">double</span> price   = <span class="num">99.99</span>;
<span class="kw">float</span>  weight  = <span class="num">70.5f</span>;</pre>
          <div class="lang-desc">دائماً استخدم <code>double</code> للأعداد العشرية. <code>float</code> أقل دقة ويحتاج حرف <code>f</code> في النهاية.</div>
        </div>
        <div class="lang-card java">
          <div class="lang-header">النصوص والمنطق</div>
<pre><span class="kw">char</span>    c = <span class="str">'A'</span>;          <span class="cm">// حرف واحد فقط — أقواس مفردة</span>
<span class="kw">String</span>  s = <span class="str">"مرحباً"</span>;    <span class="cm">// نص — أقواس مزدوجة</span>
<span class="kw">boolean</span> b = <span class="kw">true</span>;         <span class="cm">// true أو false فقط</span>

<span class="cm">// مثال عملي</span>
<span class="kw">String</span>  name    = <span class="str">"نورة"</span>;
<span class="kw">char</span>    grade   = <span class="str">'A'</span>;
<span class="kw">boolean</span> isPass  = <span class="kw">true</span>;
<span class="kw">boolean</span> isEmpty = <span class="kw">false</span>;</pre>
          <div class="lang-desc">الفرق المهم: <code>char</code> حرف واحد بأقواس مفردة <code>'A'</code>، و<code>String</code> نص بأقواس مزدوجة <code>"علي"</code>.</div>
        </div>
        <div class="lang-card java">
          <div class="lang-header">var و final</div>
<pre><span class="cm">// var — Java تستنتج النوع تلقائياً (Java 10+)</span>
<span class="kw">var</span> name  = <span class="str">"علي"</span>;    <span class="cm">// String</span>
<span class="kw">var</span> age   = <span class="num">25</span>;       <span class="cm">// int</span>
<span class="kw">var</span> gpa   = <span class="num">3.85</span>;    <span class="cm">// double</span>
<span class="kw">var</span> pass  = <span class="kw">true</span>;    <span class="cm">// boolean</span>

<span class="cm">// final — ثابت لا يتغير أبداً</span>
<span class="kw">final int</span>    MAX_SCORE = <span class="num">100</span>;
<span class="kw">final String</span> LANG      = <span class="str">"Java"</span>;
<span class="cm">// MAX_SCORE = 50; ← خطأ في الترجمة!</span></pre>
          <div class="lang-desc"><code>var</code> يُغنيك عن كتابة النوع يدوياً. <code>final</code> للثوابت التي لن تتغير — محاولة تغييرها تُوقف البرنامج.</div>
        </div>
      </div>
        
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المتغيرات في Java</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">int gpa = 3.85;</span></div>
          <div class="error-note">int لا يقبل العشريات — يُقطع إلى 3</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">double gpa = 3.85;</span></div>
          <div class="error-note">double للأعداد العشرية دائماً</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">long big = 9000000000;</span></div>
          <div class="error-note">الرقم يتجاوز int ولا يوجد L — خطأ</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">long big = 9000000000L;</span></div>
          <div class="error-note">أضف L في النهاية للأرقام الكبيرة</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">char name = "علي";</span></div>
          <div class="error-note">char لحرف واحد فقط</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">String name = "علي";</span></div>
          <div class="error-note">String للنصوص، char للحرف الواحد</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">float pi = 3.14;</span></div>
          <div class="error-note">3.14 بدون f تُعامَل كـ double — تحذير</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">float pi = 3.14f;</span></div>
          <div class="error-note">أضف f أو استخدم double</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — تعريف المتغيرات في Java</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">int age = 25;</code><code class="quiz-hint-chip" onclick="insertHint(this)">String name = "علي";</code><code class="quiz-hint-chip" onclick="insertHint(this)">double gpa = 3.85;</code><code class="quiz-hint-chip" onclick="insertHint(this)">final int MAX = 100;</code><code class="quiz-hint-chip" onclick="insertHint(this)">var score = 90;</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('vars-java', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
        
      
        
        
      
        
        
      
        
        
      

    
    

    <!-- ═══ PYTHON ═══ -->
    <div class="topic-section" id="vars-python">
      <div class="section-title">المتغيرات في Python</div>
      <div class="lang-grid">
        <div class="lang-card python">
          <div class="lang-header">الأعداد</div>
<pre><span class="cm"># int — أعداد صحيحة (بلا حد)</span>
age     = <span class="num">25</span>
year    = <span class="num">2026</span>
big     = <span class="num">999_999_999_999</span>   <span class="cm"># _ للقراءة</span>
negative = <span class="num">-50</span>

<span class="cm"># float — أعداد عشرية</span>
gpa     = <span class="num">3.85</span>
price   = <span class="num">99.99</span>
pi      = <span class="num">3.14159</span>

<span class="cm"># complex — أعداد مركبة</span>
c = <span class="num">3</span> + <span class="num">4j</span></pre>
          <div class="lang-desc">Python لا تحتاج تحديد نوع المتغير — تعرفه تلقائياً. ولا حد لحجم الرقم الصحيح مهما كبر.</div>
        </div>
        <div class="lang-card python">
          <div class="lang-header">النصوص والمنطق</div>
<pre><span class="cm"># str — نصوص</span>
name    = <span class="str">"نورة"</span>
city    = <span class="str">'الرياض'</span>        <span class="cm"># أقواس مفردة أو مزدوجة</span>
multi   = <span class="str">"""
سطر أول
سطر ثاني
"""</span>                        <span class="cm"># نص متعدد الأسطر</span>

<span class="cm"># bool — منطق</span>
is_pass  = <span class="kw">True</span>            <span class="cm"># T كبيرة</span>
is_empty = <span class="kw">False</span>           <span class="cm"># F كبيرة</span>

<span class="cm"># None — لا قيمة</span>
result = <span class="kw">None</span></pre>
          <div class="lang-desc">تذكّر: <code>True</code> و<code>False</code> بحرف كبير. <code>None</code> تعني "لا توجد قيمة" مثل null في اللغات الأخرى.</div>
        </div>
        <div class="lang-card python">
          <div class="lang-header">Type Hints و الثوابت</div>
<pre><span class="cm"># Type Hints — اختيارية لكن تُحسّن الكود</span>
name:    <span class="fn">str</span>   = <span class="str">"علي"</span>
age:     <span class="fn">int</span>   = <span class="num">25</span>
gpa:     <span class="fn">float</span> = <span class="num">3.85</span>
is_pass: <span class="fn">bool</span>  = <span class="kw">True</span>

<span class="cm"># الثوابت — اتفاقية الأحرف الكبيرة</span>
MAX_SCORE  = <span class="num">100</span>
PI         = <span class="num">3.14159</span>
APP_NAME   = <span class="str">"كودلوجستك"</span>

<span class="cm"># تعيين متعدد</span>
x, y, z = <span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>
a = b = c = <span class="num">0</span></pre>
          <div class="lang-desc">Python لا تملك ثوابت حقيقية. الاتفاقية هي كتابة الاسم بأحرف كبيرة <code>MAX = 100</code> كإشارة "لا تغيّره".</div>
        </div>
        <div class="lang-card python">
          <div class="lang-header">معرفة النوع وتحويله</div>
<pre><span class="cm"># معرفة النوع</span>
<span class="fn">print</span>(<span class="fn">type</span>(<span class="num">42</span>))        <span class="cm"># &lt;class 'int'&gt;</span>
<span class="fn">print</span>(<span class="fn">type</span>(<span class="str">"نص"</span>))     <span class="cm"># &lt;class 'str'&gt;</span>
<span class="fn">print</span>(<span class="fn">type</span>(<span class="num">3.14</span>))      <span class="cm"># &lt;class 'float'&gt;</span>

<span class="cm"># تحويل الأنواع</span>
<span class="fn">int</span>(<span class="str">"42"</span>)              <span class="cm"># "42" → 42</span>
<span class="fn">float</span>(<span class="num">10</span>)              <span class="cm"># 10 → 10.0</span>
<span class="fn">str</span>(<span class="num">3.14</span>)              <span class="cm"># 3.14 → "3.14"</span>
<span class="fn">bool</span>(<span class="num">0</span>)                <span class="cm"># 0 → False</span>
<span class="fn">bool</span>(<span class="str">""</span>)               <span class="cm"># "" → False</span></pre>
          <div class="lang-desc">Python لا تُحوّل الأنواع تلقائياً — يجب الطلب صراحةً. مثال: <code>int("42")</code> يُحوّل النص "42" إلى رقم 42.</div>
        </div>
        </div>
        
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المتغيرات في Python</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">is_pass = true</span></div>
          <div class="error-note">Python: True بحرف T كبير دائماً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">is_pass = True</span></div>
          <div class="error-note">T وF كبيرة في Python</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">int("abc")</span></div>
          <div class="error-note">ValueError — "abc" ليس رقماً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if text.isdigit(): n = int(text)</span></div>
          <div class="error-note">تحقق قبل التحويل</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">name: str<br>print(name)</span></div>
          <div class="error-note">Type Hint بدون قيمة — المتغير غير معرّف</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">name: str = "علي"</span></div>
          <div class="error-note">Type Hint لا يُعيّن قيمة تلقائياً</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — تعريف المتغيرات في Python</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">age = 25</code><code class="quiz-hint-chip" onclick="insertHint(this)">name = "علي"</code><code class="quiz-hint-chip" onclick="insertHint(this)">name: str = "علي"</code><code class="quiz-hint-chip" onclick="insertHint(this)">MAX_SCORE = 100</code><code class="quiz-hint-chip" onclick="insertHint(this)">is_pass = True</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('vars-python', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
        
        
      
        
        
      
    
    

    <!-- ═══ JAVASCRIPT ═══ -->
    <div class="topic-section" id="vars-js">
      <div class="section-title">المتغيرات في JavaScript</div>
      <div class="lang-grid">
        <div class="lang-card js">
          <div class="lang-header">let و const و var</div>
<pre><span class="cm">// let — متغير قابل للتغيير ✅</span>
<span class="kw">let</span> name  = <span class="str">"علي"</span>;
<span class="kw">let</span> age   = <span class="num">25</span>;
name = <span class="str">"نورة"</span>;           <span class="cm">// مسموح</span>

<span class="cm">// const — ثابت لا يُعاد تعيينه ✅</span>
<span class="kw">const</span> PI      = <span class="num">3.14159</span>;
<span class="kw">const</span> MAX     = <span class="num">100</span>;
<span class="kw">const</span> APP     = <span class="str">"كودلوجستك"</span>;
<span class="cm">// PI = 3; ← خطأ!</span>

<span class="cm">// var — قديم، تجنّبه تماماً ❌</span>
<span class="kw">var</span> old = <span class="str">"لا تستخدمني"</span>;</pre>
          <div class="lang-desc">القاعدة الذهبية: استخدم <code>const</code> دائماً. <code>let</code> فقط إذا ستغيّر القيمة لاحقاً. <code>var</code> قديم تجنّبه تماماً.</div>
        </div>
        <div class="lang-card js">
          <div class="lang-header">أنواع البيانات</div>
<pre><span class="cm">// Number — رقم واحد للكل</span>
<span class="kw">let</span> age   = <span class="num">25</span>;           <span class="cm">// صحيح</span>
<span class="kw">let</span> gpa   = <span class="num">3.85</span>;         <span class="cm">// عشري</span>
<span class="kw">let</span> big   = <span class="num">9_007_199_254_740_991n</span>; <span class="cm">// BigInt</span>

<span class="cm">// String — نصوص</span>
<span class="kw">let</span> name  = <span class="str">"نورة"</span>;
<span class="kw">let</span> city  = <span class="str">'الرياض'</span>;
<span class="kw">let</span> msg   = <span class="str">`مرحباً ${name}`</span>; <span class="cm">// Template</span>

<span class="cm">// Boolean</span>
<span class="kw">let</span> isPass = <span class="kw">true</span>;
<span class="kw">let</span> isDone = <span class="kw">false</span>;

<span class="cm">// قيم خاصة</span>
<span class="kw">let</span> empty = <span class="kw">null</span>;
<span class="kw">let</span> undef;                  <span class="cm">// undefined</span></pre>
          <div class="lang-desc">JavaScript تملك نوعاً واحداً للأرقام <code>number</code> — يغطي الأعداد الصحيحة والعشرية معاً.</div>
        </div>
        <div class="lang-card js">
          <div class="lang-header">typeof وتحويل الأنواع</div>
<pre><span class="cm">// معرفة النوع</span>
<span class="kw">typeof</span> <span class="num">42</span>          <span class="cm">// "number"</span>
<span class="kw">typeof</span> <span class="str">"نص"</span>       <span class="cm">// "string"</span>
<span class="kw">typeof</span> <span class="kw">true</span>        <span class="cm">// "boolean"</span>
<span class="kw">typeof</span> <span class="kw">undefined</span>   <span class="cm">// "undefined"</span>
<span class="kw">typeof</span> <span class="kw">null</span>        <span class="cm">// "object" ← خطأ تاريخي!</span>

<span class="cm">// تحويل الأنواع</span>
<span class="fn">Number</span>(<span class="str">"42"</span>)       <span class="cm">// 42</span>
<span class="fn">String</span>(<span class="num">3.14</span>)       <span class="cm">// "3.14"</span>
<span class="fn">Boolean</span>(<span class="num">0</span>)         <span class="cm">// false</span>
<span class="fn">Boolean</span>(<span class="str">""</span>)        <span class="cm">// false</span>
<span class="fn">parseInt</span>(<span class="str">"42px"</span>)   <span class="cm">// 42</span></pre>
          <div class="lang-desc">تحذير: <code>typeof null</code> يُعيد "object" وهو خطأ قديم في اللغة. للتحقق من null استخدم <code>=== null</code> مباشرة.</div>
        </div>
        </div>
        
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المتغيرات في JavaScript</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">var name = "علي";</span></div>
          <div class="error-note">var قديم ويُسبّب مشاكل في النطاق</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">const name = "علي";</span></div>
          <div class="error-note">const للثوابت، let للمتغيرات</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">typeof null === "null" // false!</span></div>
          <div class="error-note">typeof null يُعيد "object" — خطأ تاريخي في JS</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">value === null</span></div>
          <div class="error-note">تحقق من null بالمقارنة المباشرة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — تعريف المتغيرات في JavaScript</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">let age = 25;</code><code class="quiz-hint-chip" onclick="insertHint(this)">const PI = 3.14;</code><code class="quiz-hint-chip" onclick="insertHint(this)">const name = "علي";</code><code class="quiz-hint-chip" onclick="insertHint(this)">let score = 90;</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('vars-js', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
        
        
      
        
        
      
    
    

    <!-- ═══ ++C ═══ -->
    <div class="topic-section" id="vars-cpp">
      <div class="section-title">المتغيرات في ++C</div>
      <div class="lang-grid">
        <div class="lang-card cpp">
          <div class="lang-header">الأعداد الصحيحة</div>
<pre><span class="kw">short</span>     s  = <span class="num">32000</span>;           <span class="cm">// 2 bytes</span>
<span class="kw">int</span>       i  = <span class="num">1000000</span>;         <span class="cm">// 4 bytes — الأكثر استخداماً</span>
<span class="kw">long</span>      l  = <span class="num">2147483647</span>;      <span class="cm">// 4 أو 8 bytes</span>
<span class="kw">long long</span> ll = <span class="num">9000000000LL</span>;   <span class="cm">// 8 bytes — LL في النهاية</span>

<span class="cm">// unsigned — أرقام موجبة فقط (ضعف المدى)</span>
<span class="kw">unsigned int</span> u = <span class="num">4294967295</span>;

<span class="cm">// مثال عملي</span>
<span class="kw">int</span>  age   = <span class="num">25</span>;
<span class="kw">int</span>  score = <span class="num">98</span>;</pre>
          <div class="lang-desc">++C تُعطيك تحكماً كاملاً بحجم المتغير في الذاكرة. <code>int</code> عادةً 4 bytes، و<code>long long</code> ضعفه.</div>
        </div>
        <div class="lang-card cpp">
          <div class="lang-header">الأعداد العشرية والنصوص</div>
<pre><span class="cm">// Floating Point</span>
<span class="kw">float</span>       f = <span class="num">3.14f</span>;     <span class="cm">// 4 bytes — f إلزامي</span>
<span class="kw">double</span>      d = <span class="num">3.14159</span>;  <span class="cm">// 8 bytes — الأفضل</span>
<span class="kw">long double</span> ld = <span class="num">3.14159L</span>; <span class="cm">// 16 bytes — دقة عالية جداً</span>

<span class="cm">// Text</span>
<span class="kw">char</span>        c = <span class="str">'A'</span>;               <span class="cm">// حرف واحد</span>
std::string s = <span class="str">"مرحباً"</span>;          <span class="cm">// نص</span>

<span class="cm">// Boolean</span>
<span class="kw">bool</span> b = <span class="kw">true</span>;</pre>
          <div class="lang-desc">دائماً استخدم <code>double</code> للأعداد العشرية — أدق من <code>float</code>. <code>float</code> يحتاج حرف <code>f</code> في النهاية.</div>
        </div>
        <div class="lang-card cpp">
          <div class="lang-header">auto و const و constexpr</div>
<pre><span class="cm">// auto — استنتاج النوع (++C11)</span>
<span class="kw">auto</span> name  = std::string(<span class="str">"علي"</span>); <span class="cm">// string</span>
<span class="kw">auto</span> age   = <span class="num">25</span>;                  <span class="cm">// int</span>
<span class="kw">auto</span> gpa   = <span class="num">3.85</span>;               <span class="cm">// double</span>

<span class="cm">// const — ثابت وقت التشغيل</span>
<span class="kw">const int</span>    MAX = <span class="num">100</span>;
<span class="kw">const double</span> PI  = <span class="num">3.14159</span>;

<span class="cm">// constexpr — ثابت وقت الترجمة (أسرع)</span>
<span class="kw">constexpr int</span>    DAYS  = <span class="num">365</span>;
<span class="kw">constexpr double</span> EULER = <span class="num">2.71828</span>;</pre>
          <div class="lang-desc"><code>constexpr</code> يعني "احسب هذا وقت الترجمة" — يُسرّع البرنامج. <code>const</code> يمنع التغيير لكن قيمته تُحدَّد وقت التشغيل.</div>
        </div>
        </div>
        
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المتغيرات في ++C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">int x;<br>cout &lt;&lt; x;</span></div>
          <div class="error-note">متغير بدون تهيئة — قيمته عشوائية من الذاكرة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">int x = 0;<br>cout &lt;&lt; x;</span></div>
          <div class="error-note">هيّئ المتغير دائماً عند التعريف</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">float pi = 3.14;</span></div>
          <div class="error-note">3.14 بدون f يُعاملها المترجم كـ double — تحذير</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">float pi = 3.14f;</span></div>
          <div class="error-note">أضف f أو استخدم double بدون f</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">long big = 9000000000;</span></div>
          <div class="error-note">overflow — يتجاوز حد int</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">long long big = 9000000000LL;</span></div>
          <div class="error-note">أضف LL في النهاية</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — تعريف المتغيرات في C++</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">int age = 25;</code><code class="quiz-hint-chip" onclick="insertHint(this)">double gpa = 3.85;</code><code class="quiz-hint-chip" onclick="insertHint(this)">string name = "علي";</code><code class="quiz-hint-chip" onclick="insertHint(this)">auto x = 5;</code><code class="quiz-hint-chip" onclick="insertHint(this)">constexpr int MAX = 100;</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('vars-cpp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
        
        
      
        
        
      
    
    

    <!-- ═══ #C ═══ -->
    <div class="topic-section" id="vars-csharp">
      <div class="section-title">المتغيرات في #C</div>
      <div class="lang-grid">
        <div class="lang-card csharp">
          <div class="lang-header">الأعداد الصحيحة</div>
<pre><span class="kw">sbyte</span>  sb = <span class="num">127</span>;              <span class="cm">// -128 إلى 127</span>
<span class="kw">short</span>  s  = <span class="num">32_000</span>;           <span class="cm">// -32768 إلى 32767</span>
<span class="kw">int</span>    i  = <span class="num">1_000_000</span>;        <span class="cm">// الأكثر استخداماً</span>
<span class="kw">long</span>   l  = <span class="num">9_000_000_000L</span>;  <span class="cm">// L في النهاية</span>

<span class="cm">// unsigned</span>
<span class="kw">uint</span>   u  = <span class="num">4_000_000_000U</span>;  <span class="cm">// موجب فقط</span>
<span class="kw">ulong</span>  ul = <span class="num">18_000_000_000UL</span>;

<span class="cm">// مثال عملي</span>
<span class="kw">int</span>  age   = <span class="num">25</span>;
<span class="kw">int</span>  score = <span class="num">98</span>;</pre>
          <div class="lang-desc">#C تملك أنواعاً متعددة للأرقام. <code>int</code> هو الافتراضي الذي يناسب معظم الحالات.</div>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">الأعداد العشرية والنصوص</div>
<pre><span class="cm">// Floating Point</span>
<span class="kw">float</span>   f = <span class="num">3.14f</span>;    <span class="cm">// f إلزامي — 4 bytes</span>
<span class="kw">double</span>  d = <span class="num">3.14159</span>; <span class="cm">// الافتراضي — 8 bytes</span>
<span class="kw">decimal</span> m = <span class="num">99.99m</span>;  <span class="cm">// m إلزامي — للأموال</span>

<span class="cm">// Text</span>
<span class="kw">char</span>   c = <span class="str">'A'</span>;            <span class="cm">// حرف واحد</span>
<span class="kw">string</span> s = <span class="str">"مرحباً"</span>;       <span class="cm">// نص</span>

<span class="cm">// Boolean</span>
<span class="kw">bool</span> b = <span class="kw">true</span>;

<span class="cm">// object — يقبل أي نوع</span>
<span class="kw">object</span> o = <span class="num">42</span>;</pre>
          <div class="lang-desc">استخدم <code>decimal</code> للأموال والحسابات المالية الدقيقة — أدق من <code>double</code>. لا تنسَ حرف <code>m</code> في نهاية القيمة.</div>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">var و const و Nullable</div>
<pre><span class="cm">// var — استنتاج النوع</span>
<span class="kw">var</span> name  = <span class="str">"علي"</span>;    <span class="cm">// string</span>
<span class="kw">var</span> age   = <span class="num">25</span>;      <span class="cm">// int</span>
<span class="kw">var</span> gpa   = <span class="num">3.85</span>;   <span class="cm">// double</span>

<span class="cm">// const — ثابت وقت الترجمة</span>
<span class="kw">const int</span>    MAX  = <span class="num">100</span>;
<span class="kw">const string</span> LANG = <span class="str">"#C"</span>;

<span class="cm">// Nullable — يقبل null بإضافة ?</span>
<span class="kw">int</span>?    nullInt  = <span class="kw">null</span>;
<span class="kw">string</span>? nullStr  = <span class="kw">null</span>;
<span class="kw">double</span>? nullDbl  = <span class="kw">null</span>;</pre>
          <div class="lang-desc">الـ <code>?</code> تجعل المتغير يقبل <code>null</code>. بدونها #C يرفض <code>null</code> ويُوقف البرنامج.</div>
        </div>
        </div>
        
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المتغيرات في #C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">decimal price = 9.99;</span></div>
          <div class="error-note">القيمة بدون m تُعامَل كـ double</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">decimal price = 9.99m;</span></div>
          <div class="error-note">أضف m في النهاية لقيم decimal</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">string s = null;<br>int len = s.Length;</span></div>
          <div class="error-note">NullReferenceException — s قيمتها null</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (!string.IsNullOrEmpty(s))</span></div>
          <div class="error-note">IsNullOrEmpty للتحقق الآمن</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">int.Parse("abc");</span></div>
          <div class="error-note">FormatException — "abc" ليس رقماً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">int.TryParse("abc", out int n);</span></div>
          <div class="error-note">TryParse آمن — لا يُوقف البرنامج</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — تعريف المتغيرات في C#</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">int age = 25;</code><code class="quiz-hint-chip" onclick="insertHint(this)">string name = "علي";</code><code class="quiz-hint-chip" onclick="insertHint(this)">var score = 90;</code><code class="quiz-hint-chip" onclick="insertHint(this)">const int MAX = 100;</code><code class="quiz-hint-chip" onclick="insertHint(this)">decimal price = 9.99m;</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('vars-csharp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
        
        
      
        
        
      
    
    

    <!-- ═══ KOTLIN ═══ -->
    <div class="topic-section" id="vars-kotlin">
      <div class="section-title">المتغيرات في Kotlin</div>
      <div class="lang-grid">
        <div class="lang-card kotlin">
          <div class="lang-header">val و var</div>
<pre><span class="cm">// val — ثابت لا يتغير (immutable) ✅ الأفضل</span>
<span class="kw">val</span> name  = <span class="str">"علي"</span>     <span class="cm">// String (مستنتج)</span>
<span class="kw">val</span> age   = <span class="num">25</span>        <span class="cm">// Int</span>
<span class="kw">val</span> gpa   = <span class="num">3.85</span>     <span class="cm">// Double</span>
<span class="kw">val</span> pass  = <span class="kw">true</span>     <span class="cm">// Boolean</span>
<span class="cm">// name = "نورة" ← خطأ! val لا يتغير</span>

<span class="cm">// var — متغير قابل للتغيير</span>
<span class="kw">var</span> score = <span class="num">90</span>
score = <span class="num">95</span>            <span class="cm">// مسموح</span>
<span class="kw">var</span> city  = <span class="str">"الرياض"</span>
city  = <span class="str">"جدة"</span>         <span class="cm">// مسموح</span></pre>
          <div class="lang-desc">فكّر بـ<code>val</code> كـ"مكتوب بالحجر" — لا يتغير. <code>var</code> "مكتوب بالرمل" — يتغير. ابدأ بـ<code>val</code> دائماً.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">أنواع البيانات</div>
<pre><span class="cm">// تحديد النوع صراحةً</span>
<span class="kw">val</span> b:  <span class="fn">Byte</span>    = <span class="num">127</span>
<span class="kw">val</span> s:  <span class="fn">Short</span>   = <span class="num">32000</span>
<span class="kw">val</span> i:  <span class="fn">Int</span>     = <span class="num">1_000_000</span>
<span class="kw">val</span> l:  <span class="fn">Long</span>    = <span class="num">9_000_000_000L</span>
<span class="kw">val</span> f:  <span class="fn">Float</span>   = <span class="num">3.14f</span>
<span class="kw">val</span> d:  <span class="fn">Double</span>  = <span class="num">3.14159</span>
<span class="kw">val</span> c:  <span class="fn">Char</span>    = <span class="str">'A'</span>
<span class="kw">val</span> st: <span class="fn">String</span>  = <span class="str">"مرحباً"</span>
<span class="kw">val</span> bl: <span class="fn">Boolean</span> = <span class="kw">true</span></pre>
          <div class="lang-desc">في Kotlin كل الأنواع تبدأ بحرف كبير: <code>Int</code>، <code>String</code>، <code>Boolean</code> — لأنها كلاسات وليست أنواعاً بدائية.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">Nullable وconst</div>
<pre><span class="cm">// Nullable — أضف ? للسماح بـ null</span>
<span class="kw">val</span> name:  <span class="fn">String</span>  = <span class="str">"علي"</span>  <span class="cm">// لا يقبل null</span>
<span class="kw">var</span> email: <span class="fn">String</span>? = <span class="kw">null</span>  <span class="cm">// يقبل null</span>

<span class="cm">// Safe Call — لا NullPointerException</span>
<span class="fn">println</span>(email?.<span class="fn">length</span>)       <span class="cm">// null بدل crash</span>

<span class="cm">// Elvis Operator — قيمة افتراضية</span>
<span class="kw">val</span> len = email?.<span class="fn">length</span> ?: <span class="num">0</span>

<span class="cm">// const — ثابت وقت الترجمة</span>
<span class="kw">const val</span> MAX_SCORE = <span class="num">100</span>
<span class="kw">const val</span> APP_NAME  = <span class="str">"كودلوجستك"</span></pre>
          <div class="lang-desc"><code>?</code> بعد النوع يعني "قد يكون null". بدونها Kotlin يضمن أن المتغير لن يكون null أبداً — يُلغي أشهر خطأ في Java.</div>
        </div>
        </div>
        
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المتغيرات في Kotlin</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">var name: String = null</span></div>
          <div class="error-note">String لا يقبل null — خطأ في الترجمة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">var name: String? = null</span></div>
          <div class="error-note">أضف ? لجعل المتغير يقبل null</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">val x: Int = 3.14</span></div>
          <div class="error-note">لا تحويل ضمني — Double لا يُسند لـ Int</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">val x: Int = 3.14.toInt()</span></div>
          <div class="error-note">Kotlin تطلب التحويل صراحةً</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">val name = "علي"<br>name = "نورة"</span></div>
          <div class="error-note">val ثابت — لا يمكن إعادة تعيينه</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">var name = "علي"<br>name = "نورة"</span></div>
          <div class="error-note">استخدم var إذا ستُغيّر القيمة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — تعريف المتغيرات في Kotlin</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">val age = 25</code><code class="quiz-hint-chip" onclick="insertHint(this)">var name = "علي"</code><code class="quiz-hint-chip" onclick="insertHint(this)">val gpa: Double = 3.85</code><code class="quiz-hint-chip" onclick="insertHint(this)">const val MAX = 100</code><code class="quiz-hint-chip" onclick="insertHint(this)">var city: String? = null</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('vars-kotlin', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
        
        
      
        
        
      
    
    

    <!-- ═══ PHP ═══ -->
    <div class="topic-section" id="vars-php">
      <div class="section-title">المتغيرات في PHP</div>
      <div class="lang-grid">
        <div class="lang-card php">
          <div class="lang-header">تعريف المتغيرات</div>
<pre><span class="cm">// كل متغير يبدأ بـ $ إلزامياً</span>
$name    = <span class="str">"علي"</span>;      <span class="cm">// string</span>
$age     = <span class="num">25</span>;         <span class="cm">// int</span>
$gpa     = <span class="num">3.85</span>;       <span class="cm">// float</span>
$isPass  = <span class="kw">true</span>;       <span class="cm">// bool</span>
$nothing = <span class="kw">null</span>;       <span class="cm">// null</span>

<span class="cm">// PHP Dynamic — النوع يتغير تلقائياً</span>
$x = <span class="num">42</span>;               <span class="cm">// int</span>
$x = <span class="str">"نص"</span>;             <span class="cm">// الآن string — مسموح</span>
$x = <span class="kw">true</span>;             <span class="cm">// الآن bool — مسموح</span></pre>
          <div class="lang-desc">كل متغير في PHP يبدأ بـ<code>$</code> إلزامياً. النوع يتحدد تلقائياً ويمكن تغييره في أي وقت.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">الأنواع المدعومة</div>
<pre><span class="cm">// Integer</span>
$age   = <span class="num">25</span>;
$year  = <span class="num">2026</span>;
$neg   = <span class="num">-50</span>;

<span class="cm">// Float</span>
$gpa   = <span class="num">3.85</span>;
$price = <span class="num">99.99</span>;

<span class="cm">// String</span>
$name  = <span class="str">"نورة"</span>;
$city  = <span class="str">'الرياض'</span>;     <span class="cm">// مفردة أو مزدوجة</span>
$msg   = <span class="str">"مرحباً $name"</span>; <span class="cm">// "" تُفسّر المتغيرات</span>

<span class="cm">// Boolean</span>
$t = <span class="kw">true</span>;   $f = <span class="kw">false</span>;

<span class="cm">// Null</span>
$empty = <span class="kw">null</span>;</pre>
          <div class="lang-desc">الفرق المهم: الأقواس المزدوجة <code>""</code> تُفسّر المتغيرات داخلها، المفردة <code>''</code> تعاملها كنص حرفي.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">const و define و Type Hints</div>
<pre><span class="cm">// const — في مستوى الكلاس أو الملف</span>
<span class="kw">const</span> MAX_SCORE = <span class="num">100</span>;
<span class="kw">const</span> APP_NAME  = <span class="str">"كودلوجستك"</span>;

<span class="cm">// define — في أي مكان حتى داخل الدوال</span>
<span class="fn">define</span>(<span class="str">'PI'</span>, <span class="num">3.14159</span>);
<span class="fn">echo</span> PI; <span class="cm">// 3.14159</span>

<span class="cm">// Type Hints — PHP 7+ (اختيارية)</span>
<span class="kw">function</span> <span class="fn">setAge</span>(<span class="kw">int</span> $age): <span class="kw">void</span> {
    <span class="cm">// $age مضمون int</span>
}

<span class="cm">// معرفة النوع</span>
<span class="fn">gettype</span>($age);   <span class="cm">// "integer"</span>
<span class="fn">is_int</span>($age);    <span class="cm">// true</span>
<span class="fn">is_string</span>($name); <span class="cm">// true</span></pre>
          <div class="lang-desc">الفرق: <code>const</code> يُحدَّد وقت الترجمة ولا يعمل داخل الدوال. <code>define()</code> يعمل في أي مكان حتى داخل الدوال.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المتغيرات في PHP</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">name = "علي";</span></div>
          <div class="error-note">نسيان $ — PHP لن تعرف أنه متغير</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">$name = "علي";</span></div>
          <div class="error-note">كل متغير يبدأ بـ $ إلزامياً</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">echo 'مرحباً $name';</span></div>
          <div class="error-note">المفردة لا تُفسّر المتغيرات</div>
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
          <div class="error-code"><span class="bad">if ($x = 5) { ... }</span></div>
          <div class="error-note">= تعيين وليس مقارنة — الشرط دائماً true</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if ($x === 5) { ... }</span></div>
          <div class="error-note">=== للمقارنة الصارمة دائماً في PHP</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — تعريف المتغيرات في PHP</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">$age = 25;</code><code class="quiz-hint-chip" onclick="insertHint(this)">$name = "علي";</code><code class="quiz-hint-chip" onclick="insertHint(this)">$gpa = 3.85;</code><code class="quiz-hint-chip" onclick="insertHint(this)">const MAX = 100;</code><code class="quiz-hint-chip" onclick="insertHint(this)">define("PI", 3.14);</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('vars-php', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>

  </div>
</asp:Content>
