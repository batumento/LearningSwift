//
//  ContentView.swift
//  BatuhanCard
//
//  Created by Batuhan Emiroğlu on 4.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.00))
                .ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Batuhan Emiroğlu")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
