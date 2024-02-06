//
//  MetricsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct SessionView: View {
    @EnvironmentObject private var movement: MovementModel

    func formatDurationHours(durationSeconds: Int) -> String {
        let hours = Double(durationSeconds) / 3600

        return String(format: "%.2f", hours)
    }

    func calculateCaloriesBurned() -> Double {
        let totalSitDurationHours = Double(movement.totalSitDurationElapsedSeconds) / 3600
        let totalStandDurationHours = Double(movement.totalStandDurationElapsedSeconds) / 3600

        // Magic numbers from ChatGPT
        return totalSitDurationHours * 70 + totalStandDurationHours * 90
    }

    var body: some View {
        HStack(spacing: 0) {
            SessionMetricView(
                name: "Sitting",
                value: "\(formatDurationHours(durationSeconds: movement.totalSitDurationElapsedSeconds)) h"
            )
            .frame(minWidth: 70)

            Divider()
                .frame(height: 30)

            SessionMetricView(
                name: "Standing",
                value: "\(formatDurationHours(durationSeconds: movement.totalStandDurationElapsedSeconds)) h"
            )
            .frame(minWidth: 70)

            Divider()
                .frame(height: 30)

            SessionMetricView(
                name: "Calories",
                value: String(format: "%.2f", calculateCaloriesBurned())
            )
            .frame(minWidth: 70)
        }
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        let userDefaults: UserDefaults = {
            let defaults = UserDefaults()

            defaults.set(true, forKey: SettingConstants.isPausingAtLaunch)

            return defaults
        }()

        SessionView()
            .environmentObject(MovementModel(
                posture: Posture.sitting,
                durationElapsedSeconds: 123,
                totalSitDurationElapsedSeconds: 123,
                totalStandDurationElapsedSeconds: 123
            ))
            .defaultAppStorage(userDefaults)
    }
}
