//
//  FirsrView.swift
//  Alphabet
//
//  Created by user on 26.03.2023.
//

import SwiftUI

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit: CGFloat = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * shakesPerUnit), y: 0))
    }
}

struct AlphabetEn: View {
  @State var IsShowSelectAudio = false
  @State var showLetters = true
  @State var letterVisibility = Array(repeating: true, count: 26)
  @State var randomNumber = 0
  @State private var scaleAmount1: CGFloat = 1.0
  @State private var scaleAmount2: CGFloat = 1.0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.green, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
          VStack {
          LettersEn(letterVisibility: $letterVisibility)

            Button("Hide letters") {
              letterVisibility = letterVisibility.map { _ in Bool.random() }
              withAnimation(.easeInOut(duration: 0.5)) {
                scaleAmount1 = 0.7
              }
                withAnimation(.easeInOut(duration: 1.2)) {
                  scaleAmount1 = 1.0
                }
            }
            .modifier(TextModifier3(color: .red, scale: scaleAmount1))

            Button("Show letters") {
              withAnimation(.easeInOut(duration: 0.5)) {
                scaleAmount2 = 0.7
              }
                withAnimation(.easeInOut(duration: 1.2)) {
                  scaleAmount2 = 1.0
                  letterVisibility = Array(repeating: true, count: 26)
              }
            }
            .modifier(TextModifier3(color: .purple, scale: scaleAmount2))
            HStack {
              Button(action: {
                //
              }) {
              }
              Spacer()
              Button(action: {
                IsShowSelectAudio.toggle()
              }) {
                Image(systemName: "speaker.fill")
              } .sheet(isPresented: $IsShowSelectAudio) {
                SelectAudio()
              }
              .font(.system(size: 25))
              .padding(.trailing, 20)

            }

          }
            Spacer()
          }

        }
    }

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetEn()
    }
}


struct LettersEn: View {
  @Binding var letterVisibility: [Bool]
  var body: some View {

    HStack {
      LetterView(letter: "A", isVisible: $letterVisibility[0])
      LetterView(letter: "B", isVisible: $letterVisibility[1])
      LetterView(letter: "C", isVisible: $letterVisibility[2])
      LetterView(letter: "D", isVisible: $letterVisibility[3])
      LetterView(letter: "E", isVisible: $letterVisibility[4])
    }

    HStack {
      LetterView(letter: "F", isVisible: $letterVisibility[5])
      LetterView(letter: "G", isVisible: $letterVisibility[6])
      LetterView(letter: "H", isVisible: $letterVisibility[7])
      LetterView(letter: "I", isVisible: $letterVisibility[8])
      LetterView(letter: "J", isVisible: $letterVisibility[9])
    }

    HStack {
      LetterView(letter: "K", isVisible: $letterVisibility[10])
      LetterView(letter: "L", isVisible: $letterVisibility[11])
      LetterView(letter: "M", isVisible: $letterVisibility[12])
      LetterView(letter: "N", isVisible: $letterVisibility[13])
      LetterView(letter: "O", isVisible: $letterVisibility[14])
    }

    HStack {
      LetterView(letter: "P", isVisible: $letterVisibility[15])
      LetterView(letter: "Q", isVisible: $letterVisibility[16])
      LetterView(letter: "R", isVisible: $letterVisibility[17])
      LetterView(letter: "S", isVisible: $letterVisibility[18])
      LetterView(letter: "T", isVisible: $letterVisibility[19])
    }

    HStack {
      LetterView(letter: "U", isVisible: $letterVisibility[20])
      LetterView(letter: "V", isVisible: $letterVisibility[21])
      LetterView(letter: "W", isVisible: $letterVisibility[22])
      LetterView(letter: "X", isVisible: $letterVisibility[23])
      LetterView(letter: "Y", isVisible: $letterVisibility[24])
      LetterView(letter: "Z", isVisible: $letterVisibility[25])
    }
  }
}
