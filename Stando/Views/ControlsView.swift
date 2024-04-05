//
//  ControlsView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject private var movementModel: MovementModel

    var body: some View {
        HStack(spacing: 12) {
            HoverableImageButtonView(imageName: movementModel.isPaused ? "play" : "pause") {
                movementModel.isPaused ? movementModel.resume() : movementModel.pause()
            }
            .help(movementModel.isPaused ? "Resume" : "Pause")

            ImageButtonView(
                imageName: movementModel.isSitting ? "figure.stand" : "figure.seated.side",
                backgroundColor: Color.accentColor,
                foregroundColor: Color("primaryButtonForeground")
            ) {
                movementModel.next()
            }
            .help(movementModel.isSitting ? "Stand up" : "Sit down")

            HoverableImageButtonView(imageName: "restart") {
                movementModel.restart()
            }
            .help("Restart")
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        let userDefaults: UserDefaults = {
            let defaults = UserDefaults()

            defaults.set(true, forKey: SettingConstants.isPausingAtLaunch)

            return defaults
        }()

        ControlsView()
            .environmentObject(MovementModel(posture: Posture.sitting, durationSeconds: 123))
            .defaultAppStorage(userDefaults)
    }
}
