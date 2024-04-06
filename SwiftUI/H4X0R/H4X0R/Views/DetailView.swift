//
//  DetailView.swift
//  H4X0R
//
//  Created by Batuhan Emiroğlu on 6.04.2024.
//

import SwiftUI

struct DetailView: View {
    let url : String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "www.google.com")
}
