//
//  MetricsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct MetricsView: View {
    @EnvironmentObject private var timer: TimerModel
    @EnvironmentObject private var posture: PostureModel
    @EnvironmentObject private var metrics: MetricsModel

    func formatDurationHours(durationSeconds: Int) -> String {
        let hours = Double(durationSeconds) / 3600

        return String(format: "%.2f", hours)
    }

    var body: some View {
        HStack(spacing: 12) {
            MetricView(
                metricName: "Sitting",
                metricValue: "\(formatDurationHours(durationSeconds: metrics.sitDurationSeconds)) h"
            )

            Divider()
                .frame(height: 30)

            MetricView(
                metricName: "Standing",
                metricValue: "\(formatDurationHours(durationSeconds: metrics.standDurationSeconds)) h"
            )

            Divider()
                .frame(height: 30)

            MetricView(metricName: "Calories", metricValue: String(metrics.caloriesBurned))
        }
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView()
            .environmentObject(PostureModel(posture: Posture.sitting))
            .environmentObject(TimerModel(durationSeconds: 123))
            .environmentObject(MetricsModel(sitDurationSeconds: 396, standDurationSeconds: 4428, caloriesBurned: 195.5))
    }
}
