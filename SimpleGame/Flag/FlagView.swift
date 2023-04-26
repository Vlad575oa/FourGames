//
//  ContentView.swift
//  Flag
//
//  Created by user on 21.02.2023.
//

import SwiftUI

struct FlagView: View {

  private var countries = Flags()

  @AppStorage("scoreFlag") private var score = 0
  @State private var isAnimating = false
  @State private var correctAnswer = Int.random(in: 0...3)
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var animationAmount: Double = 0
  @State private var colorCorrectAnswer: Color = .white



    var body: some View {
        ZStack {
          LinearGradient(gradient: Gradient(stops: [
              .init(color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), location: 0),
              .init(color: Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), location: 2)
          ]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0, y: 1))
          .ignoresSafeArea()
          VStack {

            VStack(spacing: 10) {
              Text(countries.array[correctAnswer])
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.title)
                .padding(.horizontal, 5)
               
              VStack {
                ForEach(0..<3) { number in
                  Button {
                    withAnimation(Animation.easeInOut(duration: 0.9)) {
                      self.animationAmount += 360
                      self.colorCorrectAnswer = .green
                    }
                    self.flagTapped(number)
                  } label: {
                    Image(self.countries.array[number])
                      .resizable()
                      .renderingMode(.original)
                      .interpolation(.high)
                      .frame(width: 150, height: 100)
                      .cornerRadius(20)
                      .overlay(RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(number == correctAnswer ? colorCorrectAnswer : .white, lineWidth: 5))
                      .clipped()
                      .shadow(color: Color.gray.opacity(0.9), radius: 4, x: 5, y: 5)
                      .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                  }
                  .padding(.vertical,8)
                }
              }
              Spacer()
                .frame(height: 30)
              Text("Cчет \(score)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .cornerRadius(30)

            }

            Button(action: {
              withAnimation(.easeOut(duration: 0.7)) { // Use withAnimation instead
                score = 0
                isAnimating = true
              }
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                isAnimating = false
                score = 0
              }
            }) {
              Text("Сбросить счет")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(isAnimating ? Color.green : Color.blue)
                .cornerRadius(15)
                .scaleEffect(isAnimating ? 1.2 : 1.0)

            }
            Spacer()
          }
            .actionSheet(isPresented: $showingScore) {
                            ActionSheet(
                                title: Text(scoreTitle)
                                  .foregroundColor(.red)
                                  .font(.headline),
                                message: Text("Общий счет \(score)")
                                  .font(.headline)
                                ,
                                buttons: [
                                    .default(Text("Продолжить")) {
                                      self.colorCorrectAnswer = .white
                                        self.askQuestion()
                                    },  .default(Text("")) {

                                    }
                                ]
                            )
                        }

        }
    }

    func askQuestion() {
      countries.array.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Правильный ответ!"
            score += 1



        } else {
          scoreTitle = """
Вы выбрали \(countries.array[number])

Правильый ответ \(correctAnswer + 1)

"""


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
