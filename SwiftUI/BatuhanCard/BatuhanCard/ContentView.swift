//
//  ContentView.swift
//  BatuhanCard
//
//  Created by Batuhan Emiroğlu on 4.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var uiColor : UIColor = UIColor(red: 0.95, green: 0.98, blue: 0.85, alpha: 1.00)

    var body: some View {
        
        ZStack {
            Color(UIColor(red: 0.10, green: 0.74, blue: 0.61, alpha: 1.00))
                .ignoresSafeArea()
            VStack {
                Image("batuhan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color(uiColor: uiColor), lineWidth: 5.0))
                Text("Batuhan Emiroğlu")
                    .font(.custom("Pacifico-Regular", size: 35))
                    .bold()
                    .foregroundStyle(Color(uiColor: uiColor))
                Text("iOS Developer")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(uiColor: uiColor))
                Divider()
                InfoView(text: "+90 535 395 82 85", imageName: "phone.fill")
                InfoView(text: "batuhanavniemiroglu@gmail.com", imageName: "envelope.fill")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
