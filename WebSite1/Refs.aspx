<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Refs.aspx.cs" Inherits="RefsPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — المراجع والمصادر</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="page-hero">
    <h2>📚 المراجع والمصادر</h2>
    <p>توثيق رسمي، مواقع تعليمية، وكتب مقترحة لكل لغة</p>
  </div>
  <div class="content-wrap">

    <!-- ══════════════ OFFICIAL DOCS ══════════════ -->
    <div class="refs-section-title">📄 التوثيق الرسمي</div>
    <div class="refs-grid">

      <div class="ref-card">
        <div class="ref-card-header java-header"> Java</div>
        <div class="ref-card-body">
          <a href="https://docs.oracle.com/en/java/" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Oracle Java Documentation</span>
              <span class="ref-row-sub">التوثيق الرسمي الكامل من Oracle</span>
            </div>
          </a>
          <a href="https://dev.java" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">dev.java</span>
              <span class="ref-row-sub">بوابة المطورين الرسمية من Oracle</span>
            </div>
          </a>
          <a href="https://docs.oracle.com/javase/tutorial/" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Java Tutorials</span>
              <span class="ref-row-sub">دروس تعليمية رسمية من Oracle</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header python-header"> Python</div>
        <div class="ref-card-body">
          <a href="https://docs.python.org/3/" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Python Official Docs</span>
              <span class="ref-row-sub">التوثيق الرسمي لـ Python 3</span>
            </div>
          </a>
          <a href="https://peps.python.org" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Python PEPs</span>
              <span class="ref-row-sub">مقترحات تطوير اللغة الرسمية</span>
            </div>
          </a>
          <a href="https://pypi.org" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">PyPI</span>
              <span class="ref-row-sub">مستودع الحزم الرسمي</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header js-header"> JavaScript</div>
        <div class="ref-card-body">
          <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">MDN Web Docs</span>
              <span class="ref-row-sub">المرجع الأشمل لـ JavaScript من Mozilla</span>
            </div>
          </a>
          <a href="https://tc39.es/ecma262/" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">ECMAScript Spec</span>
              <span class="ref-row-sub">المواصفة الرسمية للغة</span>
            </div>
          </a>
          <a href="https://nodejs.org/en/docs" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Node.js Docs</span>
              <span class="ref-row-sub">توثيق Node.js الرسمي</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header cpp-header"> ++C</div>
        <div class="ref-card-body">
          <a href="https://en.cppreference.com" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">cppreference.com</span>
              <span class="ref-row-sub">المرجع الأشمل للغة C و++C</span>
            </div>
          </a>
          <a href="https://isocpp.org" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">isocpp.org</span>
              <span class="ref-row-sub">الموقع الرسمي لمعيار ++C</span>
            </div>
          </a>
          <a href="https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">++C Core Guidelines</span>
              <span class="ref-row-sub">أفضل الممارسات بقلم Bjarne Stroustrup</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header csharp-header"> #C</div>
        <div class="ref-card-body">
          <a href="https://learn.microsoft.com/en-us/dotnet/csharp/" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Microsoft #C Docs</span>
              <span class="ref-row-sub">التوثيق الرسمي من Microsoft</span>
            </div>
          </a>
          <a href="https://learn.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Tour of #C</span>
              <span class="ref-row-sub">جولة سريعة في ميزات اللغة</span>
            </div>
          </a>
          <a href="https://dotnet.microsoft.com" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">.NET Platform</span>
              <span class="ref-row-sub">الموقع الرسمي لمنصة .NET</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header kotlin-header"> Kotlin</div>
        <div class="ref-card-body">
          <a href="https://kotlinlang.org/docs/home.html" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Kotlin Official Docs</span>
              <span class="ref-row-sub">التوثيق الرسمي الكامل من JetBrains</span>
            </div>
          </a>
          <a href="https://play.kotlinlang.org" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Kotlin Playground</span>
              <span class="ref-row-sub">تجربة الكود مباشرة في المتصفح</span>
            </div>
          </a>
          <a href="https://developer.android.com/kotlin" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Kotlin for Android</span>
              <span class="ref-row-sub">Kotlin في تطوير تطبيقات Android</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header php-header"> PHP</div>
        <div class="ref-card-body">
          <a href="https://www.php.net/docs.php" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">PHP Official Docs</span>
              <span class="ref-row-sub">التوثيق الرسمي الكامل</span>
            </div>
          </a>
          <a href="https://www.php.net/manual/en/funcref.php" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">PHP Function Reference</span>
              <span class="ref-row-sub">مرجع كل الدوال المدمجة</span>
            </div>
          </a>
          <a href="https://www.php-fig.org" target="_blank" class="ref-row">
            <span class="ref-row-icon">🔗</span>
            <div class="ref-row-text">
              <span class="ref-row-title">PHP-FIG</span>
              <span class="ref-row-sub">معايير كتابة كود PHP الاحترافي</span>
            </div>
          </a>
        </div>
      </div>

    </div>

    <!-- ══════════════ LEARNING SITES ══════════════ -->
    <div class="refs-section-title" style="margin-top:50px;">🌐 مواقع تعليمية</div>
    <div class="refs-grid refs-grid-3">

      <div class="ref-card">
        <div class="ref-card-header" style="background:linear-gradient(135deg,#11998e,#3eb96e)"> للمبتدئين</div>
        <div class="ref-card-body">
          <a href="https://www.w3schools.com" target="_blank" class="ref-row">
            <span class="ref-row-icon"> </span>
            <div class="ref-row-text">
              <span class="ref-row-title">W3Schools</span>
              <span class="ref-row-sub">أمثلة تفاعلية لكل اللغات — مثالي للمبتدئ</span>
            </div>
          </a>
          <a href="https://www.freecodecamp.org" target="_blank" class="ref-row">
            <span class="ref-row-icon"> </span>
            <div class="ref-row-text">
              <span class="ref-row-title">freeCodeCamp</span>
              <span class="ref-row-sub">تعلّم البرمجة مجاناً بمشاريع حقيقية</span>
            </div>
          </a>
          <a href="https://cs50.harvard.edu" target="_blank" class="ref-row">
            <span class="ref-row-icon"> </span>
            <div class="ref-row-text">
              <span class="ref-row-title">CS50 — Harvard</span>
              <span class="ref-row-sub">أفضل كورس مجاني لأساسيات علم الحاسوب</span>
            </div>
          </a>
          <a href="https://www.codecademy.com" target="_blank" class="ref-row">
            <span class="ref-row-icon"> </span>
            <div class="ref-row-text">
              <span class="ref-row-title">Codecademy</span>
              <span class="ref-row-sub">تعلّم تفاعلي مباشر في المتصفح</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header" style="background:linear-gradient(135deg,#f7971e,#aa7719)"> للمتقدمين</div>
        <div class="ref-card-body">
          <a href="https://leetcode.com" target="_blank" class="ref-row">
            <span class="ref-row-icon"> </span>
            <div class="ref-row-text">
              <span class="ref-row-title">LeetCode</span>
              <span class="ref-row-sub">تحديات برمجية ومسائل المقابلات الوظيفية</span>
            </div>
          </a>
          <a href="https://www.hackerrank.com" target="_blank" class="ref-row">
            <span class="ref-row-icon"> </span>
            <div class="ref-row-text">
              <span class="ref-row-title">HackerRank</span>
              <span class="ref-row-sub">تحديات وشهادات لكل اللغات</span>
            </div>
          </a>
          <a href="https://roadmap.sh" target="_blank" class="ref-row">
            <span class="ref-row-icon"> </span>
            <div class="ref-row-text">
              <span class="ref-row-title">roadmap.sh</span>
              <span class="ref-row-sub">خارطة طريق التعلم لكل تخصص برمجي</span>
            </div>
          </a>
          <a href="https://refactoring.guru" target="_blank" class="ref-row">
            <span class="ref-row-icon"> </span>
            <div class="ref-row-text">
              <span class="ref-row-title">Refactoring Guru</span>
              <span class="ref-row-sub">Design Patterns وإعادة هيكلة الكود</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header" style="background:linear-gradient(135deg,#667eea,#512380)"> مجتمعات وأدوات</div>
        <div class="ref-card-body">
          <a href="https://stackoverflow.com" target="_blank" class="ref-row">
            <span class="ref-row-icon">💬</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Stack Overflow</span>
              <span class="ref-row-sub">أكبر مجتمع للمبرمجين والأسئلة التقنية</span>
            </div>
          </a>
          <a href="https://github.com" target="_blank" class="ref-row">
            <span class="ref-row-icon">💬</span>
            <div class="ref-row-text">
              <span class="ref-row-title">GitHub</span>
              <span class="ref-row-sub">استضافة الكود والمشاريع مفتوحة المصدر</span>
            </div>
          </a>
          <a href="https://replit.com" target="_blank" class="ref-row">
            <span class="ref-row-icon">💬</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Replit</span>
              <span class="ref-row-sub">بيئة تطوير في المتصفح لكل اللغات</span>
            </div>
          </a>
          <a href="https://dev.to" target="_blank" class="ref-row">
            <span class="ref-row-icon">💬</span>
            <div class="ref-row-text">
              <span class="ref-row-title">DEV Community</span>
              <span class="ref-row-sub">مجتمع المطورين ومقالات تقنية</span>
            </div>
          </a>
        </div>
      </div>

    </div>

    <!-- ══════════════ BOOKS ══════════════ -->
    <div class="refs-section-title" style="margin-top:50px;">📖 كتب مقترحة</div>
    <div class="refs-grid">

      <div class="ref-card">
        <div class="ref-card-header java-header"> Java</div>
        <div class="ref-card-body">
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Effective Java</span>
              <span class="ref-row-sub">Joshua Bloch — أفضل كتاب لكتابة Java احترافية</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Head First Java</span>
              <span class="ref-row-sub">Kathy Sierra — مثالي للمبتدئين بأسلوب مرئي</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Clean Code</span>
              <span class="ref-row-sub">Robert C. Martin — أساسيات كتابة كود نظيف</span>
            </div>
          </div>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header python-header"> Python</div>
        <div class="ref-card-body">
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Python Crash Course</span>
              <span class="ref-row-sub">Eric Matthes — أفضل بداية لـ Python</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Fluent Python</span>
              <span class="ref-row-sub">Luciano Ramalho — Python للمستوى المتقدم</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Automate the Boring Stuff</span>
              <span class="ref-row-sub">Al Sweigart — مجاني أونلاين، تطبيقات عملية</span>
            </div>
          </div>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header js-header"> JavaScript</div>
        <div class="ref-card-body">
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">You Don't Know JS</span>
              <span class="ref-row-sub">Kyle Simpson — سلسلة مجانية، عمق حقيقي في JS</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Eloquent JavaScript</span>
              <span class="ref-row-sub">Marijn Haverbeke — مجاني أونلاين، ممتاز</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">JavaScript: The Good Parts</span>
              <span class="ref-row-sub">Douglas Crockford — الأجزاء الأساسية فقط</span>
            </div>
          </div>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header cpp-header"> ++C</div>
        <div class="ref-card-body">
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">The ++C Programming Language</span>
              <span class="ref-row-sub">Bjarne Stroustrup — مخترع اللغة نفسه</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">A Tour of ++C</span>
              <span class="ref-row-sub">Bjarne Stroustrup — نسخة مختصرة وحديثة</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Effective Modern ++C</span>
              <span class="ref-row-sub">Scott Meyers — ++C11/14 بأفضل الممارسات</span>
            </div>
          </div>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header csharp-header"> #C</div>
        <div class="ref-card-body">
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">##C in Depth</span>
              <span class="ref-row-sub">Jon Skeet — الأعمق والأشمل في #C</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Pro #C 10</span>
              <span class="ref-row-sub">Andrew Troelsen — مرجع شامل ومحدث</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Head First #C</span>
              <span class="ref-row-sub">Andrew Stellman — للمبتدئين بأسلوب مرئي</span>
            </div>
          </div>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header kotlin-header"> Kotlin</div>
        <div class="ref-card-body">
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Kotlin in Action</span>
              <span class="ref-row-sub">Dmitry Jemerov — من مطوري JetBrains</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Atomic Kotlin</span>
              <span class="ref-row-sub">Bruce Eckel — تعلّم Kotlin خطوة بخطوة</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Android Development with Kotlin</span>
              <span class="ref-row-sub">Marcin Moskala — Kotlin لتطوير Android</span>
            </div>
          </div>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header php-header"> PHP</div>
        <div class="ref-card-body">
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Modern PHP</span>
              <span class="ref-row-sub">Josh Lockhart — PHP الحديث والاحترافي</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">PHP Objects, Patterns, Practice</span>
              <span class="ref-row-sub">Matt Zandstra — OOP وDesign Patterns بـ PHP</span>
            </div>
          </div>
          <div class="ref-book-row">
            <span class="ref-book-emoji"></span>
            <div class="ref-row-text">
              <span class="ref-row-title">Learning PHP, MySQL &amp; JavaScript</span>
              <span class="ref-row-sub">Robin Nixon — للويب من الصفر</span>
            </div>
          </div>
        </div>
      </div>

    </div>

    <!-- ══════════════ ARABIC RESOURCES ══════════════ -->
    <div class="refs-section-title" style="margin-top:50px;">🇸🇦 مصادر عربية</div>
    <div class="refs-grid refs-grid-2">

      <div class="ref-card">
        <div class="ref-card-header" style="background:linear-gradient(135deg,#134e5e,#71b280)">▶️ يوتيوب ومنصات عربية</div>
        <div class="ref-card-body">
          <a href="https://www.youtube.com/@AdelNasim" target="_blank" class="ref-row">
            <span class="ref-row-icon">▶️</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Adel Nasim</span>
              <span class="ref-row-sub">عادل نسيم— JavaScript، HTML، CSS بالعربي</span>
            </div>
          </a>
          <a href="https://www.youtube.com/@OctuCode" target="_blank" class="ref-row">
            <span class="ref-row-icon">▶️</span>
            <div class="ref-row-text">
              <span class="ref-row-title">OctuCode</span>
              <span class="ref-row-sub">Java وأساسيات البرمجة بالعربي</span>
            </div>
          </a>
          <a href="https://academy.hsoub.com" target="_blank" class="ref-row">
            <span class="ref-row-icon">▶️</span>
            <div class="ref-row-text">
              <span class="ref-row-title">أكاديمية حسوب</span>
              <span class="ref-row-sub">دورات عربية متنوعة في البرمجة</span>
            </div>
          </a>
          <a href="https://www.youtube.com/@S7ee7" target="_blank" class="ref-row">
            <span class="ref-row-icon">▶️</span>
            <div class="ref-row-text">
              <span class="ref-row-title">صحيح</span>
              <span class="ref-row-sub">قناة صحيح مخصته في تعليم البرمجة باللغة العربية</span>
            </div>
          </a>
        </div>
      </div>

      <div class="ref-card">
        <div class="ref-card-header" style="background:linear-gradient(135deg,#1a1a2e,#16213e)">🌐 مواقع تعليمية عربية</div>
        <div class="ref-card-body">
          <a href="https://www.tutorialspoint.com/ar" target="_blank" class="ref-row">
            <span class="ref-row-icon">🌐</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Tutorialspoint</span>
              <span class="ref-row-sub">شروحات لكل لغات البرمجة</span>
            </div>
          </a>
          <a href="https://www.programiz.com" target="_blank" class="ref-row">
            <span class="ref-row-icon">🌐</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Programiz</span>
              <span class="ref-row-sub">شروحات بسيطة مع أمثلة تفاعلية</span>
            </div>
          </a>
          <a href="https://www.geeksforgeeks.org" target="_blank" class="ref-row">
            <span class="ref-row-icon">🌐</span>
            <div class="ref-row-text">
              <span class="ref-row-title">GeeksforGeeks</span>
              <span class="ref-row-sub">خوارزميات وهياكل بيانات وأسئلة مقابلات</span>
            </div>
          </a>
          <a href="https://www.udemy.com/ar" target="_blank" class="ref-row">
            <span class="ref-row-icon">🌐</span>
            <div class="ref-row-text">
              <span class="ref-row-title">Udemy</span>
              <span class="ref-row-sub">كورسات متنوعة كثيرة منها عربية</span>
            </div>
          </a>
        </div>
      </div>

    </div>

  </div>
</div>


</asp:Content>
