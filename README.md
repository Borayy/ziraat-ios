# Ziraat Mobil - iOS (SwiftUI WebView) & IPA Oluşturucu

Bu proje, `D:\apklar\ZiraatMobil` adresindeki Android WebView uygulamasının **birebir iOS (SwiftUI + WebKit) karşılığıdır**.

İçerisinde:
- **Tam Ekran WebView (WKWebView):** JavaScript, DOM Depolama ve çerezler açık.
- **Aşağı Çekerek Yenileme (Pull to Refresh):** Sayfayı yukarıdan aşağı kaydırınca yeniler.
- **Doğal Geri/İleri Jestleri:** Ekran kenarından kaydırarak geçmişte ileri-geri gitme.
- **Orijinal Uygulama İkonu:** Android projesindeki `ic_launcher-playstore.png` 1024x1024 iOS formatına dönüştürülüp eklendi.
- **GitHub Actions Workflow:** Mac bilgisayarınız olmadan bulutta ücretsiz `.ipa` derlemek için hazırlandı.

---

## 🔗 1. Hedef URL'yi Değiştirme
Varsayılan olarak `https://google.com` açılacak şekilde ayarlanmıştır. Linki değiştirmek isterseniz:
1. `ZiraatMobil/ContentView.swift` dosyasını Not Defteri veya herhangi bir editörle açın.
2. 8. satırdaki linki güncelleyin:
   ```swift
   let targetUrlString = "https://site-adresiniz.com"
   ```

---

## ☁️ 2. GitHub Actions ile Ücretsiz IPA Derleme (Mac Gerekmez)

### Adım 1: GitHub'da Yeni Depo (Repository) Açın
1. [GitHub](https://github.com) sitesine giriş yapın.
2. Sağ üstteki **+** simgesine tıklayıp **"New repository"** deyin.
3. Depo adı yazın (örneğin: `ziraat-ios`) ve **Public** veya **Private** seçip **"Create repository"** butonuna basın.

### Adım 2: Dosyaları GitHub'a Yükleyin
*(Git komutları ile veya doğrudan tarayıcı üzerinden yükleyebilirsiniz)*

**Yöntem A: Tarayıcıdan Yükleme (En Kolayı)**
1. Açılan boş GitHub depo sayfasında **"uploading an existing file"** linkine tıklayın.
2. Masaüstündeki `apk to ipa` klasörünün içindeki tüm dosya ve klasörleri (`.github`, `ZiraatMobil`, `ZiraatMobil.xcodeproj`, `project.yml`, `.gitignore`) sürükleyip bırakın.
3. Alttaki yeşil **"Commit changes"** butonuna basın.

**Yöntem B: Git ile Gönderme**
```bash
git init
git add .
git commit -m "iOS WebView projesi"
git branch -M main
git remote add origin https://github.com/<KULLANICI_ADINIZ>/<DEPO_ADINIZ>.git
git push -u origin main
```

### Adım 3: IPA Dosyasını İndirin
1. Dosyaları yükledikten sonra deponuzun üst menüsündeki **"Actions"** sekmesine tıklayın.
2. **"Build iOS IPA"** başlıklı işin otomatik başladığını göreceksiniz. (Yaklaşık 1-2 dakika sürer).
3. İşlem yeşil onay işaretiyle tamamlandığında üzerine tıklayın.
4. Sayfanın en altındaki **Artifacts (Yapıtlar)** bölümünde yer alan **`ZiraatMobil-IPA`** dosyasına tıklayıp `.zip` olarak bilgisayarınıza indirin.
5. İndirdiğiniz zip'i açtığınızda içinden `ZiraatMobil.ipa` çıkacaktır.

---

## 📲 3. IPA'yı iPhone'a Yükleme (Sideloadly ile)

1. Bilgisayarınıza [Sideloadly](https://sideloadly.io/) programını kurun.
2. iPhone'unuzu USB kablosu ile bilgisayara bağlayın (iPhone ekranında çıkarsa **"Bu Bilgisayara Güven"**i seçin).
3. Sideloadly'yi açın:
   - Sol taraftaki IPA simgesine `ZiraatMobil.ipa` dosyasını sürükleyip bırakın.
   - **Apple ID** kutucuğuna kendi Apple e-postanızı girin.
   - **Start** butonuna tıklayın (Apple parolanızı soracaktır, işlem doğrudan Apple sunucusuyla sertifikalandırılır).
4. Yükleme tamamlandığında uygulama iPhone ana ekranınıza gelecektir.
5. **Son Onay (iPhone'dan):**
   - iPhone'da **Ayarlar > Genel > VPN ve Aygıt Yönetimi** bölümüne gidin.
   - Geliştirici Uygulaması altında Apple ID'nizi göreceksiniz; üzerine dokunup **"Güven"** deyin.
   - Artık uygulamayı açıp kullanabilirsiniz!

---

## 🍏 4. Mac Bilgisayarınız Varsa (Alternatif)
Eğer bir Mac bilgisayarınız varsa:
1. `ZiraatMobil.xcodeproj` dosyasına çift tıklayarak Xcode ile açın.
2. Kendi Apple Geliştirici hesabınızı seçin (`Signing & Capabilities`).
3. Üst menüden **Product > Archive** deyin.
4. Çıkan pencereden **Distribute App** diyerek doğrudan `.ipa` dosyasını masaüstünüze kaydedin veya doğrudan bağlı iPhone'unuza yükleyin.
