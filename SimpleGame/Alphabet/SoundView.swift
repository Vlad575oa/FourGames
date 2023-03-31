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
        loadAudioPlayer()
    }

    func loadAudioPlayer() {
        guard let audioPath = Bundle.main.path(forResource: "капля", ofType: "mp3") else { return }
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

    var body: some View {
        Button("Play Audio") {
            soundManager.playSound()
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
