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
                HStack {
                    LetterViewRu(letter: "А", isVisible: $letterVisibility[0])
                    LetterViewRu(letter: "Б", isVisible: $letterVisibility[1])
                    LetterViewRu(letter: "В", isVisible: $letterVisibility[2])
                    LetterViewRu(letter: "Г", isVisible: $letterVisibility[3])
                    LetterViewRu(letter: "Д", isVisible: $letterVisibility[4])
                }
                
                HStack {
                    LetterViewRu(letter: "Е", isVisible: $letterVisibility[5])
                    LetterViewRu(letter: "Ё", isVisible: $letterVisibility[6])
                    LetterViewRu(letter: "Ж", isVisible: $letterVisibility[7])
                    LetterViewRu(letter: "З", isVisible: $letterVisibility[8])
                    LetterViewRu(letter: "И", isVisible: $letterVisibility[9])
                }
                
                HStack {
                    LetterViewRu(letter: "Й", isVisible: $letterVisibility[10])
                    LetterViewRu(letter: "К", isVisible: $letterVisibility[11])
                    LetterViewRu(letter: "Л", isVisible: $letterVisibility[12])
                    LetterViewRu(letter: "М", isVisible: $letterVisibility[13])
                    LetterViewRu(letter: "Н", isVisible: $letterVisibility[14])
                }
                
                HStack {
                    LetterViewRu(letter: "О", isVisible: $letterVisibility[15])
                    LetterViewRu(letter: "П", isVisible: $letterVisibility[16])
                    LetterViewRu(letter: "Р", isVisible: $letterVisibility[17])
                    LetterViewRu(letter: "С", isVisible: $letterVisibility[18])
                    LetterViewRu(letter: "Т", isVisible: $letterVisibility[19])
                }
                
                HStack {
                    LetterViewRu(letter: "У", isVisible: $letterVisibility[20])
                    LetterViewRu(letter: "Ф", isVisible: $letterVisibility[21])
                    LetterViewRu(letter: "Х", isVisible: $letterVisibility[22])
                    LetterViewRu(letter: "Ц", isVisible: $letterVisibility[23])
                    LetterViewRu(letter: "Ч", isVisible: $letterVisibility[24])
                }
                HStack {
                    LetterViewRu(letter: "Ш", isVisible: $letterVisibility[25])
                    LetterViewRu(letter: "Щ", isVisible: $letterVisibility[26])
                    LetterViewRu(letter: "Ъ", isVisible: $letterVisibility[27])
                    LetterViewRu(letter: "Ы", isVisible: $letterVisibility[28])
                    LetterViewRu(letter: "Ь", isVisible: $letterVisibility[29])
                    
                }
                HStack {
                    LetterViewRu(letter: "Э", isVisible: $letterVisibility[30])
                    LetterViewRu(letter: "Ю", isVisible: $letterVisibility[31])
                    LetterViewRu(letter: "Я", isVisible: $letterVisibility[32])
                }
                
                Button("Скрыть буквы") {
                    letterVisibility = letterVisibility.map { _ in Bool.random() }
                    withAnimation(.easeInOut(duration: 0.2)) {
                        scaleAmount = 0.9
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
                .padding()
                .scaleEffect(scaleAmount)
                
                Button("Показать буквы") {
                    letterVisibility = Array(repeating: true, count: 33)
                    withAnimation(.easeInOut(duration: 0.2)) {
                        scaleAmount1 = 0.9
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
                .padding()
                .scaleEffect(scaleAmount1)
            }
        }
    }
}

struct AlphabetRu_Previews: PreviewProvider {
    static var previews: some View {
      AlphabetRu()
    }
}
