//
//  SettingsView.swift
//  Alphabet
//
//  Created by user on 28.03.2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("name") private var name = ""
    @AppStorage("email") private var email = ""
    @AppStorage("mobile") private var mobile = ""

    var body: some View {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [.yellow, .green.opacity(0.5)]),startPoint: .top, endPoint: .bottom ).ignoresSafeArea()
          .ignoresSafeArea()
        VStack {
              TextField("Name", text: $name)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()

              TextField("Email", text: $email)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()

              TextField("Mobile", text: $mobile)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()

              Spacer()
          }
      }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

