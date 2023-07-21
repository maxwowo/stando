//
//  TimerModel.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

class TimerModel: ObservableObject {
    @Published var durationSeconds = 0
    
    private var timer: Timer?
    
    init(durationSeconds: Int = 0, timer: Timer? = nil) {
        self.durationSeconds = durationSeconds
        self.timer = timer
    }
    
    deinit {
        stopTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.durationSeconds += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        stopTimer()
        
        durationSeconds = 0
        
        startTimer()
    }
}
