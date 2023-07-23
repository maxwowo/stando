//
//  CountdownView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct CountdownView: View {
    @AppStorage(PreferenceConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(PreferenceConstants.standDurationSeconds) private var standDurationSeconds = 2700

    @EnvironmentObject private var movement: MovementModel

    private var postureIcon: String {
        movement.isSitting ? "figure.seated.side" : "figure.stand"
    }

    private var formattedRemainingTime: String {
        let durationSeconds = movement.isSitting ? sitDurationSeconds : standDurationSeconds

        let remainingDurationSeconds = durationSeconds - movement.durationSeconds

        return String(format: "%02d:%02d", remainingDurationSeconds / 60, remainingDurationSeconds % 60)
    }

    var body: some View {
        VStack(spacing: 4) {
            Text(formattedRemainingTime)
                .font(.largeTitle)
                .monospacedDigit()
            Text("\(Image(postureIcon)) \(movement.isSitting ? "Sitting" : "Standing")")
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        let userDefaults: UserDefaults = {
            let defaults = UserDefaults()

            defaults.set(true, forKey: PreferenceConstants.isPausingAtLaunch)

            return defaults
        }()

        CountdownView()
            .environmentObject(MovementModel(posture: Posture.sitting, durationSeconds: 123))
            .defaultAppStorage(userDefaults)
    }
}
