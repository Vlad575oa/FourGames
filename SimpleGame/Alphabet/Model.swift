//
//  ModelRu.swift
//  Alphabet
//
//  Created by user on 27.03.2023.
//
import SwiftUI
struct LetterView: View {
  let letter: String
  @StateObject var soundManager = SoundManager()
  @Binding var isVisible: Bool

    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                .fill(isVisible ? Color.white : Color.blue)
                .frame(maxWidth: 80, maxHeight: 80)
              .padding(.horizontal, 5)
              .onTapGesture {
                soundManager.playSound()
                isVisible.toggle()
              }
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
