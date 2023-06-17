//
//  AudioPlayerManager.swift
//  BrainRushZap
//
//  Created by Вадим on 04.05.2023.
//

import AVFoundation

class AudioPlayerManager {
    static let shared = AudioPlayerManager()

    private var audioPlayer: AVAudioPlayer?
    private var soundEffectPlayer: AVAudioPlayer?
    private var vzuxPlayer: AVAudioPlayer?
    private var appearancePlayer: AVAudioPlayer?
    private var tikPlayer: AVAudioPlayer?
    private var timeOutPlayer: AVAudioPlayer?
    private var incorrectСhoicePlayer: AVAudioPlayer?
    private var correctСhoicePlayer: AVAudioPlayer?

    private init() {
        guard let audioURL = Bundle.main.url(forResource: "audio", withExtension: "mp3") else { return }
        audioPlayer = try? AVAudioPlayer(contentsOf: audioURL)
        audioPlayer?.numberOfLoops = -1
        audioPlayer?.prepareToPlay()

        guard let soundEffectURL = Bundle.main.url(forResource: "click", withExtension: "mp3") else { return }
        soundEffectPlayer = try? AVAudioPlayer(contentsOf: soundEffectURL)
        soundEffectPlayer?.numberOfLoops = 0
        soundEffectPlayer?.prepareToPlay()
        
        guard let vzuxURL = Bundle.main.url(forResource: "vzux", withExtension: "mp3") else { return }
        vzuxPlayer = try? AVAudioPlayer(contentsOf: vzuxURL)
        vzuxPlayer?.numberOfLoops = 0
        vzuxPlayer?.prepareToPlay()
        
        guard let appearanceURL = Bundle.main.url(forResource: "appearance", withExtension: "mp3") else { return }
        appearancePlayer = try? AVAudioPlayer(contentsOf: appearanceURL)
        appearancePlayer?.numberOfLoops = 0
        appearancePlayer?.prepareToPlay()
        
        guard let tikURL = Bundle.main.url(forResource: "tik", withExtension: "mp3") else { return }
        tikPlayer = try? AVAudioPlayer(contentsOf: tikURL)
        tikPlayer?.numberOfLoops = 0
        tikPlayer?.prepareToPlay()
        
        guard let timeOutURL = Bundle.main.url(forResource: "timeOut", withExtension: "mp3") else { return }
        timeOutPlayer = try? AVAudioPlayer(contentsOf: timeOutURL)
        timeOutPlayer?.numberOfLoops = 0
        timeOutPlayer?.prepareToPlay()
        
        guard let incorrectСhoiceURL = Bundle.main.url(forResource: "incorrect choice", withExtension: "mp3") else { return }
        incorrectСhoicePlayer = try? AVAudioPlayer(contentsOf: incorrectСhoiceURL)
        incorrectСhoicePlayer?.numberOfLoops = 0
        incorrectСhoicePlayer?.prepareToPlay()
        
        guard let correctСhoiceURL = Bundle.main.url(forResource: "correct choice", withExtension: "mp3") else { return }
        correctСhoicePlayer = try? AVAudioPlayer(contentsOf: correctСhoiceURL)
        correctСhoicePlayer?.numberOfLoops = 0
        correctСhoicePlayer?.prepareToPlay()
    }

    
    func play() {
        audioPlayer?.play()
    }

    func pause() {
        audioPlayer?.pause()
    }
    
    func playSoundEffect() {
        soundEffectPlayer?.play()
    }

    func stopSoundEffect() {
        soundEffectPlayer?.stop()
    }
    
    func playvzux() {
        vzuxPlayer?.play()
    }

    func stopvzux() {
        vzuxPlayer?.stop()
    }
    
    func playAppearance() {
        appearancePlayer?.play()
    }

    func stopAppearance() {
        appearancePlayer?.stop()
    }
    
    func playTik() {
        tikPlayer?.currentTime = 0
        tikPlayer?.play()
    }

    func stopTik() {
        tikPlayer?.stop()
    }
    
    func playtimeOut() {
        timeOutPlayer?.play()
    }

    func stoptimeOut() {
        timeOutPlayer?.stop()
    }
    
    func playincorrectСhoice() {
        incorrectСhoicePlayer?.play()
    }

    func stopincorrectСhoice() {
        incorrectСhoicePlayer?.stop()
    }
    
    func playcorrectСhoice() {
        correctСhoicePlayer?.play()
    }

    func stopcorrectСhoice() {
        correctСhoicePlayer?.stop()
    }

}
