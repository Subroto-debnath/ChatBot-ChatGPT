//
//  Extentions.swift
//  ChatBot
//
//  Created by Subroto Debnath on 2023-03-20.
//

import Foundation
import SwiftUI

struct BeautifulTextField: View {
    @Binding var text: String
    let placeholder: String
    let cornerRadius: CGFloat
    
    init(text: Binding<String>, placeholder: String, cornerRadius: CGFloat = 10) {
        self._text = text
        self.placeholder = placeholder
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
            }
            TextField("", text: $text)
                .padding()
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding(.horizontal)
    }
}

struct BeautifulTextView: View {
    let text: String
    let backgroundColor: Color
    let textColor: Color
    let cornerRadius: CGFloat
    
    init(text: String, backgroundColor: Color = .blue, textColor: Color = .white, cornerRadius: CGFloat = 10) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        Text(text)
            .padding()
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
    }
}
