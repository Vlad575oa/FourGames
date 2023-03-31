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

  @StateObject var soundManager = SoundManager.instance
  @State var selectedAudio = "Капля 1"
  @State var audioOptions = ["Капля 1", "Капля 2", "Щелчок 1","Щелчок 2","Пузырь 1"]


    var body: some View {
      ZStack {
        LinearGradient(gradient: Gradient(stops: [
            .init(color: Color(#colorLiteral(red: 0.4607751966, green: 0.4590293765, blue: 1, alpha: 1)), location: 0),
            .init(color: Color(#colorLiteral(red: 1, green: 0.3152733147, blue: 0.381154716, alpha: 1)), location: 1)
        ]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0, y: 1))
        .ignoresSafeArea()
        VStack {
              TextField("Имя", text: $name)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()

              TextField("Email", text: $email)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()

              TextField("Телефон", text: $mobile)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding()
          Picker("Select Audio", selection: $selectedAudio) {
                          ForEach(audioOptions, id: \.self) { option in
                              Text(option)
                          }
                      }
                      .pickerStyle(.segmented)
                      .padding()

                      Button("Play Audio") {
                          soundManager.loadAudioPlayer(for: selectedAudio)
                          soundManager.playSound()
                      }
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

