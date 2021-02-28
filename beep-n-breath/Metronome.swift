//
//  Metronome.swift
//  FeelingsFirst
//
//  Created by Jack Lord on 17/03/2019.
//  Copyright © 2019 Jack Lord. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import Combine
import SwiftUI

class Metronome:  ObservableObject {
    
    private let player: AVAudioPlayer
    private let audioPath = Bundle.main.path(forResource: "Click-1Bar-Beep", ofType: "mp3")!
    private let audioURL: URL
    private let avSession = AVAudioSession.sharedInstance()
    
    private var timer : Timer?
    private var timerSubs = Set<AnyCancellable>()
    
    private var startDate: Date?
    private var countUp = true
    
    
    ///The time we run for in seconds
    @Published var duration: Int = 10 {
        didSet{
            UserDefaults.standard.setValue(duration, forKey: "duration")
        }
    }
    
    @Published var count = 0
    
    @Published var playState: PlayState = .isStopped
    enum PlayState {case isPlaying, isStopped}
    
    init() {
        try? avSession.setCategory(.playback, mode: .default, options: .allowBluetooth)
        try? avSession.setActive(true)
        
        audioURL = URL(fileURLWithPath: audioPath)
        player = try! AVAudioPlayer(contentsOf: audioURL)
        player.numberOfLoops = 100
        player.prepareToPlay()
        
        let dur = UserDefaults.standard.integer(forKey: "duration")
        duration = UserDefaults.standard.value(forKey: "duration") == nil ? 60 : dur
    }
    
    deinit {
    }
    
    func start(){
        playState = .isPlaying
        player.currentTime = 0
        player.play()
        startDate = Date()
        count = 1
countUp = true
       
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
          
            if self!.countUp && self!.count == 6 {
                self?.count = 6
                self?.countUp = false
            } else if !self!.countUp && self?.count == 1 {
                self?.countUp = true
                self?.count = -1
            }
            
            if self!.countUp {
                self?.count += 1
            } else {
                self?.count -= 1
            }

            
            if Date().timeIntervalSince(self!.startDate!) >= Double(self!.duration) {
                self?.stop()
            }
        })
        
    }
    
    func stop(){
        player.stop()
        playState = .isStopped
        startDate = nil
        timer?.invalidate()
//        withAnimation {
            count = 0
//        }
        
    }
}

