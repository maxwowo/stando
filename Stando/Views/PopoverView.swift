//
//  PopoverView.swift
//  Stando
//
//  Created by Max Wo on 18/7/2023.
//

import SwiftUI

struct PopoverView: View {
    @EnvironmentObject private var posture: PostureModel
    @EnvironmentObject private var metrics: MetricsModel

    var body: some View {
        VStack(spacing: 24) {
            HeaderView()
            ProgressView()
            MetricsView()
            ControlsView()
        }
        .frame(width: DimensionConstants.screenWidth)
        .padding(24)
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
            .environmentObject(PostureModel(posture: Posture.sitting, durationSeconds: 123))
            .environmentObject(MetricsModel(sitDurationSeconds: 396, standDurationSeconds: 4428, caloriesBurned: 195.5))
    }
}
