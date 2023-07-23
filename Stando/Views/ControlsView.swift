//
//  ControlsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject private var posture: PostureModel

    var body: some View {
        HStack(spacing: 12) {
            HoverableSymbolButtonView(imageName: posture.isTimerRunning ? "pause" : "play") {
                posture.isTimerRunning ? posture.stopTimer() : posture.resumeTimer()
            }
            .help(posture.isTimerRunning ? "Pause" : "Resume")

            SymbolButtonView(
                imageName: "figure.stand",
                backgroundColor: Color.accentColor,
                foregroundColor: Color("primaryButtonForeground")
            ) {
            }
            .help("Stand up")

            HoverableSymbolButtonView(imageName: "restart") {
                posture.resetTimer()
            }
            .help("Restart")
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
            .environmentObject(PostureModel(posture: Posture.sitting, durationSeconds: 123))
    }
}
