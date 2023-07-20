//
//  ProgressView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ProgressView: View {
    @EnvironmentObject private var settings: SettingsModel
    @EnvironmentObject private var set: SetModel
    
    var body: some View {
        ZStack {
            ProgressBarView(progress: Double(set.durationSeconds) / Double(settings.getDurationSeconds(isSitting: set.isSitting)))
                .frame(width: DimensionConstants.screenWidth, height: DimensionConstants.screenWidth)
            
            CountdownView()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .environmentObject(SetModel(isSitting: true, durationSeconds: 123))
            .environmentObject(SettingsModel())
    }
}
