//
//  PreLaunch.swift
//  BatuhanCard
//
//  Created by Batuhan Emiroğlu on 4.04.2024.
//

import SwiftUI

struct PreLaunch: View {
    @State private var showMainView = false
    var body: some View {
        Group
        {
            if showMainView
            {
                ContentView()
            }
            else
            {
                ZStack
                {
                    Color("Background")
                        .ignoresSafeArea()
                    Image("diamond")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            }
        }
        .onAppear
        {
            withAnimation(.linear(duration: 2))
            {
                showMainView = true
            }
        }
    }
}

#Preview {
    PreLaunch()
}
