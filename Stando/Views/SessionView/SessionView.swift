//
//  MetricsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct SessionView: View {
    @EnvironmentObject private var session: SessionModel

    func formatDurationHours(durationSeconds: Int) -> String {
        let hours = Double(durationSeconds) / 3600

        return String(format: "%.2f", hours)
    }

    var body: some View {
        HStack(spacing: 12) {
            SessionMetricView(
                name: "Sitting",
                value: "\(formatDurationHours(durationSeconds: session.sitDurationSeconds)) h"
            )

            Divider()
                .frame(height: 30)

            SessionMetricView(
                name: "Standing",
                value: "\(formatDurationHours(durationSeconds: session.standDurationSeconds)) h"
            )

            Divider()
                .frame(height: 30)

            SessionMetricView(name: "Calories", value: String(session.caloriesBurned))
        }
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
            .environmentObject(SessionModel(
                sitDurationSeconds: 396,
                standDurationSeconds: 4428,
                caloriesBurned: 195.5
            ))
    }
}
