//
//  SoundService.swift
//  Arithmos
//
//  Created by mio kato on 2022/11/06.
//

import SwiftUI
import AVFoundation

class SoundService {
    private let correctSound = try!  AVAudioPlayer(data: NSDataAsset(name: "correct")!.data)
    private let incorrectSound = try!  AVAudioPlayer(data: NSDataAsset(name: "incorrect")!.data)
    private let congratulationSound = try! AVAudioPlayer(data: NSDataAsset(name: "congratulation")!.data)
    
    func playCorrect() {
        correctSound.play()
    }
    
    func playIncorrect() {
        incorrectSound.play()
    }
    
    func playCongratulation() {
        congratulationSound.play()
    }
}
