//
//  WelcomeView.swift
//  SimpleGame
//
//  Created by user on 31.03.2023.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
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
            NavigationLink(destination: AlphabetRu()) {
              Text("Алфавит")
                .modifier(TextModifier(color: .green))
            }
            NavigationLink(destination: AlphabetEn()) {
              Text("Alphabet")
                .modifier(TextModifier(color: .orange))
            }
            
            NavigationLink(destination: MathView()) {
              Text("Математика")
                .modifier(TextModifier(color: .purple))
            }
            
            NavigationLink(destination: FlagView()) {
              Text("Угадай флаг")
                .modifier(TextModifier(color: .blue))
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

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}


struct TextModifier: ViewModifier {
let color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30))
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(30)
    }
}
