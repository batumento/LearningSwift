//
//  WebView.swift
//  H4X0R
//
//  Created by Batuhan Emiroğlu on 6.04.2024.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    typealias UIViewType = WKWebView

    let urlString: String?

    func makeUIView(context: Context) -> UIViewType {
        return WKWebView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeURL = urlString
        {
            if let url = URL(string: safeURL)
            {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
