<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="For.aspx.cs" Inherits="ForPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — For Loop / حلقات التكرار</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>🔁 حلقات For</h2>
    <p>مقارنة حلقات التكرار في لغات مختلفة</p>
  </div>
  <div class="content-wrap">
    <div class="topic-nav">
      <button type="button" class="topic-btn active" onclick="showTopic('for','java',this)">Java</button>
      <button type="button" class="topic-btn" onclick="showTopic('for','python',this)">Python</button>
      <button type="button" class="topic-btn" onclick="showTopic('for','js',this)">JavaScript</button>
      <button type="button" class="topic-btn" onclick="showTopic('for','cpp',this)">++C</button>
      <button type="button" class="topic-btn" onclick="showTopic('for','csharp',this)">#C</button>
      <button type="button" class="topic-btn" onclick="showTopic('for','kotlin',this)">Kotlin</button>
      <button type="button" class="topic-btn" onclick="showTopic('for','php',this)">PHP</button>
    </div>

    <div class="topic-section active" id="for-java">
      <div class="section-title">حلقة For في Java</div>
      <div class="lang-grid">
        <div class="lang-card java">
          <div class="lang-header">for </div>
          <pre><span class="kw">for</span> (<span class="kw">int</span> i = <span class="num">0</span>; i &lt; <span class="num">5</span>; i++) {
    System.out.<span class="fn">println</span>(<span class="str">"رقم: "</span> + i);
}</pre>
        </div>
        <div class="lang-card java">
          <div class="lang-header">for-each للمصفوفات</div>
          <pre>String[] names = {<span class="str">"علي"</span>,<span class="str">"نورة"</span>,<span class="str">"محمد"</span>};
<span class="kw">for</span> (String name : names) {
    System.out.<span class="fn">println</span>(name);
}</pre>
        </div>
        <div class="lang-card java">
          <div class="lang-header">for مع ArrayList</div>
          <pre>ArrayList&lt;Integer&gt; nums = <span class="kw">new</span> <span class="fn">ArrayList</span>();
nums.<span class="fn">add</span>(<span class="num">10</span>); nums.<span class="fn">add</span>(<span class="num">20</span>); nums.<span class="fn">add</span>(<span class="num">30</span>);

<span class="kw">for</span> (<span class="kw">int</span> n : nums) {
    System.out.<span class="fn">println</span>(n * <span class="num">2</span>);
}</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — حلقات For في Java</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (int i=0; i&lt;=arr.length; i++)</span></div>
          <div class="error-note">ArrayIndexOutOfBoundsException — يتجاوز آخر عنصر</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for (int i=0; i&lt;arr.length; i++)</span></div>
          <div class="error-note">< وليس <= دائماً مع المصفوفات</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (int i=0; i&lt;10; i++) {<br>  int sum=0; sum+=i; }</span></div>
          <div class="error-note">sum يُصفَّر في كل تكرار</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">int sum=0;<br>for (int i=0; i&lt;10; i++) sum+=i;</span></div>
          <div class="error-note">عرّف المتغير خارج الحلقة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — حلقات التكرار في Java</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">for (int i=0; i<5; i++)</code><code class="quiz-hint-chip" onclick="insertHint(this)">for (String s : names)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">for (int i=5; i>0; i--)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('for-java', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <div class="topic-section" id="for-python">
      <div class="section-title">حلقة For في Python</div>
      <div class="lang-grid">
        <div class="lang-card python">
          <div class="lang-header">for مع range</div>
          <pre><span class="kw">for</span> i <span class="kw">in</span> <span class="fn">range</span>(<span class="num">5</span>):
    <span class="fn">print</span>(<span class="str">f"رقم: {i}"</span>)

<span class="cm"># نطاق مخصص: 1 إلى 10 بخطوة 2</span>
<span class="kw">for</span> i <span class="kw">in</span> <span class="fn">range</span>(<span class="num">1</span>, <span class="num">11</span>, <span class="num">2</span>):
    <span class="fn">print</span>(i)</pre>
        </div>
        <div class="lang-card python">
          <div class="lang-header">for على القوائم + enumerate</div>
          <pre>fruits = [<span class="str">"تفاح"</span>, <span class="str">"موز"</span>, <span class="str">"برتقال"</span>]
<span class="kw">for</span> fruit <span class="kw">in</span> fruits:
    <span class="fn">print</span>(fruit)

<span class="cm"># مع الترقيم</span>
<span class="kw">for</span> i, fruit <span class="kw">in</span> <span class="fn">enumerate</span>(fruits):
    <span class="fn">print</span>(<span class="str">f"{i}: {fruit}"</span>)</pre>
        </div>
        <div class="lang-card python">
          <div class="lang-header">List Comprehension</div>
          <pre>squares = [x**<span class="num">2</span> <span class="kw">for</span> x <span class="kw">in</span> <span class="fn">range</span>(<span class="num">10</span>)]
evens = [x <span class="kw">for</span> x <span class="kw">in</span> <span class="fn">range</span>(<span class="num">20</span>) <span class="kw">if</span> x % <span class="num">2</span> == <span class="num">0</span>]
<span class="fn">print</span>(squares)
<span class="fn">print</span>(evens)</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — حلقات For في Python</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for i in range(1, 10): # 1 إلى 9</span></div>
          <div class="error-note">range(1,10) لا يشمل 10 — نطاق حصري</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for i in range(1, 11): # 1 إلى 10</span></div>
          <div class="error-note">لطباعة حتى 10 استخدم range(1, 11)</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for item in my_list:<br>    my_list.remove(item)</span></div>
          <div class="error-note">تعديل القائمة أثناء التكرار — سلوك غير متوقع</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">my_list = [x for x in my_list if x != item]</span></div>
          <div class="error-note">أنشئ قائمة جديدة بدلاً من التعديل</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — حلقات التكرار في Python</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">for i in range(5):</code><code class="quiz-hint-chip" onclick="insertHint(this)">for item in names:</code><code class="quiz-hint-chip" onclick="insertHint(this)">for i in range(1, 11):</code><code class="quiz-hint-chip" onclick="insertHint(this)">while count < 10:</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('for-python', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <div class="topic-section" id="for-js">
      <div class="section-title">حلقة For في JavaScript</div>
      <div class="lang-grid">
        <div class="lang-card js">
          <div class="lang-header">for </div>
          <pre><span class="kw">for</span> (<span class="kw">let</span> i = <span class="num">0</span>; i &lt; <span class="num">5</span>; i++) {
    console.<span class="fn">log</span>(<span class="str">`رقم: ${i}`</span>);
}</pre>
        </div>
        <div class="lang-card js">
          <div class="lang-header">forEach و for...of</div>
          <pre><span class="kw">const</span> names = [<span class="str">"علي"</span>, <span class="str">"نورة"</span>, <span class="str">"محمد"</span>];

names.<span class="fn">forEach</span>(name =&gt; {
    console.<span class="fn">log</span>(name);
});

<span class="kw">for</span> (<span class="kw">const</span> name <span class="kw">of</span> names) {
    console.<span class="fn">log</span>(name);
}</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — حلقات For في JavaScript</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (var i=0; i&lt;3; i++) { setTimeout(()=&gt;console.log(i)); } // يطبع 3,3,3</span></div>
          <div class="error-note">var لا يملك Block Scope — i تصبح 3 قبل التنفيذ</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for (let i=0; i&lt;3; i++) { ... } // يطبع 0,1,2</span></div>
          <div class="error-note">let يحفظ قيمة i في كل تكرار</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (let key in arr) { ... }</span></div>
          <div class="error-note">for...in للكائنات وليس للمصفوفات</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for (let item of arr) { ... }</span></div>
          <div class="error-note">for...of للمصفوفات، for...in للكائنات</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — حلقات التكرار في JavaScript</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">for (let i=0; i<5; i++)</code><code class="quiz-hint-chip" onclick="insertHint(this)">for (let item of arr)</code><code class="quiz-hint-chip" onclick="insertHint(this)">for (let key in obj)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('for-js', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <div class="topic-section" id="for-cpp">
      <div class="section-title">حلقة For في ++C</div>
      <div class="lang-grid">
        <div class="lang-card cpp">
          <div class="lang-header">for </div>
          <pre><span class="kw">for</span> (<span class="kw">int</span> i = <span class="num">0</span>; i &lt; <span class="num">5</span>; i++) {
    cout &lt;&lt; <span class="str">"رقم: "</span> &lt;&lt; i &lt;&lt; endl;
}</pre>
        </div>
        <div class="lang-card cpp">
          <div class="lang-header">Range-based for</div>
          <pre>vector&lt;string&gt; names = {<span class="str">"علي"</span>,<span class="str">"نورة"</span>};
<span class="kw">for</span> (<span class="kw">const auto</span>&amp; name : names) {
    cout &lt;&lt; name &lt;&lt; endl;
}</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — حلقات For في ++C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (int i=0; i&lt;=5; i++) cout&lt;&lt;arr[i]; // arr حجمه 5</span></div>
          <div class="error-note">تجاوز حدود المصفوفة — Undefined Behavior</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for (int i=0; i&lt;5; i++)<br>// أو: for (auto n : arr)</span></div>
          <div class="error-note">< وليس <=، أو Range-based for</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (auto item : bigVector)</span></div>
          <div class="error-note">يُنسخ كل عنصر — بطيء جداً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for (const auto&amp; item : bigVector)</span></div>
          <div class="error-note">const auto& يتجنب النسخ</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — حلقات التكرار في C++</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">for (int i=0; i<5; i++)</code><code class="quiz-hint-chip" onclick="insertHint(this)">for (auto& item : vec)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">for (auto n : nums)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('for-cpp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <div class="topic-section" id="for-csharp">
      <div class="section-title">حلقة For في #C</div>
      <div class="lang-grid">
        <div class="lang-card csharp">
          <div class="lang-header">for </div>
          <pre><span class="kw">for</span> (<span class="kw">int</span> i = <span class="num">0</span>; i &lt; <span class="num">5</span>; i++) {
    Console.<span class="fn">WriteLine</span>(<span class="str">$"رقم: {i}"</span>);
}</pre>
        </div>
        <div class="lang-card csharp">
          <div class="lang-header">foreach</div>
          <pre>string[] names = {<span class="str">"علي"</span>,<span class="str">"نورة"</span>,<span class="str">"محمد"</span>};
<span class="kw">foreach</span> (<span class="kw">string</span> name <span class="kw">in</span> names) {
    Console.<span class="fn">WriteLine</span>(name);
}</pre>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — حلقات For في #C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (int i=0; i&lt;=list.Count; i++)</span></div>
          <div class="error-note">ArgumentOutOfRangeException — تجاوز الحدود</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for (int i=0; i&lt;list.Count; i++)<br>// أو: foreach (var item in list)</span></div>
          <div class="error-note">< وليس <=</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">foreach (var item in list)<br>    list.Remove(item);</span></div>
          <div class="error-note">InvalidOperationException — لا تُعدّل أثناء foreach</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">list.RemoveAll(x =&gt; x == item);</span></div>
          <div class="error-note">استخدم RemoveAll بدلاً من Remove داخل foreach</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — حلقات التكرار في C#</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">for (int i=0; i<5; i++)</code><code class="quiz-hint-chip" onclick="insertHint(this)">foreach (var item in list)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code><code class="quiz-hint-chip" onclick="insertHint(this)">do { } while (cond);</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('for-csharp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <div class="topic-section" id="for-kotlin">
      <div class="section-title">حلقة For في Kotlin</div>
      <div class="lang-grid">
        <div class="lang-card kotlin">
          <div class="lang-header">for مع نطاق (Range)</div>
          <pre><span class="cm">// نطاق شامل: 0 إلى 4</span>
<span class="kw">for</span> (i <span class="kw">in</span> <span class="num">0</span>..<span class="num">4</span>) {
    <span class="fn">println</span>(<span class="str">"رقم: $i"</span>)
}

<span class="cm">// بخطوة مخصصة (step)</span>
<span class="kw">for</span> (i <span class="kw">in</span> <span class="num">1</span>..<span class="num">10</span> step <span class="num">2</span>) {
    <span class="fn">println</span>(i)  <span class="cm">// 1 3 5 7 9</span>
}

<span class="cm">// عكسي</span>
<span class="kw">for</span> (i <span class="kw">in</span> <span class="num">5</span> downTo <span class="num">1</span>) {
    <span class="fn">print</span>(<span class="str">"$i "</span>)  <span class="cm">// 5 4 3 2 1</span>
}</pre>
          <div class="lang-desc"><code>1..5</code> من 1 إلى 5 شاملاً. <code>1 until 5</code> من 1 إلى 4 (5 مستثنى). <code>step</code> لتحديد الخطوة.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">for على القوائم</div>
          <pre><span class="kw">val</span> names = listOf(<span class="str">"علي"</span>, <span class="str">"نورة"</span>, <span class="str">"محمد"</span>)

<span class="kw">for</span> (name <span class="kw">in</span> names) {
    <span class="fn">println</span>(name)
}

<span class="cm">// مع الفهرس</span>
<span class="kw">for</span> ((index, name) <span class="kw">in</span> names.<span class="fn">withIndex</span>()) {
    <span class="fn">println</span>(<span class="str">"$index: $name"</span>)
}

<span class="cm">// forEach</span>
names.<span class="fn">forEach</span> { name ->
    <span class="fn">println</span>(name)
}</pre>
          <div class="lang-desc"><code>withIndex()</code> يُعيد الفهرس والقيمة معاً في كل تكرار — بديل أنيق لـ <code>for (i in 0..list.size-1)</code>.</div>
        </div>
        <div class="lang-card kotlin">
          <div class="lang-header">repeat و until</div>
          <pre><span class="cm">// repeat — بديل أنيق لـ for</span>
<span class="fn">repeat</span>(<span class="num">5</span>) { i ->
    <span class="fn">println</span>(<span class="str">"تكرار رقم $i"</span>)
}

<span class="cm">// until (حصري — لا يشمل النهاية)</span>
<span class="kw">for</span> (i <span class="kw">in</span> <span class="num">0</span> until <span class="num">5</span>) {
    <span class="fn">print</span>(<span class="str">"$i "</span>)  <span class="cm">// 0 1 2 3 4</span>
}

<span class="cm">// مصفوفة ثنائية</span>
<span class="kw">val</span> matrix = arrayOf(
    intArrayOf(<span class="num">1</span>,<span class="num">2</span>,<span class="num">3</span>),
    intArrayOf(<span class="num">4</span>,<span class="num">5</span>,<span class="num">6</span>)
)
<span class="kw">for</span> (row <span class="kw">in</span> matrix) <span class="kw">for</span> (v <span class="kw">in</span> row) <span class="fn">print</span>(<span class="str">"$v "</span>)</pre>
          <div class="lang-desc"><code>repeat(n)</code> لتكرار كود معين n مرة بدون الحاجة لمتغير عداد — أوضح من for عندما لا تحتاج قيمة i.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — حلقات For في Kotlin</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (i in 0..list.size)</span></div>
          <div class="error-note">.. شامل — IndexOutOfBoundsException</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for (i in 0 until list.size)<br>// أو: for (item in list)</span></div>
          <div class="error-note">until حصري لا يشمل الحد الأعلى</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for (i in 10..1) println(i)</span></div>
          <div class="error-note">لا يطبع شيئاً — .. لا يعمل عكسياً</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for (i in 10 downTo 1) println(i)</span></div>
          <div class="error-note">downTo للتكرار العكسي</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — حلقات التكرار في Kotlin</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">for (i in 0..4)</code><code class="quiz-hint-chip" onclick="insertHint(this)">for (item in list)</code><code class="quiz-hint-chip" onclick="insertHint(this)">for (i in 1..10 step 2)</code><code class="quiz-hint-chip" onclick="insertHint(this)">repeat(5)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while (i < 10)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('for-kotlin', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    
    <!-- PHP FOR -->
    <div class="topic-section" id="for-php">
      <div class="section-title">حلقات For في PHP</div>
      <div class="lang-grid">
        <div class="lang-card php">
          <div class="lang-header">for</div>
          <pre><span class="kw">for</span> ($i = <span class="num">0</span>; $i &lt; <span class="num">5</span>; $i++) {
    <span class="kw">echo</span> <span class="str">"رقم: $i\n"</span>;
}

<span class="cm">// عكسي</span>
<span class="kw">for</span> ($i = <span class="num">4</span>; $i &gt;= <span class="num">0</span>; $i--) {
    <span class="kw">echo</span> <span class="str">"$i "</span>;
}</pre>
          <div class="lang-desc">صياغة <code>for</code> في PHP مطابقة لـ Java و++C — الفرق الوحيد أن المتغيرات تبدأ بـ<code>$</code>.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">foreach</div>
          <pre>$names = [<span class="str">"علي"</span>, <span class="str">"نورة"</span>, <span class="str">"محمد"</span>];

<span class="kw">foreach</span> ($names <span class="kw">as</span> $name) {
    <span class="kw">echo</span> $name . <span class="str">"\n"</span>;
}

<span class="cm">// مع الفهرس والقيمة</span>
<span class="kw">foreach</span> ($names <span class="kw">as</span> $i =&gt; $name) {
    <span class="kw">echo</span> <span class="str">"$i: $name\n"</span>;
}</pre>
          <div class="lang-desc"><code>foreach</code> هو الخيار الأمثل للمرور على المصفوفات في PHP — أوضح وأأمن من <code>for</code> العادية.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">while</div>
          <pre>$i = <span class="num">0</span>;
<span class="kw">while</span> ($i &lt; <span class="num">5</span>) {
    <span class="kw">echo</span> <span class="str">"$i "</span>;
    $i++;
}

<span class="cm">// do-while</span>
$j = <span class="num">1</span>;
<span class="kw">do</span> {
    <span class="kw">echo</span> <span class="str">"$j "</span>;
    $j++;
} <span class="kw">while</span> ($j &lt;= <span class="num">5</span>);</pre>
          <div class="lang-desc">PHP تدعم أربعة أنواع من الحلقات. <code>break 2</code> ميزة خاصة تُخرجك من حلقتين متداخلتين دفعة واحدة.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — حلقات For في PHP</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for ($i=0; $i&lt;=count($arr); $i++)</span></div>
          <div class="error-note">تجاوز الحدود — Undefined offset</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">for ($i=0; $i&lt;count($arr); $i++)<br>// أو: foreach ($arr as $item)</span></div>
          <div class="error-note">< وليس <=</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">for ($i=0; $i&lt;count($arr); $i++)</span></div>
          <div class="error-note">count() يُستدعى في كل تكرار — بطيء</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">$len = count($arr);<br>for ($i=0; $i&lt;$len; $i++)</span></div>
          <div class="error-note">احسب الطول مرة واحدة خارج الحلقة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — حلقات التكرار في PHP</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">for ($i=0; $i<5; $i++)</code><code class="quiz-hint-chip" onclick="insertHint(this)">foreach ($arr as $item)</code><code class="quiz-hint-chip" onclick="insertHint(this)">foreach ($arr as $k => $v)</code><code class="quiz-hint-chip" onclick="insertHint(this)">while ($i < 10)</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('for-php', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
  </div>
</div>

</asp:Content>
