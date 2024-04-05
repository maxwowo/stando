//
//  CountdownView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct CountdownView: View {
    @AppStorage(SettingConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(SettingConstants.standDurationSeconds) private var standDurationSeconds = 2700

    @EnvironmentObject private var movementModel: MovementModel

    private var postureIcon: String {
        movementModel.isSitting ? "figure.seated.side" : "figure.stand"
    }

    private var formattedRemainingTime: String {
        let durationSeconds = movementModel.isSitting ? sitDurationSeconds : standDurationSeconds

        let remainingDurationSeconds = durationSeconds - movementModel.durationSeconds

        return String(format: "%02d:%02d", remainingDurationSeconds / 60, remainingDurationSeconds % 60)
    }

    var body: some View {
        VStack(spacing: 4) {
            Text(formattedRemainingTime)
                .font(.largeTitle)
                .monospacedDigit()
            Text("\(Image(postureIcon)) \(movementModel.isSitting ? "Sitting" : "Standing")")
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        let userDefaults: UserDefaults = {
            let defaults = UserDefaults()

            defaults.set(true, forKey: SettingConstants.isPausingAtLaunch)

            return defaults
        }()

        CountdownView()
            .environmentObject(MovementModel(posture: Posture.sitting, durationSeconds: 123))
            .defaultAppStorage(userDefaults)
    }
}
