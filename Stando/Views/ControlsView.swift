//
//  ControlsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject private var settings: SettingsModel
    @EnvironmentObject private var timer: TimerModel
    @EnvironmentObject private var posture: PostureModel
    
    var body: some View {
        HStack(spacing: 12) {
            HoverableSymbolButtonView(imageName: timer.isTimerRunning ? "pause" : "play") {
                timer.isTimerRunning ? timer.stopTimer() : timer.resumeTimer()
            }
            .help(timer.isTimerRunning ? "Pause" : "Resume")
            
            SymbolButtonView(imageName: "figure.stand", backgroundColor: Color.accentColor, foregroundColor: Color("primaryButtonForeground")) {
            }
            .help("Stand up")
            
            HoverableSymbolButtonView(imageName: "restart") {
                
            }
            .help("Restart")
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
            .environmentObject(PostureModel(posture: Posture.sitting))
            .environmentObject(SettingsModel())
            .environmentObject(TimerModel(durationSeconds: 123))
    }
}
