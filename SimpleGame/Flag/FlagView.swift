//
//  ContentView.swift
//  Flag
//
//  Created by user on 21.02.2023.
//

import SwiftUI

struct FlagView: View {

  @State private var countries = ["Флаг Австралии", "Флаг Австрии", "Флаг Азербайджана", "Флаг Албании", "Флаг Алжира", "Флаг Анголы", "Флаг Аргентины", "Флаг Андорры", "Флаг Армении", "Флаг Афганистана", "Флаг Багамских Островов", "Флаг Бангладеш", "Флаг Бахрейна", "Флаг Белиза", "Флаг Руспублики Беларусь", "Флаг Бельгии", "Флаг Бенина", "Флаг Болгарии", "Флаг Боливии", "Флаг Боснии и Герцеговины","Флаг Ботсваны","Флаг Бразилии","Флаг Брунея","Флаг Буркина-Фасо","Флаг Бурунди","Флаг Бутана","Флаг Вануату","Флаг Великобритании","Флаг Венгрии","Флаг Венесуэлы","Флаг Восточного Тимора","Флаг Вьетнама","Флаг Габона","Флаг Гаити","Флаг Гайаны","Флаг Гамбии","Флаг Ганы","Флаг Гватемалы","Флаг Гвинеи","Флаг Гвинеи-Бисау","Флаг Германии","Флаг Гондураса","Палестинский флаг","Флаг Гренады","Флаг Греции","Флаг Грузии","Флаг Дании","Флаг Демократической Республики Конго","Флаг Доминиканской Республики","Флаг Египта","Флаг Замбии","Флаг Зимбабве","Флаг Индии","Флаг Индонезии","Флаг Иордании","Флаг Ирака"].shuffled()

  @AppStorage("score") private var score = 0
  @State private var isAnimating = false
  @State private var correctAnswer = Int.random(in: 0...3)
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var animationAmount: Double = 1

    var body: some View {
        ZStack {
          LinearGradient(gradient: Gradient(stops: [
              .init(color: Color(#colorLiteral(red: 0.4607751966, green: 0.4590293765, blue: 1, alpha: 1)), location: 0),
              .init(color: Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), location: 1)
          ]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0, y: 1))
          .ignoresSafeArea()
          VStack {

            VStack(spacing: 10) {
              Text(countries[correctAnswer])
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
               
              ForEach(0..<3) { number in
                Button {
                  withAnimation(Animation.easeInOut(duration: 0.5)) { // Use a custom animation with a longer duration
                    self.animationAmount += 360
                  }
                  self.flagTapped(number)
                } label: {
                  Image(self.countries[number])
                    .resizable()
                    .renderingMode(.original) // Set the rendering mode to original for better quality
                    .interpolation(.high)
                    .frame(width: 150, height: 100)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                      .strokeBorder(Color.white, lineWidth: 3)) // Use strokeBorder for better quality
                    .clipped()
                    .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                }
                .padding(.vertical,8)
              }
              Spacer()
                .frame(height: 30)
              Text("Cчет \(score)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .cornerRadius(30)

            }
            .padding(.bottom, showingScore ? 100 : 0)
            Button(action: {
              withAnimation(.easeOut(duration: 1)) { // Use withAnimation instead
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
            scoreTitle = "Неправильно! Это \(countries[number])"
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
