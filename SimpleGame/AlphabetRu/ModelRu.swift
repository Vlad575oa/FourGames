//
//  ModelRu.swift
//  Alphabet
//
//  Created by user on 27.03.2023.
//
import SwiftUI
struct LetterViewRu: View {
    let letter: String
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(isVisible ? Color.white : Color.green.opacity(0.8))
                .frame(maxWidth: 100, maxHeight: 100)
                .padding(.horizontal, 5)
            
            if isVisible {
                Text(letter)
                    .font(.system(size: 30))
                    .foregroundColor(.black)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                isVisible.toggle()
            }
        }
    }
}
