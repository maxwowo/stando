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

class MovementModel: ObservableObject {
    @AppStorage(PreferenceConstants.isSittingAtLaunch) private var isSittingAtLaunch = true
    @AppStorage(PreferenceConstants.isPausingAtLaunch) private var isPausingAtLaunch = false

    @Published var posture: Posture
    @Published var durationSeconds: Int
    @Published var isPaused: Bool

    private var timer: AnyCancellable?

    var isSitting: Bool {
        posture == Posture.sitting
    }

    init(
        posture: Posture = Posture.sitting,
        durationSeconds: Int = 0,
        isPaused: Bool = true,
        timer: AnyCancellable? = nil
    ) {
        self.posture = posture
        self.durationSeconds = durationSeconds
        self.isPaused = isPaused
        self.timer = timer

        self.posture = isSittingAtLaunch ? Posture.sitting : Posture.standing

        if !isPausingAtLaunch {
            start()
        }
    }

    deinit {
        pause()
    }

    func start() {
        guard isPaused else {
            return
        }

        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.durationSeconds += 1
            }

        isPaused = false
    }

    func pause() {
        timer?.cancel()

        timer = nil

        isPaused = true
    }

    func resume() {
        start()
    }

    func restart() {
        pause()

        durationSeconds = 0

        start()
    }
}
