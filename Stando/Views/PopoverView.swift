//
//  PopoverView.swift
//  Stando
//
//  Created by Max Wo on 18/7/2023.
//

import SwiftUI

struct PopoverView: View {
    @EnvironmentObject private var movementModel: MovementModel

    var body: some View {
        VStack(spacing: 24) {
            HeaderView()
            ProgressView()
            SessionView()
            ControlsView()
        }
        .frame(width: DimensionConstants.screenWidth)
        .padding(24)
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        let userDefaults: UserDefaults = {
            let defaults = UserDefaults()

            defaults.set(true, forKey: SettingConstants.isPausingAtLaunch)

            return defaults
        }()

        PopoverView()
            .environmentObject(MovementModel(posture: Posture.sitting, durationSeconds: 123))
            .defaultAppStorage(userDefaults)
    }
}
