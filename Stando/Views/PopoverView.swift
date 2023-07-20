//
//  PopoverView.swift
//  Stando
//
//  Created by Max Wo on 18/7/2023.
//

import SwiftUI

struct PopoverView: View {
    @EnvironmentObject private var settings: SettingsModel
    @EnvironmentObject private var set: SetModel
    @EnvironmentObject private var metrics: MetricsModel

    var body: some View {
        VStack(spacing: 24) {
            HeaderView()
            
            ZStack {
                ProgressView(progress: Double(set.durationSeconds) / Double(settings.getDurationSeconds(isSitting: set.isSitting)))
                    .frame(width: DimensionConstants.screenWidth, height: DimensionConstants.screenWidth)
                
                CountdownView()
            }
            
            MetricsView()
            
            HStack(spacing: 12) {
                HoverableSymbolButtonView(imageName: "pause") {
                    
                }
                .help("Pause")
                
                SymbolButtonView(imageName: "figure.stand", backgroundColor: Color.accentColor, foregroundColor: Color("primaryButtonForeground")) {
                }
                .help("Stand up")
                
                HoverableSymbolButtonView(imageName: "restart") {
                    
                }
                .help("Restart")
            }
        }
        .frame(width: DimensionConstants.screenWidth)
        .padding(24)
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
            .environmentObject(SetModel(isSitting: true, durationSeconds: 123))
            .environmentObject(MetricsModel(sitDurationSeconds: 396, standDurationSeconds: 4428, caloriesBurned: 195.5))
            .environmentObject(SettingsModel())
    }
}
