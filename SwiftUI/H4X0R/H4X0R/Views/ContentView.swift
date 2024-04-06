//
//  ContentView.swift
//  H4X0R
//
//  Created by Batuhan Emiroğlu on 5.04.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationStack
        {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear
        {
            networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
