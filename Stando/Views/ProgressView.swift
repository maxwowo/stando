//
//  ProgressView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ProgressView: View {
    @AppStorage(SettingsConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(SettingsConstants.standDurationSeconds) private var standDurationSeconds = 2700

    @EnvironmentObject private var timer: TimerModel
    @EnvironmentObject private var posture: PostureModel

    private var durationSeconds: Int {
        posture.isSitting ? sitDurationSeconds : standDurationSeconds
    }

    var body: some View {
        ZStack {
            ProgressBarView(progress: Double(timer.durationSeconds) / Double(durationSeconds))
                .frame(width: DimensionConstants.screenWidth, height: DimensionConstants.screenWidth)

            CountdownView()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .environmentObject(PostureModel(posture: Posture.sitting))
            .environmentObject(TimerModel(durationSeconds: 123))
    }
}
