//
//  PopoverView.swift
//  Stando
//
//  Created by Max Wo on 18/7/2023.
//

import SwiftUI

struct PopoverView: View {
    @EnvironmentObject private var settings: SettingsModel
    @EnvironmentObject private var posture: PostureModel
    @EnvironmentObject private var metrics: MetricsModel
    @EnvironmentObject private var timer: TimerModel
    
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
            .environmentObject(PostureModel(isSitting: true, durationSeconds: 123))
            .environmentObject(MetricsModel(sitDurationSeconds: 396, standDurationSeconds: 4428, caloriesBurned: 195.5))
            .environmentObject(SettingsModel())
    }
}
