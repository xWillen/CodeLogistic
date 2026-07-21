<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="DefaultPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <title>كودلوجستك — الرئيسية</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

  <div class="hero">
    <h1>كودلوجستك <span>بطريقة احترافية</span></h1>
    <p>مرجع شامل يغطي أغلب لغات البرمجة الأساسية من المتغيرات إلى البرمجة الكائنية</p>
    <div class="hero-grid">
      <div class="hero-card" onclick="location.href='Vars.aspx'">
        <span class="icon">📋</span>
        <h3>Variables</h3>
        <p>المتغيرات والأنواع</p>
      </div>
      <div class="hero-card" onclick="location.href='Print.aspx'">
        <span class="icon">🖨️</span>
        <h3>Print</h3>
        <p>طرق الطباعة</p>
      </div>
      <div class="hero-card" onclick="location.href='For.aspx'">
        <span class="icon">🔁</span>
        <h3>For Loop</h3>
        <p>حلقات التكرار</p>
      </div>
      <div class="hero-card" onclick="location.href='Conditions.aspx'">
        <span class="icon">🔀</span>
        <h3>If / While</h3>
        <p>الشروط والتكرار</p>
      </div>
      <div class="hero-card" onclick="location.href='Switch.aspx'">
        <span class="icon">🔧</span>
        <h3>Switch / Case</h3>
        <p>التحويل المتعدد</p>
      </div>
      <div class="hero-card" onclick="location.href='Functions.aspx'">
        <span class="icon">⚙️</span>
        <h3>Functions</h3>
        <p>الدوال والوظائف</p>
      </div>
      <div class="hero-card" onclick="location.href='Arrays.aspx'">
        <span class="icon">📦</span>
        <h3>Arrays</h3>
        <p>المصفوفات والقوائم</p>
      </div>
      <div class="hero-card" onclick="location.href='OOP.aspx'">
        <span class="icon">🏗️</span>
        <h3>OOP</h3>
        <p>البرمجة الكائنية</p>
      </div>
      <div class="hero-card" onclick="location.href='Refs.aspx'">
        <span class="icon">📚</span>
        <h3>المراجع</h3>
        <p>مصادر وكتب وروابط</p>
      </div>
    </div>
  </div>

  <!-- CONTACT SECTION -->
  <hr class="contact-divider">
  <div class="contact-section">

    <div class="contact-header">
      <h2>💬 تواصل <span>معنا</span></h2>
      <p>اقتراحاتك تهمنا، واستفساراتك نجيب عليها — اختر نوع رسالتك</p>
    </div>

    <div class="contact-tabs">
      <button type="button" class="contact-tab active" onclick="switchContactTab('suggestion',this)">💡 اقتراح</button>
      <button type="button" class="contact-tab" onclick="switchContactTab('inquiry',this)">❓ استفسار</button>
    </div>

    <div class="contact-form-wrap">

      <!-- SUGGESTION PANEL -->
      <div class="contact-form-panel active" id="panel-suggestion">
        <div id="suggestion-form-area">
          <label class="contact-label">اكتب اقتراحك</label>
          <textarea class="contact-textarea" id="suggestion-text" placeholder="شاركنا فكرتك أو اقتراحك لتطوير الموقع..."></textarea>
          <button type="button" class="contact-btn" id="suggestion-btn" onclick="sendSuggestion()">📤 إرسال الاقتراح</button>
        </div>
        <div class="contact-success" id="suggestion-success">
          <span class="success-icon">✅</span>
          <h3>شكراً على اقتراحك!</h3>
          <p>وصلنا اقتراحك وسنأخذه بعين الاعتبار</p>
        </div>
      </div>

      <!-- INQUIRY PANEL -->
      <div class="contact-form-panel" id="panel-inquiry">
        <div id="inquiry-form-area">
          <label class="contact-label">إيميلك (حتى نرد عليك)</label>
          <input class="contact-input" id="inquiry-email" type="email" placeholder="example@email.com" dir="ltr">
          <label class="contact-label">استفسارك</label>
          <textarea class="contact-textarea" id="inquiry-text" placeholder="اكتب استفسارك بالتفصيل..."></textarea>
          <button type="button" class="contact-btn" id="inquiry-btn" onclick="sendInquiry()">📤 إرسال الاستفسار</button>
        </div>
        <div class="contact-success" id="inquiry-success">
          <span class="success-icon">✅</span>
          <h3>شكراً على تواصلك!</h3>
          <p>استلمنا استفسارك وسنرد عليك قريباً</p>
        </div>
      </div>

    </div>
  </div>

</asp:Content>
