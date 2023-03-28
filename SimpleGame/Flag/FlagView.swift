//
//  ContentView.swift
//  Flag
//
//  Created by user on 21.02.2023.
//

import SwiftUI

struct FlagView: View {

    @State private var countries = ["Argentina", "Bangladesh", "Brazil", "China", "Colombian", "Egypt", "Europe", "France", "Germany", "Greece", "India", "Indonesia", "Iran", "Italy", "Mexico", "Philippines", "Russia", "Sweden", "Thailand"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...3)
    @AppStorage("score") private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var animationAmount: Double = 1

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black.opacity(0.9)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            VStack {

                VStack(spacing: 10) {
                    Text("Флаг")
                        .foregroundColor(.black)
                        .font(.largeTitle)

                    Text(countries[correctAnswer])
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .padding()
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation {
                                self.animationAmount += 360
                            }
                            self.flagTapped(number)
                        } label: {
                            Image(self.countries[number])
                                .resizable()
                                .interpolation(.high)
                                .frame(width: 150, height: 100)
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 3))
                                .clipped()
                                .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                        }
                        .padding(.vertical,10)
                    }
                    Spacer()
                        .frame(height: 30)
                    Text("Cчет \(score)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                        .padding(.horizontal, 10)
                        .cornerRadius(30)

                }
                .padding(.bottom, showingScore ? 100 : 0)
                Spacer()
            }
            .actionSheet(isPresented: $showingScore) {
                            ActionSheet(
                                title: Text(scoreTitle)
                                  .font(.headline),
                                message: Text("Общий счет \(score)")
                                  .font(.headline),
                                buttons: [
                                    .default(Text("Продолжить")) {
                                        self.askQuestion()
                                    },
                                    .cancel()
                                ]
                            )
                        }


        }
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Правильный ответ!"
            score += 1
        } else {
            scoreTitle = "Неправильно! Это флаг \(countries[number])"
            score -= 1
        }
        showingScore = true
    }
}


struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView()
    }
}
