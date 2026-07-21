<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Arrays.aspx.cs" Inherits="ArraysPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — Arrays / المصفوفات</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>📦 Arrays / المصفوفات</h2>
    <p>تخزين البيانات وإدارتها بكفاءة</p>
  </div>
  <div class="content-wrap">
    <div class="topic-nav">
      <button type="button" class="topic-btn active" onclick="showTopic('arr','java',this)">Java</button>
      <button type="button" class="topic-btn" onclick="showTopic('arr','python',this)">Python</button>
      <button type="button" class="topic-btn" onclick="showTopic('arr','js',this)">JavaScript</button>
      <button type="button" class="topic-btn" onclick="showTopic('arr','cpp',this)">++C</button>
      <button type="button" class="topic-btn" onclick="showTopic('arr','csharp',this)">#C</button>
      <button type="button" class="topic-btn" onclick="showTopic('arr','kotlin',this)">Kotlin</button>
      <button type="button" class="topic-btn" onclick="showTopic('arr','php',this)">PHP</button>
    </div>

    <div class="info-box">
      <strong>المصفوفات (Arrays)</strong> تُخزّن مجموعة من القيم من نفس النوع في متغير واحد.
      الفهرس يبدأ من <code>0</code> في جميع اللغات تقريباً. عناصر المصفوفة تُخزّن بشكل متتالي في الذاكرة.
    </div>

    <div class="topic-section active" id="arr-java">
      <div class="section-title">المصفوفات في Java</div>
      <div class="lang-grid">
        <div class="lang-card java">
          <div class="lang-header">إنشاء واستخدام</div>
          <pre><span class="cm">// إنشاء مصفوفة</span>
<span class="kw">int</span>[] nums = {<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>, <span class="num">40</span>};
String[] names = <span class="kw">new</span> String[<span class="num">3</span>];
names[<span class="num">0</span>] = <span class="str">"علي"</span>;
names[<span class="num">1</span>] = <span class="str">"نورة"</span>;

<span class="cm">// الوصول والطول</span>
System.out.<span class="fn">println</span>(nums[<span class="num">0</span>]);    <span class="cm">// 10</span>
System.out.<span class="fn">println</span>(nums.length); <span class="cm">// 4</span></pre>
        </div>
        <div class="lang-card java">
          <div class="lang-header">ArrayList (ديناميكية)</div>
          <pre>ArrayList&lt;String&gt; list = <span class="kw">new</span> <span class="fn">ArrayList</span>();
list.<span class="fn">add</span>(<span class="str">"تفاح"</span>);
list.<span class="fn">add</span>(<span class="str">"موز"</span>);
list.<span class="fn">add</span>(<span class="str">"برتقال"</span>);

list.<span class="fn">remove</span>(<span class="str">"موز"</span>);
System.out.<span class="fn">println</span>(list.<span class="fn">size</span>()); <span class="cm">// 2</span>
System.out.<span class="fn">println</span>(list.<span class="fn">get</span>(<span class="num">0</span>));  <span class="cm">// تفاح</span></pre>
          <div class="lang-desc"><code>ArrayList</code> أفضل للقوائم المتغيرة الحجم. المصفوفة العادية <code>[]</code> للحجم الثابت المعروف مسبقاً.</div>
        </div>
        <div class="lang-card java">
          <div class="lang-header">مصفوفة ثنائية الأبعاد</div>
          <pre><span class="kw">int</span>[][] matrix = {
    {<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>},
    {<span class="num">4</span>, <span class="num">5</span>, <span class="num">6</span>},
    {<span class="num">7</span>, <span class="num">8</span>, <span class="num">9</span>}
};

<span class="cm">// طباعة كل العناصر</span>
<span class="kw">for</span> (<span class="kw">int</span>[] row : matrix) {
    <span class="kw">for</span> (<span class="kw">int</span> val : row) {
        System.out.<span class="fn">print</span>(val + <span class="str">" "</span>);
    }
    System.out.<span class="fn">println</span>();
}</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المصفوفات في Java</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">int[] arr = new int[5];<br>arr[5] = 10;</span></div>
          <div class="error-note">ArrayIndexOutOfBoundsException — الفهارس 0 إلى 4</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">arr[4] = 10; // آخر عنصر</span></div>
          <div class="error-note">مصفوفة حجم 5 → فهارس 0 إلى 4</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">arr1 == arr2</span></div>
          <div class="error-note">يقارن المرجع لا المحتوى</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">Arrays.equals(arr1, arr2)</span></div>
          <div class="error-note">Arrays.equals() لمقارنة المحتوى</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — المصفوفات في Java</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">int[] nums = {1, 2, 3};</code><code class="quiz-hint-chip" onclick="insertHint(this)">String[] names = {"علي", "نورة"};</code><code class="quiz-hint-chip" onclick="insertHint(this)">ArrayList<Integer> list = new ArrayList<>();</code><code class="quiz-hint-chip" onclick="insertHint(this)">int[] arr = new int[5];</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('arr-java', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="arr-python">
      <div class="section-title">القوائم في Python</div>
      <div class="lang-grid">
        <div class="lang-card python">
          <div class="lang-header">List </div>
          <pre>nums = [<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>, <span class="num">40</span>]
names = [<span class="str">"علي"</span>, <span class="str">"نورة"</span>, <span class="str">"محمد"</span>]

<span class="fn">print</span>(nums[<span class="num">0</span>])    <span class="cm"># 10</span>
<span class="fn">print</span>(nums[-<span class="num">1</span>])   <span class="cm"># 40 (الأخير)</span>
<span class="fn">print</span>(<span class="fn">len</span>(nums))   <span class="cm"># 4</span>
<span class="fn">print</span>(nums[<span class="num">1</span>:<span class="num">3</span>])  <span class="cm"># [20, 30]</span></pre>
          <div class="lang-desc">Python تدعم Negative Index: <code>list[-1]</code> آخر عنصر. Slicing <code>[1:3]</code> يستخرج نطاقاً من القائمة.</div>
        </div>
        <div class="lang-card python">
          <div class="lang-header">عمليات على القوائم</div>
          <pre>fruits = [<span class="str">"تفاح"</span>, <span class="str">"موز"</span>]
fruits.<span class="fn">append</span>(<span class="str">"برتقال"</span>)   <span class="cm"># إضافة</span>
fruits.<span class="fn">insert</span>(<span class="num">1</span>, <span class="str">"عنب"</span>)   <span class="cm"># إدراج</span>
fruits.<span class="fn">remove</span>(<span class="str">"موز"</span>)      <span class="cm"># حذف</span>
fruits.<span class="fn">sort</span>()              <span class="cm"># ترتيب</span>
fruits.<span class="fn">reverse</span>()           <span class="cm"># عكس</span>
<span class="fn">print</span>(fruits)</pre>
        </div>
        <div class="lang-card python">
          <div class="lang-header">Tuple و Set و Dict</div>
          <pre><span class="cm"># Tuple — غير قابلة للتعديل</span>
point = (<span class="num">10</span>, <span class="num">20</span>)

<span class="cm"># Set — بدون تكرار</span>
unique = {<span class="num">1</span>, <span class="num">2</span>, <span class="num">2</span>, <span class="num">3</span>, <span class="num">3</span>}  <span class="cm"># {1,2,3}</span>

<span class="cm"># Dictionary — مفتاح/قيمة</span>
person = {
    <span class="str">"name"</span>: <span class="str">"علي"</span>,
    <span class="str">"age"</span>: <span class="num">25</span>,
    <span class="str">"city"</span>: <span class="str">"الرياض"</span>
}
<span class="fn">print</span>(person[<span class="str">"name"</span>])</pre>
          <div class="lang-desc">Python لديها 4 هياكل بيانات مدمجة: <code>list</code> مرتبة قابلة للتعديل، <code>tuple</code> ثابتة، <code>set</code> بدون تكرار، <code>dict</code> مفتاح وقيمة.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المصفوفات في Python</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">list2 = list1<br>list2.append(5)<br># list1 تغيّرت!</span></div>
          <div class="error-note">= لا ينسخ القائمة — كلاهما يُشير لنفس الكائن</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">list2 = list1.copy()</span></div>
          <div class="error-note">.copy() أو [:] لنسخ حقيقية</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">my_list[10] # القائمة 5 عناصر</span></div>
          <div class="error-note">IndexError — الفهرس خارج النطاق</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if 10 &lt; len(my_list):<br>    print(my_list[10])</span></div>
          <div class="error-note">تحقق من الطول قبل الوصول بفهرس</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — المصفوفات في Python</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">nums = [1, 2, 3]</code><code class="quiz-hint-chip" onclick="insertHint(this)">names = ["علي", "نورة"]</code><code class="quiz-hint-chip" onclick="insertHint(this)">nums.append(4)</code><code class="quiz-hint-chip" onclick="insertHint(this)">evens = [x for x in nums if x%2==0]</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('arr-python', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="arr-js">
      <div class="section-title">المصفوفات في JavaScript</div>
      <div class="lang-grid">
        <div class="lang-card js">
          <div class="lang-header">Array </div>
          <pre><span class="kw">const</span> nums = [<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>];
<span class="kw">const</span> mixed = [<span class="num">1</span>, <span class="str">"نص"</span>, <span class="kw">true</span>, <span class="kw">null</span>];

console.<span class="fn">log</span>(nums[<span class="num">0</span>]);       <span class="cm">// 10</span>
console.<span class="fn">log</span>(nums.length);   <span class="cm">// 3</span>
console.<span class="fn">log</span>(nums.at(-<span class="num">1</span>));   <span class="cm">// 30</span></pre>
        </div>
        <div class="lang-card js">
          <div class="lang-header">map, filter, reduce</div>
          <pre><span class="kw">const</span> nums = [<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>, <span class="num">4</span>, <span class="num">5</span>];

<span class="kw">const</span> doubled = nums.<span class="fn">map</span>(n =&gt; n * <span class="num">2</span>);
<span class="kw">const</span> evens = nums.<span class="fn">filter</span>(n =&gt; n % <span class="num">2</span> === <span class="num">0</span>);
<span class="kw">const</span> total = nums.<span class="fn">reduce</span>((sum,n) =&gt; sum+n, <span class="num">0</span>);

console.<span class="fn">log</span>(doubled); <span class="cm">// [2,4,6,8,10]</span>
console.<span class="fn">log</span>(evens);   <span class="cm">// [2,4]</span>
console.<span class="fn">log</span>(total);   <span class="cm">// 15</span></pre>
          <div class="lang-desc"><code>map</code> يُطبّق دالة على كل عنصر، <code>filter</code> يُصفّي العناصر، <code>reduce</code> يُدمجها في قيمة واحدة.</div>
        </div>
        <div class="lang-card js">
          <div class="lang-header">Spread, Destructuring</div>
          <pre><span class="kw">const</span> a = [<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>];
<span class="kw">const</span> b = [<span class="num">4</span>, <span class="num">5</span>, <span class="num">6</span>];

<span class="cm">// دمج</span>
<span class="kw">const</span> combined = [...a, ...b];

<span class="cm">// Destructuring</span>
<span class="kw">const</span> [first, second, ...rest] = combined;
console.<span class="fn">log</span>(first);  <span class="cm">// 1</span>
console.<span class="fn">log</span>(rest);   <span class="cm">// [3,4,5,6]</span></pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المصفوفات في JavaScript</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">const arr2 = arr1;<br>arr2.push(5);<br>// arr1 تتأثر!</span></div>
          <div class="error-note">= لا ينسخ المصفوفة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">const arr2 = [...arr1];</span></div>
          <div class="error-note">Spread operator لنسخ حقيقية</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">[10,9,2].sort() // [10, 2, 9]</span></div>
          <div class="error-note">sort() بدون دالة يُرتّب كنصوص</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">[10,9,2].sort((a,b) =&gt; a-b) // [2,9,10]</span></div>
          <div class="error-note">مرّر دالة مقارنة للأرقام دائماً</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — المصفوفات في JavaScript</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">const nums = [1, 2, 3];</code><code class="quiz-hint-chip" onclick="insertHint(this)">const names = ["علي", "نورة"];</code><code class="quiz-hint-chip" onclick="insertHint(this)">nums.push(4);</code><code class="quiz-hint-chip" onclick="insertHint(this)">const doubled = nums.map(n => n*2);</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('arr-js', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <div class="topic-section" id="arr-cpp">
      <div class="section-title">المصفوفات في ++C</div>
      <div class="lang-grid">
        <div class="lang-card cpp">
          <div class="lang-header">Array </div>
          <pre><span class="kw">int</span> nums[<span class="num">4</span>] = {<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>, <span class="num">40</span>};

<span class="kw">for</span> (<span class="kw">int</span> i = <span class="num">0</span>; i &lt; <span class="num">4</span>; i++) {
    cout &lt;&lt; nums[i] &lt;&lt; <span class="str">" "</span>;
}

cout &lt;&lt; endl;
cout &lt;&lt; <span class="str">"أول عنصر: "</span> &lt;&lt; nums[<span class="num">0</span>];</pre>
        </div>
        <div class="lang-card cpp">
          <div class="lang-header">Vector (ديناميكية)</div>
          <pre>vector&lt;string&gt; names;
names.<span class="fn">push_back</span>(<span class="str">"علي"</span>);
names.<span class="fn">push_back</span>(<span class="str">"نورة"</span>);
names.<span class="fn">push_back</span>(<span class="str">"محمد"</span>);

cout &lt;&lt; names.<span class="fn">size</span>() &lt;&lt; endl; <span class="cm">// 3</span>
names.<span class="fn">pop_back</span>();             <span class="cm">// حذف الأخير</span>

<span class="kw">for</span> (<span class="kw">auto</span>&amp; n : names)
    cout &lt;&lt; n &lt;&lt; endl;</pre>
          <div class="lang-desc"><code>vector</code> هو المصفوفة الديناميكية في ++C — حجمها يتمدد تلقائياً عند الإضافة، أفضل من المصفوفة الثابتة.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المصفوفات في ++C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">int arr[5];<br>// تمريرها لدالة يُفقد حجمها</span></div>
          <div class="error-note">sizeof يفشل بعد تمرير المصفوفة لدالة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">vector&lt;int&gt; v = {1,2,3,4,5};<br>cout &lt;&lt; v.size();</span></div>
          <div class="error-note">vector — حجمه متاح دائماً بـ .size()</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — المصفوفات في C++</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">int nums[] = {1, 2, 3};</code><code class="quiz-hint-chip" onclick="insertHint(this)">vector<int> v = {1, 2, 3};</code><code class="quiz-hint-chip" onclick="insertHint(this)">v.push_back(4);</code><code class="quiz-hint-chip" onclick="insertHint(this)">array<int,3> a = {1,2,3};</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('arr-cpp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="arr-csharp">
      <div class="section-title">المصفوفات في #C</div>
      <div class="lang-grid">
        <div class="lang-card csharp">
          <div class="lang-header">Array</div>
          <pre><span class="kw">int</span>[] nums = {<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>};
<span class="kw">string</span>[] names = <span class="kw">new string</span>[<span class="num">3</span>];
names[<span class="num">0</span>] = <span class="str">"علي"</span>;

Console.<span class="fn">WriteLine</span>(nums[<span class="num">0</span>]);
Console.<span class="fn">WriteLine</span>(nums.Length);</pre>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">List&lt;T&gt; (ديناميكية)</div>
          <pre>List&lt;string&gt; fruits = <span class="kw">new</span> List&lt;string&gt;();
fruits.<span class="fn">Add</span>(<span class="str">"تفاح"</span>);
fruits.<span class="fn">Add</span>(<span class="str">"موز"</span>);
fruits.<span class="fn">Add</span>(<span class="str">"برتقال"</span>);

fruits.<span class="fn">Remove</span>(<span class="str">"موز"</span>);
fruits.<span class="fn">Sort</span>();

<span class="kw">foreach</span> (<span class="kw">var</span> f <span class="kw">in</span> fruits)
    Console.<span class="fn">WriteLine</span>(f);</pre>
          <div class="lang-desc"><code>List&lt;T&gt;</code> في #C مرنة وتتمدد تلقائياً عند الحاجة — أفضل من المصفوفة الثابتة في معظم الحالات.</div>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">LINQ على المصفوفات</div>
          <pre><span class="kw">int</span>[] nums = {<span class="num">5</span>, <span class="num">3</span>, <span class="num">8</span>, <span class="num">1</span>, <span class="num">9</span>, <span class="num">2</span>};

<span class="kw">var</span> evens = nums.<span class="fn">Where</span>(n =&gt; n % <span class="num">2</span> == <span class="num">0</span>);
<span class="kw">var</span> sorted = nums.<span class="fn">OrderBy</span>(n =&gt; n);
<span class="kw">int</span> total = nums.<span class="fn">Sum</span>();
<span class="kw">int</span> max = nums.<span class="fn">Max</span>();

Console.<span class="fn">WriteLine</span>(<span class="str">$"المجموع: {total}"</span>);</pre>
          <div class="lang-desc">LINQ يُتيح الاستعلام عن البيانات بصياغة تشبه SQL داخل الكود — يُبسّط كثيراً من عمليات الفلترة والتحويل.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المصفوفات في #C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">var list2 = list1;<br>list2.Add(5);<br>// list1 تغيّرت!</span></div>
          <div class="error-note">= لا ينسخ — كلاهما يُشير لنفس الكائن</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">var list2 = new List&lt;int&gt;(list1);</span></div>
          <div class="error-note">أنشئ قائمة جديدة للنسخ الحقيقي</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — المصفوفات في C#</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">int[] nums = {1, 2, 3};</code><code class="quiz-hint-chip" onclick="insertHint(this)">List<string> names = new List<string>();</code><code class="quiz-hint-chip" onclick="insertHint(this)">names.Add("علي");</code><code class="quiz-hint-chip" onclick="insertHint(this)">var filtered = nums.Where(n => n > 0).ToList();</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('arr-csharp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <div class="topic-section" id="arr-kotlin">
      <div class="section-title">المصفوفات والقوائم في Kotlin</div>
      <div class="lang-grid">
        <div class="lang-card kotlin">
          <div class="lang-header">Array و arrayOf</div>
          <pre><span class="cm">// مصفوفة ثابتة النوع</span>
<span class="kw">val</span> nums = intArrayOf(<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>, <span class="num">40</span>)
<span class="kw">val</span> names = arrayOf(<span class="str">"علي"</span>, <span class="str">"نورة"</span>, <span class="str">"محمد"</span>)

<span class="fn">println</span>(nums[<span class="num">0</span>])      <span class="cm">// 10</span>
<span class="fn">println</span>(names.size)   <span class="cm">// 3</span>

<span class="cm">// تعديل</span>
nums[<span class="num">0</span>] = <span class="num">99</span>

<span class="cm">// طباعة الكل</span>
<span class="fn">println</span>(nums.<span class="fn">toList</span>())  <span class="cm">// [99, 20, 30, 40]</span></pre>
          <div class="lang-desc">Kotlin تملك مصفوفات متخصصة لكل نوع: <code>IntArray</code>، <code>DoubleArray</code> — أسرع من <code>Array&lt;Int&gt;</code> لأنها لا تستخدم Boxing.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">List و MutableList</div>
          <pre><span class="cm">// List — غير قابلة للتعديل</span>
<span class="kw">val</span> fruits = listOf(<span class="str">"تفاح"</span>, <span class="str">"موز"</span>, <span class="str">"برتقال"</span>)
<span class="fn">println</span>(fruits[<span class="num">0</span>])  <span class="cm">// تفاح</span>

<span class="cm">// MutableList — قابلة للتعديل</span>
<span class="kw">val</span> mutable = mutableListOf(<span class="str">"أ"</span>, <span class="str">"ب"</span>)
mutable.<span class="fn">add</span>(<span class="str">"ج"</span>)
mutable.<span class="fn">remove</span>(<span class="str">"أ"</span>)
mutable.<span class="fn">sort</span>()

<span class="fn">println</span>(mutable)  <span class="cm">// [ب, ج]</span></pre>
          <div class="lang-desc">Kotlin تُفرّق بين <code>List</code> الثابتة (لا تتغير) و<code>MutableList</code> القابلة للتعديل — اختر الثابتة ما أمكن.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">عمليات على القوائم</div>
          <pre><span class="kw">val</span> nums = listOf(<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>, <span class="num">4</span>, <span class="num">5</span>)

<span class="kw">val</span> evens   = nums.<span class="fn">filter</span> { it % <span class="num">2</span> == <span class="num">0</span> }
<span class="kw">val</span> doubled = nums.<span class="fn">map</span> { it * <span class="num">2</span> }
<span class="kw">val</span> total   = nums.<span class="fn">sum</span>()
<span class="kw">val</span> sorted  = nums.<span class="fn">sortedDescending</span>()

<span class="fn">println</span>(evens)    <span class="cm">// [2, 4]</span>
<span class="fn">println</span>(doubled)  <span class="cm">// [2, 4, 6, 8, 10]</span>
<span class="fn">println</span>(total)    <span class="cm">// 15</span>

<span class="cm">// مصفوفة ثنائية</span>
<span class="kw">val</span> matrix = listOf(
    listOf(<span class="num">1</span>,<span class="num">2</span>,<span class="num">3</span>),
    listOf(<span class="num">4</span>,<span class="num">5</span>,<span class="num">6</span>)
)</pre>
          <div class="lang-desc">Kotlin تدعم نفس أسلوب البرمجة الوظيفية كـ JavaScript — <code>filter</code> و<code>map</code> و<code>reduce</code> بنفس المنطق.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المصفوفات في Kotlin</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">val list = listOf(1,2,3)<br>list.add(4) // خطأ!</span></div>
          <div class="error-note">listOf غير قابلة للتعديل</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">val list = mutableListOf(1,2,3)<br>list.add(4)</span></div>
          <div class="error-note">استخدم mutableListOf إذا احتجت الإضافة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — المصفوفات في Kotlin</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">val nums = listOf(1, 2, 3)</code><code class="quiz-hint-chip" onclick="insertHint(this)">val names = mutableListOf("علي", "نورة")</code><code class="quiz-hint-chip" onclick="insertHint(this)">names.add("محمد")</code><code class="quiz-hint-chip" onclick="insertHint(this)">val doubled = nums.map { it * 2 }</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('arr-kotlin', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    
    <!-- PHP ARRAYS -->
    <div class="topic-section" id="arr-php">
      <div class="section-title">المصفوفات في PHP</div>
      <div class="lang-grid">
        <div class="lang-card php">
          <div class="lang-header">Indexed Array</div>
          <pre>$nums  = [<span class="num">10</span>, <span class="num">20</span>, <span class="num">30</span>, <span class="num">40</span>];
$names = [<span class="str">"علي"</span>, <span class="str">"نورة"</span>, <span class="str">"محمد"</span>];

<span class="kw">echo</span> $nums[<span class="num">0</span>];           <span class="cm">// 10</span>
<span class="kw">echo</span> <span class="fn">count</span>($names);     <span class="cm">// 3</span>

$names[] = <span class="str">"فاطمة"</span>;      <span class="cm">// إضافة في النهاية</span>
<span class="fn">array_push</span>($names, <span class="str">"عمر"</span>);
<span class="fn">array_pop</span>($names);        <span class="cm">// حذف الأخير</span>
<span class="fn">print_r</span>($names);</pre>
          <div class="lang-desc"><code>$arr[] = "قيمة"</code> تُضيف في نهاية المصفوفة تلقائياً. <code>unset($arr[$i])</code> تحذف عنصراً بفهرسه.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Associative Array</div>
          <pre>$person = [
    <span class="str">"name"</span> =&gt; <span class="str">"نورة"</span>,
    <span class="str">"age"</span>  =&gt; <span class="num">22</span>,
    <span class="str">"city"</span> =&gt; <span class="str">"الرياض"</span>
];

<span class="kw">echo</span> $person[<span class="str">"name"</span>];            <span class="cm">// نورة</span>
$person[<span class="str">"email"</span>] = <span class="str">"n@x.com"</span>;   <span class="cm">// إضافة حقل</span>
<span class="fn">unset</span>($person[<span class="str">"age"</span>]);            <span class="cm">// حذف حقل</span></pre>
          <div class="lang-desc">المصفوفة الترابطية مثل القاموس — مفاتيح نصية بدلاً من أرقام. تُستخدم كثيراً لتمثيل بيانات الكائنات.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">array_map, filter, sort</div>
          <pre>$nums = [<span class="num">1</span>, <span class="num">2</span>, <span class="num">3</span>, <span class="num">4</span>, <span class="num">5</span>];

$doubled = <span class="fn">array_map</span>(<span class="kw">fn</span>($n) =&gt; $n * <span class="num">2</span>, $nums);
$evens   = <span class="fn">array_filter</span>($nums, <span class="kw">fn</span>($n) =&gt; $n % <span class="num">2</span> === <span class="num">0</span>);
$total   = <span class="fn">array_reduce</span>($nums, <span class="kw">fn</span>($c,$n) =&gt; $c+$n, <span class="num">0</span>);

<span class="fn">sort</span>($nums);    <span class="cm">// تصاعدي (يُعدّل المصفوفة)</span>
<span class="fn">rsort</span>($nums);   <span class="cm">// تنازلي</span>
<span class="fn">ksort</span>($person); <span class="cm">// ترتيب حسب المفاتيح</span></pre>
          <div class="lang-desc">PHP تملك أكثر من 70 دالة مدمجة للمصفوفات. <code>array_map</code> و<code>array_filter</code> و<code>array_reduce</code> الأكثر استخداماً.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — المصفوفات في PHP</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">$arr = [1,2,3];<br>unset($arr[1]);<br>// [0=&gt;1, 2=&gt;3]</span></div>
          <div class="error-note">unset لا يُعيد ترتيب الفهارس</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">unset($arr[1]);<br>$arr = array_values($arr);<br>// [0=&gt;1, 1=&gt;3]</span></div>
          <div class="error-note">array_values() بعد unset لإعادة الفهارس</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — المصفوفات في PHP</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">$nums = [1, 2, 3];</code><code class="quiz-hint-chip" onclick="insertHint(this)">$names = ["علي", "نورة"];</code><code class="quiz-hint-chip" onclick="insertHint(this)">array_push($nums, 4);</code><code class="quiz-hint-chip" onclick="insertHint(this)">$doubled = array_map(fn($n) => $n*2, $nums);</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('arr-php', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
  </div>
</div>

</asp:Content>
