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
            HoverableImageButtonView(imageName: movement.isPaused ? "play" : "pause") {
                movement.isPaused ? movement.resume() : movement.pause()
            }
            .help(movement.isPaused ? "Resume" : "Pause")

            ImageButtonView(
                imageName: movement.isSitting ? "figure.stand" : "figure.seated.side",
                backgroundColor: Color.accentColor,
                foregroundColor: Color("primaryButtonForeground")
            ) {
                movement.next()
            }
            .help(movement.isSitting ? "Stand up" : "Sit down")

            HoverableImageButtonView(imageName: "restart") {
                movement.restart()
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
            .environmentObject(MovementModel(posture: Posture.sitting, durationElapsedSeconds: 123))
            .defaultAppStorage(userDefaults)
    }
}
