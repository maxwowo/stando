//
//  ProgressView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ProgressView: View {
    @EnvironmentObject private var settings: SettingsModel
    @EnvironmentObject private var posture: PostureModel
    
    var body: some View {
        ZStack {
            ProgressBarView(progress: Double(posture.durationSeconds) / Double(settings.getDurationSeconds(isSitting: posture.isSitting)))
                .frame(width: DimensionConstants.screenWidth, height: DimensionConstants.screenWidth)
            
            CountdownView()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .environmentObject(PostureModel(isSitting: true, durationSeconds: 123))
            .environmentObject(SettingsModel())
    }
}
