<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OOP.aspx.cs" Inherits="OOPPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — OOP / البرمجة الكائنية</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>🏗️ OOP — البرمجة الكائنية</h2>
    <p>مفاهيم البرمجة الكائنية في لغات مختلفة</p>
  </div>
  <div class="content-wrap">
    <div class="topic-nav">
      <button type="button" class="topic-btn active" onclick="showTopic('oop','java',this)">Java</button>
      <button type="button" class="topic-btn" onclick="showTopic('oop','python',this)">Python</button>
      <button type="button" class="topic-btn" onclick="showTopic('oop','js',this)">JavaScript</button>
      <button type="button" class="topic-btn" onclick="showTopic('oop','cpp',this)">++C</button>
      <button type="button" class="topic-btn" onclick="showTopic('oop','csharp',this)">#C</button>
      <button type="button" class="topic-btn" onclick="showTopic('oop','kotlin',this)">Kotlin</button>
      <button type="button" class="topic-btn" onclick="showTopic('oop','php',this)">PHP</button>
    </div>

    <!-- ═══════════════════════ JAVA ═══════════════════════ -->
    <div class="topic-section active" id="oop-java">
      <div class="section-title">OOP في Java</div>
      <div class="lang-grid">

        <div class="lang-card java">
          <div class="lang-header">Class &amp; Object</div>
<pre><span class="cm">// تعريف كلاس يمثّل سيارة</span>
<span class="kw">class</span> <span class="fn">Car</span> {
    <span class="kw">String</span> brand;                           <span class="cm">// متغير يخزّن اسم الماركة</span>
    <span class="kw">int</span>    year;                            <span class="cm">// متغير يخزّن سنة الصنع</span>

    <span class="cm">// Constructor — يُستدعى تلقائياً عند إنشاء Object</span>
    <span class="fn">Car</span>(<span class="kw">String</span> brand, <span class="kw">int</span> year) {
        <span class="kw">this</span>.brand = brand;                 <span class="cm">// this يُشير للكائن الحالي</span>
        <span class="kw">this</span>.year  = year;                  <span class="cm">// ربط المعامل بالمتغير</span>
    }

    <span class="cm">// دالة تطبع معلومات السيارة</span>
    <span class="kw">void</span> <span class="fn">info</span>() {
        System.out.<span class="fn">println</span>(brand + <span class="str">" ("</span> + year + <span class="str">")"</span>); <span class="cm">// طباعة الماركة والسنة</span>
    }
}

<span class="fn">Car</span> c = <span class="kw">new</span> <span class="fn">Car</span>(<span class="str">"تويوتا"</span>, <span class="num">2023</span>);  <span class="cm">// إنشاء Object من الكلاس</span>
c.<span class="fn">info</span>();                           <span class="cm">// → تويوتا (2023)</span></pre>
          <div class="lang-desc">الـ <code>Class</code> هو القالب (كالمخطط)، والـ <code>Object</code> هو المنتج الفعلي. يمكن إنشاء آلاف Objects من كلاس واحد.</div>
        </div>

        <div class="lang-card java">
          <div class="lang-header">Encapsulation — التغليف</div>
<pre><span class="kw">class</span> <span class="fn">BankAccount</span> {
    <span class="kw">private double</span> balance;              <span class="cm">// private = لا يُعدَّل من الخارج</span>

    <span class="fn">BankAccount</span>(<span class="kw">double</span> initial) {
        balance = initial;               <span class="cm">// تعيين الرصيد الأولي</span>
    }

    <span class="cm">// Getter — يسمح بقراءة الرصيد فقط</span>
    <span class="kw">public double</span> <span class="fn">getBalance</span>() {
        <span class="kw">return</span> balance;                  <span class="cm">// إرجاع قيمة الرصيد</span>
    }

    <span class="cm">// Setter مع تحقق — يمنع القيم السالبة</span>
    <span class="kw">public void</span> <span class="fn">deposit</span>(<span class="kw">double</span> amount) {
        <span class="kw">if</span> (amount &gt; <span class="num">0</span>)               <span class="cm">// تحقق: المبلغ يجب أن يكون موجباً</span>
            balance += amount;           <span class="cm">// إضافة المبلغ للرصيد</span>
    }

    <span class="kw">public void</span> <span class="fn">withdraw</span>(<span class="kw">double</span> amount) {
        <span class="kw">if</span> (amount &lt;= balance)          <span class="cm">// تحقق: لا سحب أكثر من الرصيد</span>
            balance -= amount;           <span class="cm">// خصم المبلغ من الرصيد</span>
    }
}

<span class="fn">BankAccount</span> acc = <span class="kw">new</span> <span class="fn">BankAccount</span>(<span class="num">1000</span>); <span class="cm">// رصيد أولي 1000</span>
acc.<span class="fn">deposit</span>(<span class="num">500</span>);                          <span class="cm">// يُضيف 500 → الرصيد 1500</span>
System.out.<span class="fn">println</span>(acc.<span class="fn">getBalance</span>());    <span class="cm">// 1500.0</span></pre>
          <div class="lang-desc"><code>private</code> يُخفي البيانات من الخارج. الوصول يكون فقط عبر Getters/Setters التي تتحكم وتتحقق قبل الإدخال أو القراءة.</div>
        </div>

        <div class="lang-card java">
          <div class="lang-header">Inheritance — الوراثة</div>
<pre><span class="cm">// الكلاس الأب — يحتوي السلوك المشترك</span>
<span class="kw">class</span> <span class="fn">Animal</span> {
    <span class="kw">String</span> name;                             <span class="cm">// خاصية مشتركة: اسم الحيوان</span>
    <span class="fn">Animal</span>(<span class="kw">String</span> name) { <span class="kw">this</span>.name = name; } <span class="cm">// Constructor الأب</span>
    <span class="kw">void</span> <span class="fn">speak</span>() { System.out.<span class="fn">println</span>(<span class="str">"صوت عام"</span>); } <span class="cm">// سلوك افتراضي</span>
}

<span class="cm">// Dog يرث كل خصائص Animal تلقائياً</span>
<span class="kw">class</span> <span class="fn">Dog</span> <span class="kw">extends</span> <span class="fn">Animal</span> {
    <span class="fn">Dog</span>(<span class="kw">String</span> name) { <span class="kw">super</span>(name); }     <span class="cm">// super() يستدعي Constructor الأب</span>

    @Override                                <span class="cm">// تأكيد إعادة كتابة الدالة</span>
    <span class="kw">void</span> <span class="fn">speak</span>() {
        System.out.<span class="fn">println</span>(name + <span class="str">" يقول: هاو! 🐕"</span>); <span class="cm">// سلوك خاص بالكلب</span>
    }
}

<span class="kw">class</span> <span class="fn">Cat</span> <span class="kw">extends</span> <span class="fn">Animal</span> {
    <span class="fn">Cat</span>(<span class="kw">String</span> name) { <span class="kw">super</span>(name); }     <span class="cm">// نفس طريقة تمرير الاسم للأب</span>

    @Override
    <span class="kw">void</span> <span class="fn">speak</span>() {
        System.out.<span class="fn">println</span>(name + <span class="str">" يقول: مياو! 🐈"</span>); <span class="cm">// سلوك خاص بالقطة</span>
    }
}

<span class="fn">Dog</span> d = <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>); <span class="cm">// إنشاء كائن Dog</span>
d.<span class="fn">speak</span>();               <span class="cm">// ريكو يقول: هاو! 🐕</span></pre>
          <div class="lang-desc"><code>extends</code> يجعل الكلاس الابن يرث كل شيء من الأب. <code>@Override</code> يُعيد كتابة سلوك دالة الأب.</div>
        </div>

        <div class="lang-card java">
          <div class="lang-header">Polymorphism — تعدد الأشكال</div>
<pre><span class="cm">// مصفوفة من النوع الأب — تحتوي كائنات مختلفة</span>
<span class="fn">Animal</span>[] animals = {
    <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>),   <span class="cm">// كلب مُخزَّن كـ Animal</span>
    <span class="kw">new</span> <span class="fn">Cat</span>(<span class="str">"كيتي"</span>),   <span class="cm">// قطة مُخزَّنة كـ Animal</span>
    <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"مكس"</span>)    <span class="cm">// كلب آخر</span>
};

<span class="cm">// نفس الدالة تتصرف بشكل مختلف لكل كائن (Dynamic Dispatch)</span>
<span class="kw">for</span> (<span class="fn">Animal</span> a : animals) {
    a.<span class="fn">speak</span>(); <span class="cm">// Java تختار التنفيذ الصحيح تلقائياً وقت التشغيل</span>
}

<span class="cm">// instanceof يتحقق من النوع الفعلي للكائن</span>
<span class="kw">if</span> (animals[<span class="num">0</span>] <span class="kw">instanceof</span> <span class="fn">Dog</span> dog) { <span class="cm">// Pattern Matching في Java 16+</span>
    System.out.<span class="fn">println</span>(<span class="str">"هذا كلب: "</span> + dog.name); <span class="cm">// وصول مباشر بعد التحقق</span>
}</pre>
          <div class="lang-desc">نفس الكود يعمل مع أنواع مختلفة — تستطيع إضافة حيوان جديد بدون تعديل أي كود موجود.</div>
        </div>

        <div class="lang-card java">
          <div class="lang-header">Abstraction — Interface</div>
<pre><span class="cm">// Interface يُعرّف العقد — ماذا يفعل وليس كيف</span>
<span class="kw">interface</span> <span class="fn">Shape</span> {
    <span class="kw">double</span> <span class="fn">area</span>();       <span class="cm">// كل شكل يجب أن يحسب مساحته</span>
    <span class="kw">double</span> <span class="fn">perimeter</span>(); <span class="cm">// كل شكل يجب أن يحسب محيطه</span>
}

<span class="kw">class</span> <span class="fn">Circle</span> <span class="kw">implements</span> <span class="fn">Shape</span> {
    <span class="kw">double</span> r;
    <span class="fn">Circle</span>(<span class="kw">double</span> r) { <span class="kw">this</span>.r = r; }
    <span class="kw">public double</span> <span class="fn">area</span>()      { <span class="kw">return</span> Math.PI * r * r; }
    <span class="kw">public double</span> <span class="fn">perimeter</span>() { <span class="kw">return</span> <span class="num">2</span> * Math.PI * r; }
}

<span class="fn">Shape</span> s = <span class="kw">new</span> <span class="fn">Circle</span>(<span class="num">5</span>);
System.out.<span class="fn">printf</span>(<span class="str">"المساحة: %.2f%n"</span>, s.<span class="fn">area</span>()); <span class="cm">// 78.54</span></pre>
          <div class="lang-desc">الـ Interface عقد: يقول "ماذا يجب أن تفعل" بدون أن يقول "كيف". الكلاس المنفّذ يحدد التفاصيل.</div>
        </div>

        <div class="lang-card java">
          <div class="lang-header">Abstraction — Abstract Class</div>
<pre><span class="cm">// Abstract Class — لا يمكن إنشاء Object منه مباشرة</span>
<span class="kw">abstract class</span> <span class="fn">Shape</span> {
    <span class="kw">abstract double</span> <span class="fn">area</span>();      <span class="cm">// إلزامي التنفيذ</span>
    <span class="kw">abstract double</span> <span class="fn">perimeter</span>(); <span class="cm">// إلزامي التنفيذ</span>

    <span class="cm">// دالة جاهزة يرثها الجميع</span>
    <span class="kw">void</span> <span class="fn">describe</span>() {
        System.out.<span class="fn">printf</span>(<span class="str">"المساحة: %.2f%n"</span>, <span class="fn">area</span>());
    }
}

<span class="kw">class</span> <span class="fn">Circle</span> <span class="kw">extends</span> <span class="fn">Shape</span> {
    <span class="kw">double</span> r;
    <span class="fn">Circle</span>(<span class="kw">double</span> r) { <span class="kw">this</span>.r = r; }
    <span class="kw">double</span> <span class="fn">area</span>()      { <span class="kw">return</span> Math.PI * r * r; }
    <span class="kw">double</span> <span class="fn">perimeter</span>() { <span class="kw">return</span> <span class="num">2</span> * Math.PI * r; }
}

<span class="kw">new</span> <span class="fn">Circle</span>(<span class="num">5</span>).<span class="fn">describe</span>(); <span class="cm">// المساحة: 78.54</span>
<span class="cm">// new Shape() ← خطأ! لا يمكن إنشاء abstract class</span></pre>
          <div class="lang-desc">Abstract Class يجمع بين العقد والتنفيذ الجزئي — يُحدد بعض الدوال ويترك أخرى للأبناء. لا يمكن إنشاء Object منه مباشرة.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — OOP في Java</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">class Car { public String brand; }</span></div>
          <div class="error-note">public على الخصائص يكسر Encapsulation</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">private String brand;<br>public String getBrand() { return brand; }</span></div>
          <div class="error-note">private + Getter يحمي البيانات</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">Animal a = new Dog();<br>a.fetch(); // لا تعمل!</span></div>
          <div class="error-note">المتغير من نوع Animal — لا يرى دوال Dog</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">if (a instanceof Dog d) d.fetch();</span></div>
          <div class="error-note">تحقق بـ instanceof قبل الاستدعاء</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — OOP في Java</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">public class Car</code><code class="quiz-hint-chip" onclick="insertHint(this)">private String brand;</code><code class="quiz-hint-chip" onclick="insertHint(this)">public Car(String brand)</code><code class="quiz-hint-chip" onclick="insertHint(this)">class Dog extends Animal</code><code class="quiz-hint-chip" onclick="insertHint(this)">class Circle implements Shape</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('oop-java', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <!-- ═══════════════════════ PYTHON ═══════════════════════ -->
    <div class="topic-section" id="oop-python">
      <div class="section-title">OOP في Python</div>
      <div class="lang-grid">

        <div class="lang-card python">
          <div class="lang-header">Class &amp; Object</div>
<pre><span class="cm"># تعريف كلاس يمثّل سيارة</span>
<span class="kw">class</span> <span class="fn">Car</span>:
    <span class="cm"># __init__ هو Constructor — يُستدعى تلقائياً عند الإنشاء</span>
    <span class="kw">def</span> <span class="fn">__init__</span>(self, brand, year):
        self.brand = brand   <span class="cm"># self يُشير للكائن الحالي</span>
        self.year  = year    <span class="cm"># تعيين سنة الصنع</span>

    <span class="cm"># دالة عادية تطبع المعلومات</span>
    <span class="kw">def</span> <span class="fn">info</span>(self):
        <span class="fn">print</span>(<span class="str">f"{self.brand} ({self.year})"</span>) <span class="cm"># f-string للتنسيق السريع</span>

    <span class="cm"># __str__ تُحدد ما يظهر عند print(object)</span>
    <span class="kw">def</span> <span class="fn">__str__</span>(self):
        <span class="kw">return</span> <span class="str">f"سيارة: {self.brand}"</span>        <span class="cm"># نص مخصص للطباعة</span>

c = <span class="fn">Car</span>(<span class="str">"تويوتا"</span>, <span class="num">2023</span>) <span class="cm"># إنشاء Object</span>
c.<span class="fn">info</span>()                <span class="cm"># تويوتا (2023)</span>
<span class="fn">print</span>(c)                <span class="cm"># سيارة: تويوتا — عبر __str__</span></pre>
          <div class="lang-desc"><code>self</code> مكافئ لـ <code>this</code> في Java — يُشير للكائن الحالي. يُمرَّر تلقائياً لكل دالة في الكلاس.</div>
        </div>

        <div class="lang-card python">
          <div class="lang-header">Encapsulation — التغليف</div>
<pre><span class="kw">class</span> <span class="fn">BankAccount</span>:
    <span class="kw">def</span> <span class="fn">__init__</span>(self, initial):
        self.__balance = initial  <span class="cm"># __ = private تماماً (name mangling)</span>
        self._owner = <span class="str">"عميل"</span>    <span class="cm"># _ = protected (اتفاقية، ليست قسراً)</span>

    <span class="cm"># @property تحوّل الدالة لخاصية — تُقرأ بدون ()</span>
    @property
    <span class="kw">def</span> <span class="fn">balance</span>(self):
        <span class="kw">return</span> self.__balance      <span class="cm"># إرجاع الرصيد بطريقة آمنة</span>

    <span class="cm"># @setter يُحدد كيف تُعيَّن القيمة</span>
    @balance.setter
    <span class="kw">def</span> <span class="fn">balance</span>(self, value):
        <span class="kw">if</span> value &gt;= <span class="num">0</span>:               <span class="cm"># تحقق: لا قيم سالبة</span>
            self.__balance = value   <span class="cm"># تعيين آمن</span>

    <span class="kw">def</span> <span class="fn">deposit</span>(self, amount):
        <span class="kw">if</span> amount &gt; <span class="num">0</span>:                   <span class="cm"># تحقق: مبلغ موجب فقط</span>
            self.__balance += amount  <span class="cm"># إضافة للرصيد</span>

acc = <span class="fn">BankAccount</span>(<span class="num">1000</span>)  <span class="cm"># رصيد أولي 1000</span>
acc.<span class="fn">deposit</span>(<span class="num">500</span>)           <span class="cm"># إضافة 500</span>
<span class="fn">print</span>(acc.balance)         <span class="cm"># 1500 — يُقرأ كخاصية بدون ()</span></pre>
          <div class="lang-desc"><code>__</code> يُصعّب الوصول من الخارج (name mangling) لكنه ليس منعاً تاماً. <code>@property</code> لإضافة منطق على القراءة والكتابة.</div>
        </div>

        <div class="lang-card python">
          <div class="lang-header">Inheritance — الوراثة</div>
<pre><span class="cm"># الكلاس الأب — السلوك المشترك</span>
<span class="kw">class</span> <span class="fn">Animal</span>:
    <span class="kw">def</span> <span class="fn">__init__</span>(self, name):
        self.name = name               <span class="cm"># اسم الحيوان</span>

    <span class="kw">def</span> <span class="fn">speak</span>(self):
        <span class="fn">print</span>(<span class="str">"صوت عام"</span>)               <span class="cm"># سلوك افتراضي</span>

    <span class="kw">def</span> <span class="fn">describe</span>(self):
        <span class="fn">print</span>(<span class="str">f"أنا {self.name}"</span>)      <span class="cm"># دالة مشتركة لكل الحيوانات</span>

<span class="cm"># Dog يرث من Animal — يحصل على describe() تلقائياً</span>
<span class="kw">class</span> <span class="fn">Dog</span>(Animal):
    <span class="kw">def</span> <span class="fn">speak</span>(self):                         <span class="cm"># Override دالة الأب</span>
        <span class="fn">print</span>(<span class="str">f"{self.name}: هاو! 🐕"</span>)     <span class="cm"># سلوك خاص بالكلب</span>

<span class="kw">class</span> <span class="fn">Cat</span>(Animal):
    <span class="kw">def</span> <span class="fn">speak</span>(self):
        <span class="fn">print</span>(<span class="str">f"{self.name}: مياو! 🐈"</span>)    <span class="cm"># سلوك خاص بالقطة</span>

d = <span class="fn">Dog</span>(<span class="str">"ريكو"</span>)   <span class="cm"># إنشاء كائن Dog</span>
d.<span class="fn">speak</span>()          <span class="cm"># ريكو: هاو! 🐕</span>
d.<span class="fn">describe</span>()       <span class="cm"># أنا ريكو — موروثة من Animal</span></pre>
          <div class="lang-desc">Python تدعم الوراثة المتعددة <code>class C(A, B)</code> — ترتيب الآباء يُحدد أولوية البحث عن الدوال.</div>
        </div>

        <div class="lang-card python">
          <div class="lang-header">Polymorphism — تعدد الأشكال</div>
<pre><span class="cm"># قائمة تحتوي أنواعاً مختلفة من الحيوانات</span>
animals = [
    <span class="fn">Dog</span>(<span class="str">"ريكو"</span>),     <span class="cm"># كائن من نوع Dog</span>
    <span class="fn">Cat</span>(<span class="str">"كيتي"</span>),     <span class="cm"># كائن من نوع Cat</span>
    <span class="fn">Dog</span>(<span class="str">"مكس"</span>),      <span class="cm"># كائن آخر من نوع Dog</span>
]

<span class="cm"># نفس الكود يعمل مع كل الأنواع — Duck Typing</span>
<span class="kw">for</span> animal <span class="kw">in</span> animals:
    animal.<span class="fn">speak</span>()   <span class="cm"># كل حيوان ينفّذ speak() بطريقته</span>

<span class="cm"># isinstance للتحقق من نوع الكائن</span>
<span class="fn">print</span>(<span class="fn">isinstance</span>(animals[<span class="num">0</span>], Dog))     <span class="cm"># True</span>
<span class="fn">print</span>(<span class="fn">isinstance</span>(animals[<span class="num">0</span>], Animal))  <span class="cm"># True — لأنه وارث</span>
<span class="fn">print</span>(<span class="fn">type</span>(animals[<span class="num">1</span>]).__name__)        <span class="cm"># Cat — الاسم الفعلي للنوع</span></pre>
          <div class="lang-desc">Python تستخدم Duck Typing: "إذا كان يمشي كالبطة ويُصوّت كالبطة فهو بطة" — لا تتحقق من النوع بل من وجود الدالة.</div>
        </div>

        <div class="lang-card python">
          <div class="lang-header">Abstraction — Abstract Class (ABC)</div>
<pre><span class="kw">from</span> abc <span class="kw">import</span> ABC, abstractmethod

<span class="cm"># ABC = لا يمكن إنشاء Object منه مباشرة</span>
<span class="kw">class</span> <span class="fn">Shape</span>(ABC):
    @abstractmethod
    <span class="kw">def</span> <span class="fn">area</span>(self): <span class="kw">pass</span>      <span class="cm"># إلزامي التنفيذ</span>

    @abstractmethod
    <span class="kw">def</span> <span class="fn">perimeter</span>(self): <span class="kw">pass</span> <span class="cm"># إلزامي التنفيذ</span>

    <span class="cm"># دالة جاهزة يرثها الجميع</span>
    <span class="kw">def</span> <span class="fn">describe</span>(self):
        <span class="fn">print</span>(<span class="str">f"المساحة: {self.area():.2f}"</span>)

<span class="kw">class</span> <span class="fn">Circle</span>(Shape):
    <span class="kw">def</span> <span class="fn">__init__</span>(self, r): self.r = r
    <span class="kw">def</span> <span class="fn">area</span>(self):      <span class="kw">return</span> <span class="num">3.14159</span> * self.r ** <span class="num">2</span>
    <span class="kw">def</span> <span class="fn">perimeter</span>(self): <span class="kw">return</span> <span class="num">2</span> * <span class="num">3.14159</span> * self.r

<span class="fn">Circle</span>(<span class="num">5</span>).<span class="fn">describe</span>() <span class="cm"># المساحة: 78.54</span>
<span class="cm"># Shape() ← TypeError! لا إنشاء من ABC</span></pre>
          <div class="lang-desc">Python لا تملك Interface رسمياً. <code>ABC</code> هو البديل — يُلزم الأبناء بتنفيذ الدوال المُعلَّمة بـ<code>@abstractmethod</code>.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — OOP في Python</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">class Dog:<br>    tricks = []  # مشترك!<br>    def add(self, t): self.tricks.append(t)</span></div>
          <div class="error-note">القائمة Class Variable — مشتركة بين جميع Objects</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">def __init__(self):<br>    self.tricks = []  # خاص بكل Object</span></div>
          <div class="error-note">عرّف القوائم داخل __init__</div>
        </div>
      </div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">def greet(name): return f"مرحبا {name}"</span></div>
          <div class="error-note">نسيان self — TypeError</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">def greet(self, name): return f"مرحبا {name}"</span></div>
          <div class="error-note">self أول معامل دائماً في دوال الكلاس</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — OOP في Python</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">class Car:</code><code class="quiz-hint-chip" onclick="insertHint(this)">def __init__(self, brand):</code><code class="quiz-hint-chip" onclick="insertHint(this)">self.brand = brand</code><code class="quiz-hint-chip" onclick="insertHint(this)">class Dog(Animal):</code><code class="quiz-hint-chip" onclick="insertHint(this)">def speak(self):</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('oop-python', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
      
    

    <!-- ═══════════════════════ JAVASCRIPT ═══════════════════════ -->
    <div class="topic-section" id="oop-js">
      <div class="section-title">OOP في JavaScript</div>
      <div class="lang-grid">

        <div class="lang-card js">
          <div class="lang-header">Class &amp; Object</div>
<pre><span class="cm">// تعريف كلاس يمثّل سيارة</span>
<span class="kw">class</span> <span class="fn">Car</span> {
    <span class="cm">// constructor يُستدعى تلقائياً عند new Car()</span>
    <span class="fn">constructor</span>(brand, year) {
        <span class="kw">this</span>.brand = brand;  <span class="cm">// this يُشير للكائن الحالي</span>
        <span class="kw">this</span>.year  = year;   <span class="cm">// تعيين سنة الصنع</span>
    }

    <span class="cm">// دالة عادية (Method) تطبع المعلومات</span>
    <span class="fn">info</span>() {
        console.<span class="fn">log</span>(<span class="str">`${this.brand} (${this.year})`</span>); <span class="cm">// Template Literal</span>
    }

    <span class="cm">// static = دالة على الكلاس لا الكائن</span>
    <span class="kw">static</span> <span class="fn">compare</span>(a, b) {
        <span class="kw">return</span> a.year - b.year;   <span class="cm">// مقارنة بالسنة للترتيب</span>
    }
}

<span class="kw">const</span> c = <span class="kw">new</span> <span class="fn">Car</span>(<span class="str">"تويوتا"</span>, <span class="num">2023</span>);  <span class="cm">// إنشاء Object</span>
c.<span class="fn">info</span>();                            <span class="cm">// تويوتا (2023)</span>
<span class="fn">Car</span>.<span class="fn">compare</span>(c, <span class="kw">new</span> <span class="fn">Car</span>(<span class="str">"هوندا"</span>, <span class="num">2020</span>)); <span class="cm">// static — على الكلاس مباشرة</span></pre>
          <div class="lang-desc">Classes في JS مظهر جميل فوق نظام Prototype — تعمل بنفس الأساس لكن الصياغة أوضح وأقرب لـ Java و#C.</div>
        </div>

        <div class="lang-card js">
          <div class="lang-header">Encapsulation — التغليف</div>
<pre><span class="kw">class</span> <span class="fn">BankAccount</span> {
    #balance;                              <span class="cm">// # = private field (ES2022)</span>
    #owner;                                <span class="cm">// حقل خاص آخر</span>

    <span class="fn">constructor</span>(owner, initial) {
        <span class="kw">this</span>.#owner   = owner;             <span class="cm">// تعيين المالك</span>
        <span class="kw">this</span>.#balance = initial;           <span class="cm">// تعيين الرصيد الأولي</span>
    }

    <span class="cm">// getter — يسمح بقراءة الرصيد فقط</span>
    <span class="kw">get</span> <span class="fn">balance</span>() {
        <span class="kw">return</span> <span class="kw">this</span>.#balance;              <span class="cm">// إرجاع الرصيد</span>
    }

    <span class="fn">deposit</span>(amount) {
        <span class="kw">if</span> (amount &gt; <span class="num">0</span>)                   <span class="cm">// تحقق: مبلغ موجب</span>
            <span class="kw">this</span>.#balance += amount;       <span class="cm">// إضافة المبلغ</span>
    }

    <span class="fn">withdraw</span>(amount) {
        <span class="kw">if</span> (amount &lt;= <span class="kw">this</span>.#balance)      <span class="cm">// تحقق: كافٍ الرصيد</span>
            <span class="kw">this</span>.#balance -= amount;       <span class="cm">// خصم المبلغ</span>
    }
}

<span class="kw">const</span> acc = <span class="kw">new</span> <span class="fn">BankAccount</span>(<span class="str">"علي"</span>, <span class="num">1000</span>); <span class="cm">// رصيد أولي 1000</span>
acc.<span class="fn">deposit</span>(<span class="num">500</span>);                           <span class="cm">// إضافة 500</span>
console.<span class="fn">log</span>(acc.balance);                  <span class="cm">// 1500 — عبر getter</span>
<span class="cm">// acc.#balance ← خطأ! لا وصول مباشر لـ private</span></pre>
          <div class="lang-desc"><code>#</code> يُنشئ متغيراً خاصاً حقيقياً — أي محاولة وصول من خارج الكلاس تُوقف البرنامج بـ SyntaxError.</div>
        </div>

        <div class="lang-card js">
          <div class="lang-header">Inheritance — الوراثة</div>
<pre><span class="cm">// الكلاس الأب</span>
<span class="kw">class</span> <span class="fn">Animal</span> {
    <span class="fn">constructor</span>(name) {
        <span class="kw">this</span>.name = name;        <span class="cm">// اسم الحيوان</span>
    }
    <span class="fn">speak</span>() {
        console.<span class="fn">log</span>(<span class="str">"صوت عام"</span>); <span class="cm">// سلوك افتراضي</span>
    }
    <span class="fn">describe</span>() {
        console.<span class="fn">log</span>(<span class="str">`أنا ${this.name}`</span>); <span class="cm">// دالة مشتركة</span>
    }
}

<span class="cm">// Dog يرث كل شيء من Animal</span>
<span class="kw">class</span> <span class="fn">Dog</span> <span class="kw">extends</span> <span class="fn">Animal</span> {
    <span class="fn">constructor</span>(name, breed) {
        <span class="kw">super</span>(name);             <span class="cm">// super() إلزامي قبل استخدام this</span>
        <span class="kw">this</span>.breed = breed;      <span class="cm">// خاصية إضافية خاصة بالكلب</span>
    }
    <span class="fn">speak</span>() {                   <span class="cm">// Override دالة الأب</span>
        console.<span class="fn">log</span>(<span class="str">`${this.name}: هاو! 🐕`</span>); <span class="cm">// سلوك الكلب</span>
    }
}

<span class="kw">const</span> d = <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>, <span class="str">"هاسكي"</span>); <span class="cm">// إنشاء كلب</span>
d.<span class="fn">speak</span>();                              <span class="cm">// ريكو: هاو! 🐕</span>
d.<span class="fn">describe</span>();                           <span class="cm">// أنا ريكو — موروثة</span>
console.<span class="fn">log</span>(d <span class="kw">instanceof</span> Animal);      <span class="cm">// true</span></pre>
          <div class="lang-desc"><code>super()</code> في Constructor إلزامي قبل استخدام <code>this</code> — بدونه ReferenceError. يستدعي Constructor الأب.</div>
        </div>

        <div class="lang-card js">
          <div class="lang-header">Polymorphism — تعدد الأشكال</div>
<pre><span class="cm">// مصفوفة تحتوي أنواعاً مختلفة</span>
<span class="kw">const</span> animals = [
    <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>, <span class="str">"هاسكي"</span>),  <span class="cm">// كلب</span>
    <span class="kw">new</span> <span class="fn">Cat</span>(<span class="str">"كيتي"</span>),            <span class="cm">// قطة</span>
    <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"مكس"</span>, <span class="str">"لابرادور"</span>) <span class="cm">// كلب آخر</span>
];

<span class="cm">// forEach — نفس الكود يعمل مع كل الأنواع</span>
animals.<span class="fn">forEach</span>(a =&gt; a.<span class="fn">speak</span>()); <span class="cm">// كل كائن ينفّذ speak() بطريقته</span>

<span class="cm">// تصفية نوع معين</span>
<span class="kw">const</span> dogs = animals.<span class="fn">filter</span>(a =&gt; a <span class="kw">instanceof</span> Dog); <span class="cm">// الكلاب فقط</span>
console.<span class="fn">log</span>(<span class="str">`عدد الكلاب: ${dogs.length}`</span>);         <span class="cm">// 2</span></pre>
          <div class="lang-desc">JS لا تملك Interface رسمياً — يمكن محاكاته بالاتفاقية، أو استخدام TypeScript الذي يضيف Interface حقيقي.</div>
        </div>

        <div class="lang-card js">
          <div class="lang-header">Abstraction — محاكاة بالاتفاقية</div>
<pre><span class="cm">// JS لا تملك Interface رسمي — نحاكيه بالاتفاقية</span>
<span class="kw">class</span> <span class="fn">Shape</span> {
    <span class="fn">area</span>() {
        <span class="kw">throw new</span> Error(<span class="str">"يجب تنفيذ area()"</span>); <span class="cm">// إلزام يدوي</span>
    }
    <span class="fn">perimeter</span>() {
        <span class="kw">throw new</span> Error(<span class="str">"يجب تنفيذ perimeter()"</span>);
    }
}

<span class="kw">class</span> <span class="fn">Circle</span> <span class="kw">extends</span> <span class="fn">Shape</span> {
    <span class="fn">constructor</span>(r) { <span class="kw">super</span>(); <span class="kw">this</span>.r = r; }
    <span class="fn">area</span>()      { <span class="kw">return</span> Math.PI * <span class="kw">this</span>.r ** <span class="num">2</span>; }
    <span class="fn">perimeter</span>() { <span class="kw">return</span> <span class="num">2</span> * Math.PI * <span class="kw">this</span>.r; }
}

<span class="kw">const</span> c = <span class="kw">new</span> <span class="fn">Circle</span>(<span class="num">5</span>);
console.<span class="fn">log</span>(c.<span class="fn">area</span>().<span class="fn">toFixed</span>(<span class="num">2</span>)); <span class="cm">// 78.54</span>
<span class="cm">// TypeScript يوفر Interface حقيقي</span></pre>
          <div class="lang-desc">البديل العملي للـ Interface في JS: <code>throw Error</code> في الدالة الأساسية — يُجبر الأبناء على إعادة كتابتها وإلا يتوقف البرنامج.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — OOP في JavaScript</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">class Dog extends Animal {<br>    constructor(name) {<br>        this.name = name; } }</span></div>
          <div class="error-note">ReferenceError — super() مطلوب قبل this</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">constructor(name) {<br>    super(name);<br>    this.name = name; }</span></div>
          <div class="error-note">super() أول شيء في constructor الابن</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — OOP في JavaScript</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">class Car</code><code class="quiz-hint-chip" onclick="insertHint(this)">constructor(brand)</code><code class="quiz-hint-chip" onclick="insertHint(this)">#brand = "";</code><code class="quiz-hint-chip" onclick="insertHint(this)">class Dog extends Animal</code><code class="quiz-hint-chip" onclick="insertHint(this)">get brand() { return this.#brand; }</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('oop-js', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <!-- ═══════════════════════ ++C ═══════════════════════ -->
    <div class="topic-section" id="oop-cpp">
      <div class="section-title">OOP في ++C</div>
      <div class="lang-grid">

        <div class="lang-card cpp">
          <div class="lang-header">Class &amp; Object</div>
<pre><span class="cm">// تعريف كلاس يمثّل سيارة</span>
<span class="kw">class</span> <span class="fn">Car</span> {
<span class="kw">public</span>:                              <span class="cm">// public: كل ما بعده يُرى من الخارج</span>
    std::string brand;               <span class="cm">// اسم الماركة</span>
    <span class="kw">int</span> year;                        <span class="cm">// سنة الصنع</span>

    <span class="cm">// Constructor — نفس اسم الكلاس بدون return type</span>
    <span class="fn">Car</span>(std::string brand, <span class="kw">int</span> year)
        : brand(brand), year(year) {} <span class="cm">// Initializer List — أسرع من التعيين</span>

    <span class="cm">// const بعد () تعني الدالة لا تُعدّل الكائن</span>
    <span class="kw">void</span> <span class="fn">info</span>() <span class="kw">const</span> {
        std::cout &lt;&lt; brand &lt;&lt; <span class="str">" ("</span> &lt;&lt; year &lt;&lt; <span class="str">")\n"</span>; <span class="cm">// طباعة المعلومات</span>
    }
};

<span class="fn">Car</span> c(<span class="str">"تويوتا"</span>, <span class="num">2023</span>);   <span class="cm">// إنشاء Object على Stack (بدون new)</span>
c.<span class="fn">info</span>();                 <span class="cm">// تويوتا (2023)</span>

<span class="fn">Car</span>* p = <span class="kw">new</span> <span class="fn">Car</span>(<span class="str">"هوندا"</span>, <span class="num">2022</span>); <span class="cm">// Object على Heap (مع new)</span>
p-&gt;<span class="fn">info</span>();                         <span class="cm">// -> للوصول عبر Pointer</span>
<span class="kw">delete</span> p;                           <span class="cm">// إلزامي: تحرير الذاكرة يدوياً</span></pre>
          <div class="lang-desc">في ++C يمكن إنشاء Objects على Stack (سريع، يُحذف تلقائياً) أو Heap بـ<code>new</code> (مرن، يجب حذفه بـ<code>delete</code>).</div>
        </div>

        <div class="lang-card cpp">
          <div class="lang-header">Encapsulation — التغليف</div>
<pre><span class="kw">class</span> <span class="fn">BankAccount</span> {
<span class="kw">private</span>:                                 <span class="cm">// private: لا يُرى من الخارج</span>
    <span class="kw">double</span> balance;                       <span class="cm">// الرصيد — محمي</span>

<span class="kw">public</span>:                                  <span class="cm">// public: الواجهة للخارج</span>
    <span class="fn">BankAccount</span>(<span class="kw">double</span> initial)
        : balance(initial) {}            <span class="cm">// Initializer List للرصيد</span>

    <span class="cm">// Getter — const لأنه لا يُعدّل الكائن</span>
    <span class="kw">double</span> <span class="fn">getBalance</span>() <span class="kw">const</span> { <span class="kw">return</span> balance; }

    <span class="kw">void</span> <span class="fn">deposit</span>(<span class="kw">double</span> amount) {
        <span class="kw">if</span> (amount &gt; <span class="num">0</span>)                   <span class="cm">// تحقق: مبلغ موجب</span>
            balance += amount;            <span class="cm">// إضافة للرصيد</span>
    }

    <span class="kw">void</span> <span class="fn">withdraw</span>(<span class="kw">double</span> amount) {
        <span class="kw">if</span> (amount &lt;= balance)            <span class="cm">// تحقق: رصيد كافٍ</span>
            balance -= amount;            <span class="cm">// خصم من الرصيد</span>
    }
};

<span class="fn">BankAccount</span> acc(<span class="num">1000.0</span>);              <span class="cm">// رصيد أولي 1000</span>
acc.<span class="fn">deposit</span>(<span class="num">500.0</span>);                    <span class="cm">// إضافة 500</span>
std::cout &lt;&lt; acc.<span class="fn">getBalance</span>();        <span class="cm">// 1500</span></pre>
          <div class="lang-desc">في ++C كل شيء <code>private</code> بشكل افتراضي في <code>class</code>، و<code>public</code> في <code>struct</code>.</div>
        </div>

        <div class="lang-card cpp">
          <div class="lang-header">Inheritance — الوراثة</div>
<pre><span class="cm">// الكلاس الأب</span>
<span class="kw">class</span> <span class="fn">Animal</span> {
<span class="kw">public</span>:
    std::string name;                    <span class="cm">// اسم الحيوان</span>
    <span class="fn">Animal</span>(std::string n) : name(n) {}  <span class="cm">// Constructor الأب</span>

    <span class="cm">// virtual = يسمح للكلاسات الوارثة بتعديله (Polymorphism)</span>
    <span class="kw">virtual void</span> <span class="fn">speak</span>() {
        std::cout &lt;&lt; <span class="str">"صوت عام\n"</span>;       <span class="cm">// سلوك افتراضي</span>
    }

    <span class="cm">// Virtual Destructor — ضروري عند استخدام Pointers</span>
    <span class="kw">virtual</span> ~<span class="fn">Animal</span>() {}
};

<span class="cm">// public Animal = وراثة عامة (الأكثر شيوعاً)</span>
<span class="kw">class</span> <span class="fn">Dog</span> : <span class="kw">public</span> <span class="fn">Animal</span> {
<span class="kw">public</span>:
    <span class="fn">Dog</span>(std::string n) : <span class="fn">Animal</span>(n) {}  <span class="cm">// تمرير الاسم لـ Constructor الأب</span>

    <span class="kw">void</span> <span class="fn">speak</span>() <span class="kw">override</span> {             <span class="cm">// override يؤكد إعادة الكتابة</span>
        std::cout &lt;&lt; name &lt;&lt; <span class="str">": هاو! 🐕\n"</span>; <span class="cm">// سلوك الكلب</span>
    }
};

<span class="fn">Dog</span> d(<span class="str">"ريكو"</span>);    <span class="cm">// إنشاء Dog على Stack</span>
d.<span class="fn">speak</span>();        <span class="cm">// ريكو: هاو! 🐕</span></pre>
          <div class="lang-desc"><code>virtual</code> ضروري للـ Polymorphism في ++C — بدونه تُستدعى دالة الأب دائماً حتى مع Pointer على الابن.</div>
        </div>

        <div class="lang-card cpp">
          <div class="lang-header">Polymorphism — تعدد الأشكال</div>
<pre><span class="cm">// vector من Pointers للكلاس الأب</span>
std::vector&lt;Animal*&gt; animals;         <span class="cm">// مجموعة حيوانات من أنواع مختلفة</span>
animals.<span class="fn">push_back</span>(<span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>));   <span class="cm">// إضافة كلب</span>
animals.<span class="fn">push_back</span>(<span class="kw">new</span> <span class="fn">Cat</span>(<span class="str">"كيتي"</span>));  <span class="cm">// إضافة قطة</span>
animals.<span class="fn">push_back</span>(<span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"مكس"</span>));   <span class="cm">// إضافة كلب آخر</span>

<span class="cm">// نفس الكود يعمل مع كل الأنواع بفضل virtual</span>
<span class="kw">for</span> (Animal* a : animals) {
    a-&gt;<span class="fn">speak</span>();                        <span class="cm">// Dynamic Dispatch يختار التنفيذ الصحيح</span>
}

<span class="cm">// dynamic_cast للتحقق من النوع الفعلي</span>
<span class="kw">if</span> (<span class="fn">Dog</span>* d = <span class="kw">dynamic_cast</span>&lt;Dog*&gt;(animals[<span class="num">0</span>])) {
    std::cout &lt;&lt; d-&gt;name &lt;&lt; <span class="str">" هو كلب!\n"</span>; <span class="cm">// نجح الـ cast</span>
}

<span class="cm">// تحرير الذاكرة — إلزامي في ++C</span>
<span class="kw">for</span> (Animal* a : animals) <span class="kw">delete</span> a;  <span class="cm">// تجنب Memory Leak</span></pre>
          <div class="lang-desc">Polymorphism في ++C يعمل فقط عبر Pointers أو References — بدونها لا يحدث Dynamic Dispatch.</div>
        </div>

        <div class="lang-card cpp">
          <div class="lang-header">Abstraction — Abstract Class (Pure Virtual)</div>
<pre><span class="cm">// Abstract Class — يحتوي على دالة Pure Virtual</span>
<span class="kw">class</span> <span class="fn">Shape</span> {
<span class="kw">public</span>:
    <span class="cm">// = 0 تعني Pure Virtual — لا يمكن إنشاء Shape مباشرة</span>
    <span class="kw">virtual double</span> <span class="fn">area</span>()      <span class="kw">const</span> = <span class="num">0</span>; <span class="cm">// يجب تنفيذها في الوارث</span>
    <span class="kw">virtual double</span> <span class="fn">perimeter</span>() <span class="kw">const</span> = <span class="num">0</span>; <span class="cm">// يجب تنفيذها في الوارث</span>
    <span class="kw">virtual</span> ~<span class="fn">Shape</span>() {}                    <span class="cm">// Virtual Destructor ضروري</span>
};

<span class="kw">class</span> <span class="fn">Circle</span> : <span class="kw">public</span> <span class="fn">Shape</span> {
    <span class="kw">double</span> r;                              <span class="cm">// نصف القطر</span>
<span class="kw">public</span>:
    <span class="fn">Circle</span>(<span class="kw">double</span> r) : r(r) {}            <span class="cm">// تهيئة نصف القطر</span>
    <span class="kw">double</span> <span class="fn">area</span>()      <span class="kw">const override</span> { <span class="kw">return</span> M_PI * r * r; } <span class="cm">// π r²</span>
    <span class="kw">double</span> <span class="fn">perimeter</span>() <span class="kw">const override</span> { <span class="kw">return</span> <span class="num">2</span> * M_PI * r; } <span class="cm">// 2πr</span>
};

<span class="fn">Shape</span>* s = <span class="kw">new</span> <span class="fn">Circle</span>(<span class="num">5.0</span>);            <span class="cm">// Pointer على Shape</span>
std::printf(<span class="str">"المساحة: %.2f\n"</span>, s-&gt;<span class="fn">area</span>()); <span class="cm">// 78.54</span>
<span class="kw">delete</span> s;                               <span class="cm">// تحرير الذاكرة</span>
<span class="cm">// Shape sh; ← خطأ في الترجمة!</span></pre>
          <div class="lang-desc">++C لا تملك Abstract Class كمفهوم مستقل — أي كلاس يملك دالة Pure Virtual <code>= 0</code> يصبح Abstract تلقائياً.</div>
        </div>

        <div class="lang-card cpp">
          <div class="lang-header">Abstraction — Interface (محاكاة)</div>
<pre><span class="cm">// Interface في ++C = Abstract Class بكل دوالها Pure Virtual</span>
<span class="kw">class</span> <span class="fn">IShape</span> {
<span class="kw">public</span>:
    <span class="kw">virtual double</span> <span class="fn">area</span>()      <span class="kw">const</span> = <span class="num">0</span>;
    <span class="kw">virtual double</span> <span class="fn">perimeter</span>() <span class="kw">const</span> = <span class="num">0</span>;
    <span class="kw">virtual</span> ~<span class="fn">IShape</span>() {}
};

<span class="kw">class</span> <span class="fn">Rectangle</span> : <span class="kw">public</span> <span class="fn">IShape</span> {
    <span class="kw">double</span> w, h;
<span class="kw">public</span>:
    <span class="fn">Rectangle</span>(<span class="kw">double</span> w, <span class="kw">double</span> h) : w(w), h(h) {}
    <span class="kw">double</span> <span class="fn">area</span>()      <span class="kw">const override</span> { <span class="kw">return</span> w * h; }
    <span class="kw">double</span> <span class="fn">perimeter</span>() <span class="kw">const override</span> { <span class="kw">return</span> <span class="num">2</span>*(w+h); }
};

<span class="fn">IShape</span>* s = <span class="kw">new</span> <span class="fn">Rectangle</span>(<span class="num">4</span>,<span class="num">6</span>);
std::printf(<span class="str">"%.2f
"</span>, s-&gt;<span class="fn">area</span>()); <span class="cm">// 24.00</span>
<span class="kw">delete</span> s;</pre>
          <div class="lang-desc">Interface في ++C عبارة عن Abstract Class كل دوالها Pure Virtual. الاتفاقية هي وضع <code>I</code> في بداية الاسم للتمييز.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — OOP في ++C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">class Animal {<br>    ~Animal() {}  // غير virtual<br>};</span></div>
          <div class="error-note">Memory leak مع Polymorphism — Destructor الابن لا يُستدعى</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">virtual ~Animal() {}</span></div>
          <div class="error-note">Destructor يجب أن يكون virtual في الكلاسات الأساسية</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — OOP في C++</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">class Car {</code><code class="quiz-hint-chip" onclick="insertHint(this)">private:</code><code class="quiz-hint-chip" onclick="insertHint(this)">public:</code><code class="quiz-hint-chip" onclick="insertHint(this)">Car(string brand)</code><code class="quiz-hint-chip" onclick="insertHint(this)">class Dog : public Animal</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('oop-cpp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <!-- ═══════════════════════ #C ═══════════════════════ -->
    <div class="topic-section" id="oop-csharp">
      <div class="section-title">OOP في #C</div>
      <div class="lang-grid">

        <div class="lang-card csharp">
          <div class="lang-header">Class &amp; Object</div>
<pre><span class="cm">// تعريف كلاس يمثّل سيارة</span>
<span class="kw">class</span> <span class="fn">Car</span> {
    <span class="kw">public string</span> Brand { <span class="kw">get</span>; <span class="kw">set</span>; }  <span class="cm">// Auto-Property — اختصار Get/Set</span>
    <span class="kw">public int</span>    Year  { <span class="kw">get</span>; <span class="kw">set</span>; }  <span class="cm">// Auto-Property للسنة</span>

    <span class="cm">// Constructor — نفس اسم الكلاس</span>
    <span class="kw">public</span> <span class="fn">Car</span>(<span class="kw">string</span> brand, <span class="kw">int</span> year) {
        Brand = brand;                    <span class="cm">// تعيين قيمة الخاصية</span>
        Year  = year;                     <span class="cm">// تعيين السنة</span>
    }

    <span class="cm">// Expression-bodied method — اختصار لدوال </span>
    <span class="kw">public void</span> <span class="fn">Info</span>() =&gt;
        Console.<span class="fn">WriteLine</span>(<span class="str">$"{Brand} ({Year})"</span>); <span class="cm">// f-string style بـ $</span>

    <span class="cm">// ToString تُحدد كيف يظهر الكائن عند الطباعة</span>
    <span class="kw">public override string</span> <span class="fn">ToString</span>() =&gt; <span class="str">$"Car: {Brand}"</span>;
}

<span class="fn">Car</span> c = <span class="kw">new</span> <span class="fn">Car</span>(<span class="str">"تويوتا"</span>, <span class="num">2023</span>);  <span class="cm">// إنشاء Object</span>
c.<span class="fn">Info</span>();                           <span class="cm">// تويوتا (2023)</span>
Console.<span class="fn">WriteLine</span>(c);               <span class="cm">// Car: تويوتا — عبر ToString</span></pre>
          <div class="lang-desc">#C تدعم Auto-Properties: <code>{ get; set; }</code> بدلاً من تعريف متغير خاص وGetters/Setters — كود أنظف وأقصر.</div>
        </div>

        <div class="lang-card csharp">
          <div class="lang-header">Encapsulation — التغليف</div>
<pre><span class="kw">class</span> <span class="fn">BankAccount</span> {
    <span class="kw">private double</span> _balance;              <span class="cm">// _ اتفاقية لتسمية Private Fields</span>

    <span class="kw">public</span> <span class="fn">BankAccount</span>(<span class="kw">double</span> initial) {
        _balance = initial;               <span class="cm">// تعيين الرصيد الأولي</span>
    }

    <span class="cm">// Property مع منطق تحقق مخصص</span>
    <span class="kw">public double</span> Balance {
        <span class="kw">get</span> =&gt; _balance;                  <span class="cm">// قراءة الرصيد</span>
        <span class="kw">private set</span> {                     <span class="cm">// الكتابة من داخل الكلاس فقط</span>
            <span class="kw">if</span> (value &gt;= <span class="num">0</span>) _balance = value; <span class="cm">// لا قيم سالبة</span>
        }
    }

    <span class="kw">public void</span> <span class="fn">Deposit</span>(<span class="kw">double</span> amount) {
        <span class="kw">if</span> (amount &gt; <span class="num">0</span>)                   <span class="cm">// تحقق: مبلغ موجب</span>
            Balance += amount;             <span class="cm">// إضافة عبر setter</span>
    }

    <span class="kw">public void</span> <span class="fn">Withdraw</span>(<span class="kw">double</span> amount) {
        <span class="kw">if</span> (amount &lt;= Balance)            <span class="cm">// تحقق: رصيد كافٍ</span>
            Balance -= amount;             <span class="cm">// خصم عبر setter</span>
    }
}

<span class="kw">var</span> acc = <span class="kw">new</span> <span class="fn">BankAccount</span>(<span class="num">1000</span>);     <span class="cm">// var يستنتج النوع تلقائياً</span>
acc.<span class="fn">Deposit</span>(<span class="num">500</span>);                      <span class="cm">// إضافة 500</span>
Console.<span class="fn">WriteLine</span>(acc.Balance);       <span class="cm">// 1500</span></pre>
          <div class="lang-desc">Properties في #C تبدو كمتغيرات عادية لكنها تُخفي منطقاً داخلها — أفضل من Getters/Setters الصريحة في Java.</div>
        </div>

        <div class="lang-card csharp">
          <div class="lang-header">Inheritance — الوراثة</div>
<pre><span class="cm">// الكلاس الأب</span>
<span class="kw">class</span> <span class="fn">Animal</span> {
    <span class="kw">public string</span> Name { <span class="kw">get</span>; }         <span class="cm">// get only — لا تعديل بعد الإنشاء</span>

    <span class="kw">public</span> <span class="fn">Animal</span>(<span class="kw">string</span> name) {
        Name = name;                      <span class="cm">// تعيين عند الإنشاء فقط</span>
    }

    <span class="cm">// virtual = يسمح للوارث بتعديله</span>
    <span class="kw">public virtual void</span> <span class="fn">Speak</span>() {
        Console.<span class="fn">WriteLine</span>(<span class="str">"صوت عام"</span>);  <span class="cm">// سلوك افتراضي</span>
    }
}

<span class="cm">// Dog : Animal = وراثة من Animal</span>
<span class="kw">class</span> <span class="fn">Dog</span> : <span class="fn">Animal</span> {
    <span class="kw">public</span> <span class="fn">Dog</span>(<span class="kw">string</span> name) : <span class="kw">base</span>(name) {} <span class="cm">// base() = super() في Java</span>

    <span class="kw">public override void</span> <span class="fn">Speak</span>() {       <span class="cm">// override إلزامية للـ virtual</span>
        Console.<span class="fn">WriteLine</span>(<span class="str">$"{Name}: هاو! 🐕"</span>); <span class="cm">// سلوك الكلب</span>
    }
}

<span class="kw">class</span> <span class="fn">Cat</span> : <span class="fn">Animal</span> {
    <span class="kw">public</span> <span class="fn">Cat</span>(<span class="kw">string</span> name) : <span class="kw">base</span>(name) {}
    <span class="kw">public override void</span> <span class="fn">Speak</span>() =&gt;
        Console.<span class="fn">WriteLine</span>(<span class="str">$"{Name}: مياو! 🐈"</span>); <span class="cm">// Expression Body</span>
}

<span class="fn">Dog</span> d = <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>); <span class="cm">// إنشاء Dog</span>
d.<span class="fn">Speak</span>();               <span class="cm">// ريكو: هاو! 🐕</span></pre>
          <div class="lang-desc"><code>virtual</code> على الأب و<code>override</code> على الابن — بدون <code>virtual</code> لا يمكن إعادة الكتابة في #C.</div>
        </div>

        <div class="lang-card csharp">
          <div class="lang-header">Polymorphism — تعدد الأشكال</div>
<pre><span class="cm">// List من النوع الأب</span>
<span class="kw">var</span> animals = <span class="kw">new</span> List&lt;Animal&gt; {
    <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>),    <span class="cm">// Dog مُخزَّن كـ Animal</span>
    <span class="kw">new</span> <span class="fn">Cat</span>(<span class="str">"كيتي"</span>),    <span class="cm">// Cat مُخزَّن كـ Animal</span>
    <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"مكس"</span>)     <span class="cm">// Dog آخر</span>
};

<span class="cm">// foreach — Dynamic Dispatch يختار التنفيذ الصحيح</span>
<span class="kw">foreach</span> (<span class="kw">var</span> a <span class="kw">in</span> animals) {
    a.<span class="fn">Speak</span>(); <span class="cm">// يستدعي Speak() الخاصة بكل نوع</span>
}

<span class="cm">// Pattern Matching — ميزة قوية في #C</span>
<span class="kw">foreach</span> (<span class="kw">var</span> a <span class="kw">in</span> animals) {
    <span class="kw">if</span> (a <span class="kw">is</span> Dog dog)              <span class="cm">// فحص النوع وتحويل في خطوة واحدة</span>
        Console.<span class="fn">WriteLine</span>(<span class="str">$"{dog.Name} كلب"</span>); <span class="cm">// وصول مباشر لـ dog</span>
}</pre>
          <div class="lang-desc">Pattern Matching في #C يجمع التحقق من النوع والتحويل في سطر واحد — أنظف وأقصر من Java التقليدية.</div>
        </div>

        <div class="lang-card csharp">
          <div class="lang-header">Abstraction — Interface و Abstract Class</div>
<pre><span class="cm">// Interface — العقد الكامل</span>
<span class="kw">interface</span> <span class="fn">IShape</span> {                       <span class="cm">// I اتفاقية تسمية Interfaces في #C</span>
    <span class="kw">double</span> <span class="fn">Area</span>();                        <span class="cm">// كل شكل يجب أن يحسب مساحته</span>
    <span class="kw">double</span> <span class="fn">Perimeter</span>();                   <span class="cm">// كل شكل يجب أن يحسب محيطه</span>
}

<span class="cm">// Abstract Class — قالب جزئي مع تنفيذ مشترك</span>
<span class="kw">abstract class</span> <span class="fn">Shape</span> : <span class="fn">IShape</span> {
    <span class="kw">public string</span> Color { <span class="kw">get</span>; <span class="kw">set</span>; }   <span class="cm">// خاصية مشتركة لكل الأشكال</span>
    <span class="kw">public abstract double</span> <span class="fn">Area</span>();      <span class="cm">// abstract = يجب تنفيذها في الوارث</span>
    <span class="kw">public abstract double</span> <span class="fn">Perimeter</span>(); <span class="cm">// abstract أيضاً</span>

    <span class="kw">public void</span> <span class="fn">Describe</span>() =&gt;          <span class="cm">// دالة عادية مشتركة</span>
        Console.<span class="fn">WriteLine</span>(<span class="str">$"مساحة: {Area():F2}"</span>); <span class="cm">// F2 = منزلتان عشريتان</span>
}

<span class="kw">class</span> <span class="fn">Circle</span> : <span class="fn">Shape</span> {
    <span class="kw">double</span> r;                             <span class="cm">// نصف القطر</span>
    <span class="kw">public</span> <span class="fn">Circle</span>(<span class="kw">double</span> r) =&gt; <span class="kw">this</span>.r = r; <span class="cm">// Constructor موجز</span>
    <span class="kw">public override double</span> <span class="fn">Area</span>()      =&gt; Math.PI * r * r; <span class="cm">// π r²</span>
    <span class="kw">public override double</span> <span class="fn">Perimeter</span>() =&gt; <span class="num">2</span> * Math.PI * r; <span class="cm">// 2πr</span>
}

<span class="fn">Shape</span> s = <span class="kw">new</span> <span class="fn">Circle</span>(<span class="num">5</span>);              <span class="cm">// Polymorphism</span>
s.<span class="fn">Describe</span>();                          <span class="cm">// مساحة: 78.54</span></pre>
          <div class="lang-desc">الفرق: <code>interface</code> للعقد الخالص بدون تنفيذ. <code>abstract class</code> لتنفيذ جزئي مع ترك التفاصيل للأبناء.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — OOP في #C</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">class Dog : Animal {<br>    public void Speak() { ... } }</span></div>
          <div class="error-note">يُخفي دالة الأب بدون Polymorphism</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">public override void Speak() { ... }</span></div>
          <div class="error-note">override إلزامي لـ Polymorphism الحقيقي</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — OOP في C#</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">public class Car</code><code class="quiz-hint-chip" onclick="insertHint(this)">private string brand;</code><code class="quiz-hint-chip" onclick="insertHint(this)">public string Brand { get; set; }</code><code class="quiz-hint-chip" onclick="insertHint(this)">class Dog : Animal</code><code class="quiz-hint-chip" onclick="insertHint(this)">public override void Speak()</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('oop-csharp', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    

    <!-- ═══════════════════════ KOTLIN ═══════════════════════ -->
    <div class="topic-section" id="oop-kotlin">
      <div class="section-title">OOP في Kotlin</div>
      <div class="lang-grid">

        <div class="lang-card kotlin">
          <div class="lang-header">Class &amp; Object</div>
<pre><span class="cm">// Primary Constructor مباشر في سطر التعريف</span>
<span class="kw">class</span> <span class="fn">Car</span>(<span class="kw">val</span> brand: String, <span class="kw">val</span> year: Int) {
    <span class="cm">// init يعمل كـ Constructor body</span>
    init {
        <span class="fn">println</span>(<span class="str">"تم إنشاء سيارة: $brand"</span>) <span class="cm">// يُنفَّذ عند كل إنشاء</span>
    }

    <span class="cm">// fun = تعريف دالة في Kotlin</span>
    <span class="kw">fun</span> <span class="fn">info</span>() = <span class="fn">println</span>(<span class="str">"$brand ($year)"</span>) <span class="cm">// Expression Body</span>
}

<span class="cm">// data class — للبيانات الخالصة</span>
<span class="kw">data class</span> <span class="fn">Student</span>(
    <span class="kw">val</span> name: String,   <span class="cm">// val = قيمة لا تتغير (immutable)</span>
    <span class="kw">val</span> gpa: Double     <span class="cm">// تلقائياً: toString/equals/hashCode/copy</span>
)

<span class="kw">val</span> c = <span class="fn">Car</span>(<span class="str">"تويوتا"</span>, <span class="num">2023</span>)  <span class="cm">// إنشاء Car — بدون new</span>
c.<span class="fn">info</span>()                      <span class="cm">// تويوتا (2023)</span>

<span class="kw">val</span> s  = <span class="fn">Student</span>(<span class="str">"علي"</span>, <span class="num">3.8</span>)  <span class="cm">// إنشاء Student</span>
<span class="fn">println</span>(s)                    <span class="cm">// Student(name=علي, gpa=3.8) — تلقائي</span>
<span class="kw">val</span> s2 = s.<span class="fn">copy</span>(name=<span class="str">"نورة"</span>)  <span class="cm">// نسخة معدّلة بدون تغيير الأصل</span></pre>
          <div class="lang-desc"><code>data class</code> تُولّد تلقائياً: <code>toString()</code>، <code>equals()</code>، <code>hashCode()</code>، <code>copy()</code> — لا حاجة لكتابتها يدوياً.</div>
        </div>

        <div class="lang-card kotlin">
          <div class="lang-header">Encapsulation — التغليف</div>
<pre><span class="kw">class</span> <span class="fn">BankAccount</span>(initial: Double) {
    <span class="cm">// private set = يُقرأ من الخارج لكن يُكتَب من الداخل فقط</span>
    <span class="kw">var</span> balance: Double = initial
        <span class="kw">private set</span>                        <span class="cm">// تقييد الكتابة للداخل</span>

    <span class="cm">// backing field عبر get/set مخصصَين</span>
    <span class="kw">private var</span> _owner: String = <span class="str">"عميل"</span> <span class="cm">// متغير خاص داخلي</span>
    <span class="kw">val</span> owner: String                     <span class="cm">// خاصية قراءة فقط</span>
        <span class="kw">get</span>() = _owner.uppercase()        <span class="cm">// getter مخصص يُحوّل للحروف الكبيرة</span>

    <span class="kw">fun</span> <span class="fn">deposit</span>(amount: Double) {
        <span class="kw">if</span> (amount &gt; <span class="num">0</span>) balance += amount  <span class="cm">// تحقق ثم إضافة</span>
    }

    <span class="kw">fun</span> <span class="fn">withdraw</span>(amount: Double) {
        <span class="kw">if</span> (amount &lt;= balance) balance -= amount <span class="cm">// تحقق ثم خصم</span>
    }

    <span class="cm">// override toString مثل Java</span>
    <span class="kw">override fun</span> <span class="fn">toString</span>() = <span class="str">"رصيد: $balance"</span>
}

<span class="kw">val</span> acc = <span class="fn">BankAccount</span>(<span class="num">1000.0</span>)  <span class="cm">// رصيد أولي</span>
acc.<span class="fn">deposit</span>(<span class="num">500.0</span>)              <span class="cm">// إضافة 500</span>
<span class="fn">println</span>(acc.balance)            <span class="cm">// 1500.0</span>
<span class="cm">// acc.balance = 0 ← خطأ! private set</span></pre>
          <div class="lang-desc"><code>private set</code> يجعل القراءة عامة والكتابة خاصة في نفس الوقت — أنيق وصريح بدون الحاجة لـ Getters/Setters منفصلة.</div>
        </div>

        <div class="lang-card kotlin">
          <div class="lang-header">Inheritance — الوراثة</div>
<pre><span class="cm">// open = قابلة للوراثة (الكلاسات final افتراضياً)</span>
<span class="kw">open class</span> <span class="fn">Animal</span>(<span class="kw">val</span> name: String) {
    <span class="cm">// open fun = يمكن تعديلها في الوارث</span>
    <span class="kw">open fun</span> <span class="fn">speak</span>() = <span class="fn">println</span>(<span class="str">"صوت عام"</span>) <span class="cm">// سلوك افتراضي</span>

    <span class="kw">fun</span> <span class="fn">describe</span>() = <span class="fn">println</span>(<span class="str">"أنا $name"</span>)  <span class="cm">// دالة نهائية — لا override</span>
}

<span class="cm">// Dog يرث Animal — يمرر name للـ Primary Constructor</span>
<span class="kw">class</span> <span class="fn">Dog</span>(name: String) : <span class="fn">Animal</span>(name) {
    <span class="kw">override fun</span> <span class="fn">speak</span>() =               <span class="cm">// override إلزامية</span>
        <span class="fn">println</span>(<span class="str">"$name: هاو! 🐕"</span>)        <span class="cm">// سلوك الكلب</span>
}

<span class="kw">class</span> <span class="fn">Cat</span>(name: String) : <span class="fn">Animal</span>(name) {
    <span class="kw">override fun</span> <span class="fn">speak</span>() =
        <span class="fn">println</span>(<span class="str">"$name: مياو! 🐈"</span>)        <span class="cm">// سلوك القطة</span>
}

<span class="kw">val</span> d = <span class="fn">Dog</span>(<span class="str">"ريكو"</span>)   <span class="cm">// إنشاء Dog — بدون new</span>
d.<span class="fn">speak</span>()              <span class="cm">// ريكو: هاو! 🐕</span>
d.<span class="fn">describe</span>()           <span class="cm">// أنا ريكو — موروثة من Animal</span></pre>
          <div class="lang-desc">في Kotlin كل الكلاسات <code>final</code> بشكل افتراضي — يجب إضافة <code>open</code> صراحةً للسماح بالوراثة منها.</div>
        </div>

        <div class="lang-card kotlin">
          <div class="lang-header">Polymorphism — تعدد الأشكال</div>
<pre><span class="cm">// List من النوع الأب</span>
<span class="kw">val</span> animals: List&lt;Animal&gt; = listOf(
    <span class="fn">Dog</span>(<span class="str">"ريكو"</span>),   <span class="cm">// Dog مُخزَّن كـ Animal</span>
    <span class="fn">Cat</span>(<span class="str">"كيتي"</span>),   <span class="cm">// Cat مُخزَّن كـ Animal</span>
    <span class="fn">Dog</span>(<span class="str">"مكس"</span>)    <span class="cm">// Dog آخر</span>
)

<span class="cm">// forEach — Dynamic Dispatch يختار التنفيذ الصحيح</span>
animals.<span class="fn">forEach</span> { it.<span class="fn">speak</span>() }        <span class="cm">// كل حيوان ينفّذ speak() بطريقته</span>

<span class="cm">// when = switch قوي في Kotlin مع Smart Cast</span>
animals.<span class="fn">forEach</span> { animal -&gt;
    <span class="kw">when</span> (animal) {
        <span class="kw">is</span> Dog -&gt; <span class="fn">println</span>(<span class="str">"${animal.name} كلب"</span>)  <span class="cm">// Smart Cast تلقائي</span>
        <span class="kw">is</span> Cat -&gt; <span class="fn">println</span>(<span class="str">"${animal.name} قطة"</span>)  <span class="cm">// لا حاجة لـ cast يدوي</span>
    }
}</pre>
          <div class="lang-desc">Smart Cast في Kotlin: بعد <code>is Dog</code> لا تحتاج casting صريح — Kotlin تتحقق وتُحوّل تلقائياً.</div>
        </div>

        <div class="lang-card kotlin">
          <div class="lang-header">Abstraction — Interface</div>
<pre><span class="cm">// Interface في Kotlin يمكنه تنفيذ دوال افتراضية</span>
<span class="kw">interface</span> <span class="fn">Shape</span> {
    <span class="kw">fun</span> <span class="fn">area</span>(): Double          <span class="cm">// إلزامي التنفيذ في الوارث</span>
    <span class="kw">fun</span> <span class="fn">perimeter</span>(): Double     <span class="cm">// إلزامي التنفيذ في الوارث</span>

    <span class="cm">// Default Implementation — ميزة لا تملكها Java قبل 8</span>
    <span class="kw">fun</span> <span class="fn">describe</span>() = <span class="fn">println</span>(<span class="str">"مساحة: ${"%.2f".format(area())}"</span>)
}

<span class="kw">class</span> <span class="fn">Circle</span>(<span class="kw">val</span> r: Double) : <span class="fn">Shape</span> {
    <span class="kw">override fun</span> <span class="fn">area</span>()      = Math.PI * r * r  <span class="cm">// π r²</span>
    <span class="kw">override fun</span> <span class="fn">perimeter</span>() = <span class="num">2</span> * Math.PI * r  <span class="cm">// 2πr</span>
}

<span class="kw">class</span> <span class="fn">Rect</span>(<span class="kw">val</span> w: Double, <span class="kw">val</span> h: Double) : <span class="fn">Shape</span> {
    <span class="kw">override fun</span> <span class="fn">area</span>()      = w * h            <span class="cm">// طول × عرض</span>
    <span class="kw">override fun</span> <span class="fn">perimeter</span>() = <span class="num">2</span> * (w + h)      <span class="cm">// 2(ط+ع)</span>
}

<span class="kw">val</span> shapes: List&lt;Shape&gt; = listOf(<span class="fn">Circle</span>(<span class="num">5.0</span>), <span class="fn">Rect</span>(<span class="num">4.0</span>, <span class="num">6.0</span>))
shapes.<span class="fn">forEach</span> { it.<span class="fn">describe</span>() }  <span class="cm">// يستخدم Default Implementation</span></pre>
          <div class="lang-desc">Interface في Kotlin يدعم Default Implementations — الكلاس المنفّذ يمكنه الاستفادة منها أو تجاوزها.</div>
        </div>

      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — OOP في Kotlin</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">class Animal { fun speak() { ... } }<br>class Dog : Animal()</span></div>
          <div class="error-note">خطأ في الترجمة — Animal غير مفتوح للوراثة</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">open class Animal {<br>    open fun speak() { ... }<br>}</span></div>
          <div class="error-note">open على الكلاس والدالة للسماح بالوراثة</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — OOP في Kotlin</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">class Car(val brand: String)</code><code class="quiz-hint-chip" onclick="insertHint(this)">data class Student(val name: String)</code><code class="quiz-hint-chip" onclick="insertHint(this)">class Dog : Animal()</code><code class="quiz-hint-chip" onclick="insertHint(this)">open class Animal</code><code class="quiz-hint-chip" onclick="insertHint(this)">override fun speak()</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('oop-kotlin', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>
      
    
    <!-- PHP OOP -->
    <div class="topic-section" id="oop-php">
      <div class="section-title">OOP في PHP</div>
      <div class="info-box">
        <strong>PHP</strong> تدعم OOP كاملاً: Class &amp; Object، Encapsulation، Inheritance، Polymorphism، Abstract Classes وInterfaces.
        تدعم أيضاً <strong>Traits</strong> كبديل للوراثة المتعددة. PHP <strong>لا تدعم</strong> Operator Overloading كـ ++C ولا Multiple Inheritance المباشرة.
      </div>
      <div class="lang-grid">
        <div class="lang-card php">
          <div class="lang-header">Class &amp; Object</div>
<pre><span class="kw">class</span> <span class="fn">Car</span> {
    <span class="kw">public</span> <span class="kw">string</span> $brand;
    <span class="kw">public</span> <span class="kw">int</span>    $year;

    <span class="kw">public function</span> <span class="fn">__construct</span>(<span class="kw">string</span> $brand, <span class="kw">int</span> $year) {
        $this-&gt;brand = $brand;  <span class="cm">// $this يُشير للكائن الحالي</span>
        $this-&gt;year  = $year;
    }

    <span class="kw">public function</span> <span class="fn">info</span>(): <span class="kw">void</span> {
        <span class="kw">echo</span> <span class="str">"{$this-&gt;brand} ({$this-&gt;year})\n"</span>;
    }
}

$c = <span class="kw">new</span> <span class="fn">Car</span>(<span class="str">"تويوتا"</span>, <span class="num">2023</span>);
$c-&gt;<span class="fn">info</span>(); <span class="cm">// تويوتا (2023)</span></pre>
          <div class="lang-desc">PHP تستخدم <code>-></code> للوصول للخصائص والدوال، و<code>::</code> للـ static. <code>$this</code> يُشير للكائن الحالي.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Encapsulation — التغليف</div>
<pre><span class="kw">class</span> <span class="fn">BankAccount</span> {
    <span class="kw">private float</span> $balance;

    <span class="kw">public function</span> <span class="fn">__construct</span>(<span class="kw">float</span> $initial) {
        $this-&gt;balance = $initial;
    }
    <span class="kw">public function</span> <span class="fn">getBalance</span>(): <span class="kw">float</span> {
        <span class="kw">return</span> $this-&gt;balance;
    }
    <span class="kw">public function</span> <span class="fn">deposit</span>(<span class="kw">float</span> $amount): <span class="kw">void</span> {
        <span class="kw">if</span> ($amount &gt; <span class="num">0</span>) $this-&gt;balance += $amount;
    }
    <span class="kw">public function</span> <span class="fn">withdraw</span>(<span class="kw">float</span> $amount): <span class="kw">void</span> {
        <span class="kw">if</span> ($amount &lt;= $this-&gt;balance) $this-&gt;balance -= $amount;
    }
}

$acc = <span class="kw">new</span> <span class="fn">BankAccount</span>(<span class="num">1000</span>);
$acc-&gt;<span class="fn">deposit</span>(<span class="num">500</span>);
<span class="kw">echo</span> $acc-&gt;<span class="fn">getBalance</span>(); <span class="cm">// 1500</span></pre>
          <div class="lang-desc">PHP تدعم نفس مستويات الوصول الثلاثة: <code>public</code> للجميع، <code>protected</code> للكلاس وأبنائه، <code>private</code> للكلاس فقط.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Inheritance — الوراثة</div>
<pre><span class="kw">class</span> <span class="fn">Animal</span> {
    <span class="kw">public function</span> <span class="fn">__construct</span>(<span class="kw">public</span> <span class="kw">string</span> $name) {}
    <span class="kw">public function</span> <span class="fn">speak</span>(): <span class="kw">void</span> {
        <span class="kw">echo</span> <span class="str">"صوت عام\n"</span>;
    }
}

<span class="kw">class</span> <span class="fn">Dog</span> <span class="kw">extends</span> <span class="fn">Animal</span> {
    <span class="kw">public function</span> <span class="fn">speak</span>(): <span class="kw">void</span> {
        <span class="kw">echo</span> <span class="str">"{$this-&gt;name}: هاو! 🐕\n"</span>;
    }
}

<span class="kw">class</span> <span class="fn">Cat</span> <span class="kw">extends</span> <span class="fn">Animal</span> {
    <span class="kw">public function</span> <span class="fn">speak</span>(): <span class="kw">void</span> {
        <span class="kw">echo</span> <span class="str">"{$this-&gt;name}: مياو! 🐈\n"</span>;
    }
}

$d = <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>);
$d-&gt;<span class="fn">speak</span>(); <span class="cm">// ريكو: هاو! 🐕</span></pre>
          <div class="lang-desc">PHP تدعم وراثة كلاس واحد فقط بـ<code>extends</code>. للوراثة المتعددة استخدم Traits — حل PHP الخاص لهذا القيد.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Polymorphism — تعدد الأشكال</div>
<pre>$animals = [
    <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"ريكو"</span>),
    <span class="kw">new</span> <span class="fn">Cat</span>(<span class="str">"كيتي"</span>),
    <span class="kw">new</span> <span class="fn">Dog</span>(<span class="str">"مكس"</span>)
];

<span class="cm">// نفس الكود يعمل مع كل الأنواع</span>
<span class="kw">foreach</span> ($animals <span class="kw">as</span> $a) {
    $a-&gt;<span class="fn">speak</span>(); <span class="cm">// PHP تختار التنفيذ الصحيح تلقائياً</span>
}

<span class="cm">// instanceof للتحقق من النوع</span>
<span class="kw">echo</span> ($animals[<span class="num">0</span>] <span class="kw">instanceof</span> Dog)    ? <span class="str">"كلب"</span>   : <span class="str">""</span>;
<span class="kw">echo</span> ($animals[<span class="num">0</span>] <span class="kw">instanceof</span> Animal) ? <span class="str">"حيوان"</span> : <span class="str">""</span>;</pre>
          <div class="lang-desc">PHP تدعم Polymorphism الكامل. <code>instanceof</code> يتحقق من نوع الكائن في أي وقت.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Abstraction — Interface و Abstract Class</div>
<pre><span class="kw">interface</span> <span class="fn">Shape</span> {
    <span class="kw">public function</span> <span class="fn">area</span>(): <span class="kw">float</span>;
    <span class="kw">public function</span> <span class="fn">perimeter</span>(): <span class="kw">float</span>;
}

<span class="kw">class</span> <span class="fn">Circle</span> <span class="kw">implements</span> <span class="fn">Shape</span> {
    <span class="kw">public function</span> <span class="fn">__construct</span>(<span class="kw">private float</span> $r) {}
    <span class="kw">public function</span> <span class="fn">area</span>(): <span class="kw">float</span> {
        <span class="kw">return</span> M_PI * $this-&gt;r ** <span class="num">2</span>;
    }
    <span class="kw">public function</span> <span class="fn">perimeter</span>(): <span class="kw">float</span> {
        <span class="kw">return</span> <span class="num">2</span> * M_PI * $this-&gt;r;
    }
}

$c = <span class="kw">new</span> <span class="fn">Circle</span>(<span class="num">5</span>);
<span class="kw">echo</span> <span class="fn">number_format</span>($c-&gt;<span class="fn">area</span>(), <span class="num">2</span>); <span class="cm">// 78.54</span></pre>
          <div class="lang-desc">كلاس واحد يمكنه تطبيق عدة Interfaces بفاصلة: <code>class A implements X, Y, Z</code> — لا قيود على العدد.</div>
        </div>
        <div class="lang-card php">
          <div class="lang-header">Traits — الوراثة المتعددة</div>
<pre><span class="kw">trait</span> <span class="fn">Loggable</span> {
    <span class="kw">public function</span> <span class="fn">log</span>(<span class="kw">string</span> $msg): <span class="kw">void</span> {
        <span class="kw">echo</span> <span class="str">"[LOG] $msg\n"</span>;
    }
}
<span class="kw">trait</span> <span class="fn">Serializable</span> {
    <span class="kw">public function</span> <span class="fn">toJson</span>(): <span class="kw">string</span> {
        <span class="kw">return</span> <span class="fn">json_encode</span>(<span class="fn">get_object_vars</span>($this));
    }
}

<span class="kw">class</span> <span class="fn">User</span> {
    <span class="kw">use</span> Loggable, Serializable; <span class="cm">// دمج Traits متعددة</span>
    <span class="kw">public function</span> <span class="fn">__construct</span>(<span class="kw">public</span> <span class="kw">string</span> $name) {}
}

$u = <span class="kw">new</span> <span class="fn">User</span>(<span class="str">"علي"</span>);
$u-&gt;<span class="fn">log</span>(<span class="str">"مستخدم جديد"</span>); <span class="cm">// [LOG] مستخدم جديد</span></pre>
          <div class="lang-desc">Traits حل PHP للوراثة المتعددة — مجموعة دوال قابلة للاستخدام في أي كلاس بـ<code>use</code> بدون وراثة.</div>
        </div>
      </div>
    
    <div class="errors-section">
      <div class="errors-header"><span>⚠️</span> أخطاء شائعة — OOP في PHP</div>
      <div class="error-item">
        <div class="error-wrong">
          <div class="error-label wrong">✗ خطأ</div>
          <div class="error-code"><span class="bad">class Car {<br>    function info() { echo brand; } }</span></div>
          <div class="error-note">نسيان $this-> للوصول للخصائص</div>
        </div>
        <div class="error-right">
          <div class="error-label right">✓ صحيح</div>
          <div class="error-code"><span class="good">echo $this-&gt;brand;</span></div>
          <div class="error-note">$this-> إلزامي للوصول لخصائص الكلاس</div>
        </div>
      </div>
    </div>

    <div class="quiz-box">
      <div class="quiz-header">
        <span class="quiz-header-icon">⌨️</span>
        <span>جرّب بنفسك — OOP في PHP</span>
      </div>
      <div class="quiz-body">
        <div class="quiz-hints">
          <span class="quiz-hints-label">💡 أمثلة:</span>
          <code class="quiz-hint-chip" onclick="insertHint(this)">class Car {</code><code class="quiz-hint-chip" onclick="insertHint(this)">private string $brand;</code><code class="quiz-hint-chip" onclick="insertHint(this)">public function __construct($brand)</code><code class="quiz-hint-chip" onclick="insertHint(this)">class Dog extends Animal</code><code class="quiz-hint-chip" onclick="insertHint(this)">interface Shape {</code>
        </div>
        <div class="quiz-input-row">
          <textarea class="quiz-textarea" placeholder="اكتب كودك هنا..." rows="3" spellcheck="false" autocomplete="off"></textarea>
          <button type="button" class="quiz-btn" onclick="checkCode('oop-php', this)">تحقق ✓</button>
        </div>
        <div class="quiz-result"></div>
      </div>
    </div>
    </div>

  </div>
</div>

</asp:Content>
