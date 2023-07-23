//
//  PostureModel.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI
import Combine

enum Posture {
    case sitting, standing
}

class PostureModel: ObservableObject {
    @AppStorage(PreferenceConstants.isSittingAtLaunch) private var isSittingAtLaunch = true
    @AppStorage(PreferenceConstants.isPausingAtLaunch) private var isPausingAtLaunch = false

    @Published var posture: Posture
    @Published var durationSeconds: Int
    @Published var isTimerRunning: Bool

    private var timer: AnyCancellable?

    var isSitting: Bool {
        posture == Posture.sitting
    }

    init(posture: Posture = Posture.sitting, durationSeconds: Int = 0, isTimerRunning: Bool = false, timer: AnyCancellable? = nil) {
        self.posture = posture
        self.durationSeconds = durationSeconds
        self.isTimerRunning = isTimerRunning
        self.timer = timer

        self.posture = isSittingAtLaunch ? Posture.sitting : Posture.standing

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
