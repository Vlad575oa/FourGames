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
        loadAudioPlayer(for: "Капля1")
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



struct NewView: View {
    @StateObject var soundManager = SoundManager.instance
    @State var selectedAudio = "капля"

    var body: some View {
        VStack {
            Picker("Select Audio", selection: $selectedAudio) {
              Text("Капля1").tag("Капля1")
              Text("Капля2").tag("Капля2")
              Text("Пузырь1").tag("Пузырь1")
            }
            .pickerStyle(.wheel)
            .padding()

            Button("Play Audio") {
                soundManager.loadAudioPlayer(for: selectedAudio)
                soundManager.playSound()
            }
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
