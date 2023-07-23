//
//  MetricsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject private var statistics: StatisticsModel

    func formatDurationHours(durationSeconds: Int) -> String {
        let hours = Double(durationSeconds) / 3600

        return String(format: "%.2f", hours)
    }

    var body: some View {
        HStack(spacing: 12) {
            StatisticView(
                metricName: "Sitting",
                metricValue: "\(formatDurationHours(durationSeconds: statistics.sitDurationSeconds)) h"
            )

            Divider()
                .frame(height: 30)

            StatisticView(
                metricName: "Standing",
                metricValue: "\(formatDurationHours(durationSeconds: statistics.standDurationSeconds)) h"
            )

            Divider()
                .frame(height: 30)

            StatisticView(metricName: "Calories", metricValue: String(statistics.caloriesBurned))
        }
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
            .environmentObject(StatisticsModel(sitDurationSeconds: 396, standDurationSeconds: 4428, caloriesBurned: 195.5))
    }
}
