//
//  SoundView.swift
//  SimpleGame
//
//  Created by user on 29.03.2023.
//

import SwiftUI
import AVKit

class SoundManager: ObservableObject {
    static let instance = SoundManager()


    var audioPlayer: AVAudioPlayer?

    init() {
        loadAudioPlayer(for: "Капля 1")
    }

  func loadAudioPlayer(for audio: String) {
        guard let audioPath = Bundle.main.path(forResource: audio, ofType: "mp3") else { return }
        let audioUrl = URL(fileURLWithPath: audioPath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
        }
    }

    func playSound() {
        audioPlayer?.currentTime = 0
        audioPlayer?.play()
    }
}



struct SelectAudio: View {
  
  @StateObject var soundManager = SoundManager.instance
  @AppStorage("Audio") private var selectedAudio = "Капля 1"
     let audioOptions = ["Капля 1", "Капля 2", "Щелчок 1", "Щелчок 2", "Пузырь 1"]

    var body: some View {
        VStack {
          Picker(selection: $selectedAudio, label: Image(systemName: "gear"), content: {
              ForEach(audioOptions, id: \.self) { option in
                  Text(option).tag(option)
              }
          })
          .pickerStyle(.wheel)

                      .padding()

                      Button("Play") {
                          soundManager.loadAudioPlayer(for: selectedAudio)
                          soundManager.playSound()
                      }
                      .font(.system(size: 25))
                      .foregroundColor(.white)
                      .padding(.horizontal, 40)
                      .background(Color.black)
                      .cornerRadius(25)
        }
    }
}

struct SelectAudio_Previews: PreviewProvider {
    static var previews: some View {
        SelectAudio()
    }
}
