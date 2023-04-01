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
         loadAudioPlayer(for: selectedAudioOption)
     }

     @AppStorage("SelectedAudioOption") var selectedAudioOption: String = "Капля 1" {
         didSet {
             loadAudioPlayer(for: selectedAudioOption)
         }
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

  var audioOptions = ["Капля 1", "Капля 2", "Щелчок 1", "Щелчок 2", "Пузырь 1"]

    var body: some View {
        VStack {
          Picker("Select Audio", selection: $soundManager.selectedAudioOption) {
                         ForEach(audioOptions, id: \.self) { option in
                             Text(option)
                         }
                     }
          .pickerStyle(.wheel)
                      .padding()

                      Button("Play") {
                          soundManager.playSound()
                      }
                      .font(.system(size: 25))
                      .foregroundColor(.white)
                      .padding(.horizontal, 40)
                      .padding(.vertical, 10)
                      .background(Color.blue)
                      .cornerRadius(25)
        }


    }
}

struct SelectAudio_Previews: PreviewProvider {
    static var previews: some View {
        SelectAudio()
    }
}
