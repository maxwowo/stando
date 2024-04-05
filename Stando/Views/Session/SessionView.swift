//
//  MetricsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct SessionView: View {
    @EnvironmentObject private var movementModel: MovementModel

    func formatDurationHours(durationSeconds: Int) -> String {
        let hours = Double(durationSeconds) / 3600

        return String(format: "%.2f", hours)
    }

    func calculateCaloriesBurned() -> Double {
        let totalSitDurationHours = Double(movementModel.totalSitDurationSeconds) / 3600
        let totalStandDurationHours = Double(movementModel.totalStandDurationSeconds) / 3600

        // Magic numbers from ChatGPT
        return totalSitDurationHours * 70 + totalStandDurationHours * 90
    }

    var body: some View {
        HStack(spacing: 0) {
            SessionMetricView(
                name: "Sitting",
                value: "\(formatDurationHours(durationSeconds: movementModel.totalSitDurationSeconds)) h"
            )
            .frame(minWidth: 70)

            Divider()
                .frame(height: 30)

            SessionMetricView(
                name: "Standing",
                value: "\(formatDurationHours(durationSeconds: movementModel.totalStandDurationSeconds)) h"
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
                durationSeconds: 123,
                totalSitDurationSeconds: 123,
                totalStandDurationSeconds: 123
            ))
            .defaultAppStorage(userDefaults)
    }
}
