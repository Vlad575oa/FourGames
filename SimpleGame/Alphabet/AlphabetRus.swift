//
//  AlphabetRus.swift
//  Alphabet
//
//  Created by user on 27.03.2023.
//
import SwiftUI

struct AlphabetRu: View {
    @State var showLetters = true
    @State var letterVisibility = Array(repeating: true, count: 33)
    @State var randomNumber = 0
    @State private var scaleAmount: CGFloat = 1.0
    @State private var scaleAmount1: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.yellow, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack() {
                    LetterView(letter: "А", isVisible: $letterVisibility[0])
                    LetterView(letter: "Б", isVisible: $letterVisibility[1])
                    LetterView(letter: "В", isVisible: $letterVisibility[2])
                    LetterView(letter: "Г", isVisible: $letterVisibility[3])
                    LetterView(letter: "Д", isVisible: $letterVisibility[4])
                }
                
                HStack {
                    LetterView(letter: "Е", isVisible: $letterVisibility[5])
                    LetterView(letter: "Ё", isVisible: $letterVisibility[6])
                    LetterView(letter: "Ж", isVisible: $letterVisibility[7])
                    LetterView(letter: "З", isVisible: $letterVisibility[8])
                    LetterView(letter: "И", isVisible: $letterVisibility[9])
                }
                
                HStack {
                    LetterView(letter: "Й", isVisible: $letterVisibility[10])
                    LetterView(letter: "К", isVisible: $letterVisibility[11])
                    LetterView(letter: "Л", isVisible: $letterVisibility[12])
                    LetterView(letter: "М", isVisible: $letterVisibility[13])
                    LetterView(letter: "Н", isVisible: $letterVisibility[14])
                }
                
                HStack {
                    LetterView(letter: "О", isVisible: $letterVisibility[15])
                    LetterView(letter: "П", isVisible: $letterVisibility[16])
                    LetterView(letter: "Р", isVisible: $letterVisibility[17])
                    LetterView(letter: "С", isVisible: $letterVisibility[18])
                    LetterView(letter: "Т", isVisible: $letterVisibility[19])
                }
                
                HStack {
                    LetterView(letter: "У", isVisible: $letterVisibility[20])
                    LetterView(letter: "Ф", isVisible: $letterVisibility[21])
                    LetterView(letter: "Х", isVisible: $letterVisibility[22])
                    LetterView(letter: "Ц", isVisible: $letterVisibility[23])
                    LetterView(letter: "Ч", isVisible: $letterVisibility[24])
                }
                HStack {
                    LetterView(letter: "Ш", isVisible: $letterVisibility[25])
                    LetterView(letter: "Щ", isVisible: $letterVisibility[26])
                    LetterView(letter: "Ъ", isVisible: $letterVisibility[27])
                    LetterView(letter: "Ы", isVisible: $letterVisibility[28])
                    LetterView(letter: "Ь", isVisible: $letterVisibility[29])
                    
                }
                HStack {
                    LetterView(letter: "Э", isVisible: $letterVisibility[30])
                    LetterView(letter: "Ю", isVisible: $letterVisibility[31])
                    LetterView(letter: "Я", isVisible: $letterVisibility[32])
                }
                
                Button("Скрыть буквы") {
                    letterVisibility = letterVisibility.map { _ in Bool.random() }
                    withAnimation(.easeInOut(duration: 0.2)) {
                        scaleAmount = 0.8
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            scaleAmount = 1.0
                        }
                    }
                }
                .font(.system(size: 23))
                .padding(.horizontal, 20)
                .padding(.vertical, 18)
                .background(Color.pink.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(color: Color.gray, radius: 4, x: 5, y: 5)
                .scaleEffect(scaleAmount)
                
                Button("Показать буквы") {
                    letterVisibility = Array(repeating: true, count: 33)
                    withAnimation(.easeInOut(duration: 0.2)) {
                        scaleAmount1 = 0.8
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            scaleAmount1 = 1.0
                        }
                    }
                }
                .font(.system(size: 23))
                .padding(.horizontal, 20)
                .padding(.vertical, 18)
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(color: Color.gray.opacity(0.9), radius: 4, x: 3, y: 5)
                .scaleEffect(scaleAmount1)
              Spacer()
            }
        }
    }
}

struct AlphabetRu_Previews: PreviewProvider {
    static var previews: some View {
      AlphabetRu()
    }
}
