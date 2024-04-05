//
//  ContentView.swift
//  Dice-SwiftUI
//
//  Created by Batuhan Emiroğlu on 5.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber : Int = 1
    @State var rightDiceNumber : Int = 1
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(diceNumber: leftDiceNumber)
                    DiceView(diceNumber: rightDiceNumber)
                }
                Spacer()
                Button("Roll") {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }
                .padding(.horizontal)
                .font(.system(size: 45))
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
                .background(Color.red)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct DiceView: View {
    let diceNumber: Int
    var body: some View {
        Image("dice\(diceNumber)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
