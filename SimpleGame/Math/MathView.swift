//
//  ContentView.swift
//  MathGame
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI

struct MathView: View {
  @State private var isAnimating = true
  @State private var correctAnswer = 0
  @State private var opacity = 0.0
  @State private var degress = 0.0
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
        switch score  {
        case 2:

          Text("Ты молодец!")
            .font(.largeTitle)
            .foregroundColor(.red)
            .fontWeight(.semibold)
            .rotationEffect(.degrees(degress))
            .opacity(opacity)
            .animation(.easeInOut(duration: 2.0))
            .onAppear {
              withAnimation {
                self.opacity = 1.0
                self.degress = 360
              }
            }
        case 20:
          Text("Превосходно!")
            .font(.largeTitle)
            .foregroundColor(.red)
            .fontWeight(.semibold)
            .rotationEffect(.degrees(degress))
            .opacity(opacity)
            .animation(.easeInOut(duration: 2.0))
            .onAppear {
              withAnimation {
                self.opacity = 1.0
                self.degress = 360
              }
            }

        case 30:
          Text("Да ты гений!")
            .font(.largeTitle)
            .foregroundColor(.red)
            .fontWeight(.semibold)
            .rotationEffect(.degrees(degress))
            .opacity(opacity)
            .animation(.easeInOut(duration: 2.0))
            .onAppear {
              withAnimation {
                self.opacity = 1.0
                self.degress = 360
              }
            }
        case 40:
          Text("Класс!")
            .font(.largeTitle)
            .foregroundColor(.red)
            .fontWeight(.semibold)
            .rotationEffect(.degrees(degress))
            .opacity(opacity)
            .animation(.easeInOut(duration: 2.0))
            .onAppear {
              withAnimation {
                self.opacity = 1.0
                self.degress = 360
              }
            }

        case 50:
          Text("Ты супер!")
            .font(.largeTitle)
            .foregroundColor(.red)
            .fontWeight(.semibold)
            .rotationEffect(.degrees(degress))
            .opacity(opacity)
            .animation(.easeInOut(duration: 2.0))
            .onAppear {
              withAnimation {
                self.opacity = 1.0
                self.degress = 360
              }
            }

        default:
          Text("")
        }

                Text("Сколько будет ")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 35, weight: .semibold))
            

                
                Text("\(firstNumber) + \(secondNumber)")
                    .font(.system(size: 50, weight: .bold))
                    .bold()
                    .padding()

                    .background(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)).cornerRadius(40)
                    .padding()
                
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
                
                
                Text("Счет: \(score)")
                    .font(.system(size: 30, weight: .bold))
                    .bold()
                
                
              Button(action: {
                withAnimation(.easeOut(duration: 2.0)) {
                  score = 0
                  isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
                  .animation(.easeInOut(duration: 0.5))

            }
                
                Text("Уровень сложности")
              withAnimation(.easeInOut(duration: 0.5)) {
                  Picker(selection: $difficulty, label:
                          Text("Level")) {
                      ForEach(0..<difficultyArray.count) {
                          Text("\(difficultyArray[$0])")
                      }
                  }
                  .pickerStyle(SegmentedPickerStyle())
              }
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

//struct TextModifier: ViewModifier {
//
//
//  var opacity: Double
//  var degrees: Double
//  mutating func body(content: Content) -> some View {
//    content
//      .font(.largeTitle)
//      .foregroundColor(.red)
//      .rotationEffect(.degrees(self.degrees))
//      .opacity(self.opacity)
//      .animation(.easeInOut(duration: 2.0))
//      .onAppear {
//        withAnimation {
//          self.opacity = 1.0
//          self.degrees = 360
//        }
//      }
//  }
//}

