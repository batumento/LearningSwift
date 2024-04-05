//
//  InfoView.swift
//  BatuhanCard
//
//  Created by Batuhan Emiroğlu on 5.04.2024.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(Color(uiColor: UIColor(red: 0.95, green: 0.98, blue: 0.85, alpha: 1.00)))
            .frame(height: 45)
            .overlay(
                HStack
                {
                    Image(systemName: imageName)
                        .foregroundStyle(.green)
                    Text(text).bold()
                }
            )
            .padding(.all)
    }
}

#Preview {
    InfoView(text: "Hellls", imageName: "envelope.fill")
        .previewLayout(.sizeThatFits)
}
