//
//  TabBar View.swift
//  Alphabet
//
//  Created by user on 26.03.2023.
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        TabView {
          NavigationView {
            ZStack {
              LinearGradient(gradient: Gradient(colors: [Color.green, Color.indigo, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
              VStack(spacing: 20){
                Text("Добро пожаловать в мое приложение")
                  .font(.largeTitle)
                  .fontWeight(.medium)
                  .padding(.top, 50)
                  .multilineTextAlignment(.center)

                Spacer()

                VStack(spacing: 35) {
                  NavigationLink(destination: FirstViewRu()) {
                    Text("Алфавит")
                      .font(.system(size: 30))
                      .padding(.horizontal, 20)
                      .padding(.vertical, 20)
                      .background(Color.green)
                      .foregroundColor(.white)
                      .cornerRadius(30)
                  }
                  NavigationLink(destination: FirstView()) {
                    Text("Alphabet")
                      .font(.system(size: 30))
                      .padding(.horizontal, 20)
                      .padding(.vertical, 20)
                      .background(Color.orange)
                      .foregroundColor(.white)
                      .cornerRadius(30)
                  }

                  NavigationLink(destination: MathView()) {
                    Text("Математика")
                      .font(.system(size: 30))
                      .padding(.horizontal, 20)
                      .padding(.vertical, 20)
                      .background(Color.purple)
                      .foregroundColor(.white)
                      .cornerRadius(30)
                  }

                  NavigationLink(destination: FlagView()) {
                    Text("Угадай флаг")
                      .font(.system(size: 30))
                      .padding(.horizontal, 20)
                      .padding(.vertical, 20)
                      .background(Color.blue)
                      .foregroundColor(.white)
                      .cornerRadius(30)
                  }

                }



                Spacer()
              }
              .navigationBarTitle("Меню", displayMode: .inline)
              .foregroundColor(.white)
              .navigationBarItems(leading:
                                    Button(action: {
              }) {

              },trailing:
                NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
                  .foregroundColor(.white)
              }
              )
            }
          }

        }
    }
}

struct ThirdView: View {
    var body: some View {
        Text("Third View")
    }
}

struct FourthView: View {
    var body: some View {
        Text("Fourth View")
    }
}

struct Menu: View {
    var body: some View {
        Text("Fifth View")
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

