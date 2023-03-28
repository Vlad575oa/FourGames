//
//  ContentView.swift
//  MathGame
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI

struct MathView: View {
    @State private var correctAnswer = 0
    @State private var choiceArray = [0, 1, 2, 3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
  
    @AppStorage("score") private var score = 0
    @State private var difficulty = 0
  
    var difficultyArray = [30, 50, 100, 500, 1000]
    
    var body: some View {
        ZStack {
            Color.white
            LinearGradient(gradient: Gradient(colors: [.green, .yellow, .blue]),startPoint: .top, endPoint: .bottom ).ignoresSafeArea()
            
            VStack {
                Text("Сколько будет ")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 35, weight: .semibold))
            
                    switch score  {
                    case 3:
//                        withAnimation(.spring()) {
                            Text("Ты молодец!")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.red)
                        
                    case 5:
                        Text("Умница!")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.blue)
                    case 10:
                        Text("Да ты гений!")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.green)
                    case 15:
                        Text("Класс!")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                    case 20:
                        Text("Ты супер умная!")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.orange)
                    case 30:
                        Text("Ты лучшая!")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.green)
                            .padding()
                        Image(systemName: "sun.max").font(.system(size: 30, weight: .bold))
                        
                    default:
                        Text("")
                    }
                
                
                Text("\(firstNumber) + \(secondNumber)")
                    .font(.system(size: 50, weight: .bold))
                    .bold()
                    .padding()
                    .padding(.horizontal, 60)
                    .background(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)).cornerRadius(40)
                    .padding()
                
                HStack {
                    
                    ForEach(0..<2) {index in
                        Button {
                            answerIsCorrect(answer: choiceArray[index])
                            generateAnswers()
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
                        } label: {
                            AnswerButton(number: choiceArray[index])
                        }
                    }
                }
                
                
                Text("Счет: \(score)")
                    .font(.system(size: 30, weight: .bold))
                    .bold()
                
                
                Button("Сбросить счет") {
                    score = 0
                }
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .bold))
                .padding()
                
                Text("Уровень сложности")
                .font(.system(size: 20, weight: .bold))
                
                Picker(selection: $difficulty, label:
                        Text("level")) {
                    ForEach(0..<difficultyArray.count) { Text("\(difficultyArray[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
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
