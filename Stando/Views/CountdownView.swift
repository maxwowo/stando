//
//  CountdownView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct CountdownView: View {
    @AppStorage(SettingsConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(SettingsConstants.standDurationSeconds) private var standDurationSeconds = 2700

    @EnvironmentObject private var timer: TimerModel
    @EnvironmentObject private var posture: PostureModel

    private var postureIcon: String {
        posture.isSitting ? "figure.seated.side" : "figure.stand"
    }

    private var formattedRemainingTime: String {
        let durationSeconds = posture.isSitting ? sitDurationSeconds : standDurationSeconds

        let remainingDurationSeconds = durationSeconds - timer.durationSeconds

        return String(format: "%02d:%02d", remainingDurationSeconds / 60, remainingDurationSeconds % 60)
    }

    var body: some View {
        VStack(spacing: 4) {
            Text(formattedRemainingTime)
                .font(.largeTitle)
                .monospacedDigit()
            Text("\(Image(postureIcon)) \(posture.isSitting ? "Sitting" : "Standing")")
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
            .environmentObject(PostureModel(posture: Posture.sitting))
            .environmentObject(TimerModel(durationSeconds: 123))
    }
}
