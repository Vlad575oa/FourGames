//
//  SwiftUIView.swift
//  SimpleGame
//
//  Created by user on 31.03.2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
      TabView {
          AlphabetEn()
              .tabItem {
                  Text("Alphabet")
              }
          VStack {
              Button(action: {
                  // action for audio button
              }) {
                  Image(systemName: "speaker.fill")
                      .font(.system(size: 30))
                      .foregroundColor(.blue)
                  Text("audio")
              }
          }
          .tabItem {
              Text("Audio")
          }
      }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
