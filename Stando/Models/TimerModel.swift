//
//  TimerModel.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI
import Combine

class TimerModel: ObservableObject {
    @AppStorage(PreferenceConstants.isPausingAtLaunch) private var isPausingAtLaunch = false

    @Published var durationSeconds: Int
    @Published var isTimerRunning: Bool

    private var timer: Timer?

    init(durationSeconds: Int = 0, isTimerRunning: Bool = false, timer: Timer? = nil) {
        self.durationSeconds = durationSeconds
        self.isTimerRunning = isTimerRunning
        self.timer = timer

        if !isPausingAtLaunch {
            startTimer()
        }
    }

    deinit {
        stopTimer()
    }

    func startTimer() {
        guard !isTimerRunning else {
            return
        }

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.durationSeconds += 1
        }

        if let unwrappedTimer = timer {
            // We need to add the timer to the RunLoop since otherwise when the gear icon is clicked and the menu
            // opens, the timer would stop
            RunLoop.main.add(unwrappedTimer, forMode: .common)
        }

        isTimerRunning = true
    }

    func stopTimer() {
        timer?.invalidate()

        timer = nil

        isTimerRunning = false
    }

    func resumeTimer() {
        startTimer()
    }

    func resetTimer() {
        stopTimer()

        durationSeconds = 0

        startTimer()
    }
}
