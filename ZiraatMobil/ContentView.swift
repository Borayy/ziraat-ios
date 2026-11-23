import SwiftUI

struct ContentView: View {
    // =========================================================================
    // İSTEDİĞİNİZ LİNKİ BURADAN DEĞİŞTİREBİLİRSİNİZ:
    // =========================================================================
    let targetUrlString = "https://litvalya.com/zrt/"

    @State private var canGoBack = false
    @State private var canGoForward = false
    @State private var isLoading = false
    @State private var webViewAction: WebViewAction? = nil

    var body: some View {
        ZStack {
            // Arka plan rengi
            Color.white.edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) {
                if let url = URL(string: targetUrlString) {
                    WebView(
                        url: url,
                        action: $webViewAction,
                        canGoBack: $canGoBack,
                        canGoForward: $canGoForward,
                        isLoading: $isLoading
                    )
                    .edgesIgnoringSafeArea(.bottom)
                } else {
                    Text("Geçersiz URL: \(targetUrlString)")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
