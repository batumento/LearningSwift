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
                    
                    VStack {
                        Image(systemName: "lasso.badge.sparkles")
                            .resizable()
                            .frame(width: 200, height: 200)
                        .foregroundStyle(Color(uiColor: UIColor(red: 0.95, green: 0.98, blue: 0.85, alpha: 1.00)))
                    }
                }
            }
        }
        .onAppear
        {
            withAnimation(.linear(duration: 3))
            {
                showMainView = true
            }
        }
    }
}

#Preview {
    PreLaunch()
}
