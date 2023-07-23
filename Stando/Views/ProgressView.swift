//
//  ProgressView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ProgressView: View {
    @AppStorage(PreferenceConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(PreferenceConstants.standDurationSeconds) private var standDurationSeconds = 2700

    @EnvironmentObject private var posture: PostureModel

    private var durationSeconds: Int {
        posture.isSitting ? sitDurationSeconds : standDurationSeconds
    }

    var body: some View {
        ZStack {
            ProgressBarView(progress: Double(posture.durationSeconds) / Double(durationSeconds))
                .frame(width: DimensionConstants.screenWidth, height: DimensionConstants.screenWidth)

            CountdownView()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .environmentObject(PostureModel(posture: Posture.sitting, durationSeconds: 123))
    }
}
