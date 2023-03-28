//
//  SwiftUIView.swift
//  SimpleGame
//
//  Created by user on 28.03.2023.
//
import SwiftUI

struct SwiftUIView: View {
  @State private var score = 0
  @State private var opacity = 0.0
  @State private var opacity1 = 0.0
  @State private var opacity2 = 0.0
  @State private var opacity3 = 0.0

  var body: some View {
    VStack {
      Button("Button") {
        score += 1
      }

      switch score {
      case 1:

        Text("You got 1 point!")
                  .font(.largeTitle)
                  .fontWeight(.bold)
                  .opacity(opacity)
                  .animation(.easeInOut(duration: 5.0))
                  .onAppear {
                    withAnimation {
                      self.opacity = 1.0
                    }
                  }

      case 2:
        Text("You got 2 points!")
          .font(.largeTitle)
          .fontWeight(.bold)
          .opacity(opacity1)
          .animation(.easeInOut(duration: 5.0))
          .onAppear {
            withAnimation {
              self.opacity1 = 1.0
            }
          }

      case 3:
        Text("You got 3 points!") 
          .font(.largeTitle)
          .fontWeight(.bold)
          .opacity(opacity2)
          .animation(.easeInOut(duration: 5.0))
          .onAppear {
            withAnimation {
              self.opacity2 = 1.0
            }
          }

      case 4:
        Text("You got 4 points!")
          .font(.largeTitle)
          .fontWeight(.bold)

      default:
        Text("Keep going!")
          .font(.largeTitle)
          .fontWeight(.bold)
      }
    }
  }
}



struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIView()
  }
}
