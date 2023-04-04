//
//  ContentView.swift
//  MathGame
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI

struct MathView: View {
  @State private var isAnimating = false
  @State private var correctAnswer = 0
  @State private var opacity = 0.0
  @State private var degress = 0.0
  @State private var choiceArray = [0, 1, 2, 3]
  @State private var firstNumber = 0
  @State private var secondNumber = 0
  @State private var difficulty = 0
  @AppStorage("scoreMath") private var score = 0

  var difficultyArray = [30, 50, 100, 500, 1000]

  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.green, .yellow, .blue]),startPoint: .top, endPoint: .bottom ).ignoresSafeArea()

      VStack {
        Text("Сколько будет ")
          .multilineTextAlignment(.center)
          .font(.system(size: 35, weight: .semibold))
    

        Text("\(firstNumber) + \(secondNumber)")
          .font(.system(size: 45, weight: .bold))
          .bold()
          .padding()
          .background(LinearGradient(colors: [.purple, .blue], startPoint:.leading, endPoint: .trailing)).cornerRadius(40)
          .shadow(color: Color.gray.opacity(0.9), radius: 4, x: 5, y: 5)

        HStack {

          ForEach(0..<2) {index in
            Button {
              answerIsCorrect(answer: choiceArray[index])
              generateAnswers()
              opacity = 0.0
              degress = 0

            } label: {
              AnswerButton(number: choiceArray[index])
            }
          }
        }

        HStack {
          ForEach(2..<4) {index in
            Button {
              answerIsCorrect(answer: choiceArray[index])
              generateAnswers()
              opacity = 0.0
            } label: {
              AnswerButton(number: choiceArray[index])
            }
          }
        }
        Spacer()
        VStack {
          Text("Счет: \(score)")
            .font(.system(size: 35, weight: .bold))
            .shadow(color: Color.gray.opacity(0.9), radius: 4, x: 5, y: 5)

          Button(action: {
            withAnimation(.easeOut(duration: 0.5)) {
              score = 0
              isAnimating = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
              isAnimating = false
              score = 0
            }
          }) {
            Text("Сбросить счет")
              .font(.system(size: 25, weight: .medium))
              .font(.headline)
              .foregroundColor(.black)
              .padding()
              .background(isAnimating ? Color.green : Color.blue)
              .cornerRadius(15)
              .scaleEffect(isAnimating ? 1.2 : 1.0)
              .shadow(color: Color.gray.opacity(0.9), radius: 4, x: 5, y: 5)
          }

          Spacer()

          Text("Уровень сложности")
          withAnimation(.easeInOut(duration: 0.5)) {
            Picker(selection: $difficulty, label:
                    Text("Level")) {
              ForEach(0..<difficultyArray.count, id: \.self) {
                Text("\(difficultyArray[$0])")
              }
            }
              .pickerStyle(SegmentedPickerStyle())
          }
        }
        Spacer()
      }
    }
  }

  func answerIsCorrect(answer: Int){
    if answer == correctAnswer {
      self.score += 1
    } else {
      self.score -= 1
    }
  }

  func generateAnswers(){
    firstNumber = Int.random(in: 1...(difficultyArray[difficulty]/2))
    secondNumber = Int.random(in: 1...(difficultyArray[difficulty]/2))
    var answerList = [Int]()
    correctAnswer = firstNumber + secondNumber

    for _ in 0...2 {
      answerList.append(Int.random(in: 1...difficultyArray[difficulty]))
    }
    answerList.append(correctAnswer)
    choiceArray = answerList.shuffled()
  }
}

struct MathView_Previews: PreviewProvider {
  static var previews: some View {
    MathView()
  }
}


