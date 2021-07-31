//
//  DetailView.swift
//  Hacker New
//
//  Created by MAC on 30/07/2021.
//

import SwiftUI
import WebKit

struct DetailView: View {
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    var urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let safeURL = URL(string: safeString) {
                let request = URLRequest(url: safeURL)
                uiView.load(request)
            }
        }
    }
}
