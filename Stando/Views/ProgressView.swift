//
//  ProgressView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct ProgressView: View {
    @AppStorage(SettingConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(SettingConstants.standDurationSeconds) private var standDurationSeconds = 2700

    @EnvironmentObject private var movementModel: MovementModel

    private var durationSeconds: Int {
        movementModel.isSitting ? sitDurationSeconds : standDurationSeconds
    }

    var body: some View {
        ZStack {
            ProgressBarView(progress: Double(movementModel.durationSeconds) / Double(durationSeconds))
                .frame(width: DimensionConstants.screenWidth, height: DimensionConstants.screenWidth)

            CountdownView()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        let userDefaults: UserDefaults = {
            let defaults = UserDefaults()

            defaults.set(true, forKey: SettingConstants.isPausingAtLaunch)

            return defaults
        }()

        ProgressView()
            .environmentObject(MovementModel(posture: Posture.sitting, durationSeconds: 123))
            .defaultAppStorage(userDefaults)
    }
}
