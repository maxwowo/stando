//
//  ControlsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject private var movement: MovementModel

    var body: some View {
        HStack(spacing: 12) {
            HoverableSymbolButtonView(imageName: movement.isTimerRunning ? "pause" : "play") {
                movement.isTimerRunning ? movement.stopTimer() : movement.resumeTimer()
            }
            .help(movement.isTimerRunning ? "Pause" : "Resume")

            SymbolButtonView(
                imageName: "figure.stand",
                backgroundColor: Color.accentColor,
                foregroundColor: Color("primaryButtonForeground")
            ) {
            }
            .help("Stand up")

            HoverableSymbolButtonView(imageName: "restart") {
                movement.resetTimer()
            }
            .help("Restart")
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
            .environmentObject(MovementModel(posture: Posture.sitting, durationSeconds: 123))
    }
}
