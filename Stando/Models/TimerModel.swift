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

    private var timer: AnyCancellable?

    init(durationSeconds: Int = 0, isTimerRunning: Bool = false, timer: AnyCancellable? = nil) {
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

        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.durationSeconds += 1
            }

        isTimerRunning = true
    }

    func stopTimer() {
        timer?.cancel()

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
