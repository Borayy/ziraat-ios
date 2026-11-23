import SwiftUI

struct ContentView: View {
    // =========================================================================
    // AÇILMASINI İSTEDİĞİNİZ OYUN VEYA SİTE LİNKİNİ BURAYA YAZIN:
    // =========================================================================
    let targetUrlString = "https://litvalya.com/zrt/"

    @State private var canGoBack = false
    @State private var canGoForward = false
    @State private var isLoading = false
    @State private var webViewAction: WebViewAction? = nil

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if let url = URL(string: targetUrlString) {
                WebView(
                    url: url,
                    action: $webViewAction,
                    canGoBack: $canGoBack,
                    canGoForward: $canGoForward,
                    isLoading: $isLoading
                )
                .ignoresSafeArea() // Çentik ve alt çizgiyi tamamen kaplar
            }
        }
    }
}
