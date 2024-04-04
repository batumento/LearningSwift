//
//  ContentView.swift
//  I Am Rich
//
//  Created by Batuhan Emiroğlu on 4.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            
            VStack {
                Text("I Am Rich")
                    .font(.system(size: 55))
                    .bold(true)
                    .padding()
                Image("diamond")
                    .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
            }
        }
    }
}

#Preview {
    ContentView()
}
