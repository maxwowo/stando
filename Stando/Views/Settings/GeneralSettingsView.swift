//
//  GeneralSettingsView.swift
//  Stando
//
//  Created by Max Wo on 25/7/2023.
//

import SwiftUI
import LaunchAtLogin

struct GeneralSettingsView: View {
    @AppStorage(SettingConstants.isPausingAtLaunch) private var isPausingAtLaunch = false
    @AppStorage(SettingConstants.isSittingAtLaunch) private var isSittingAtLaunch = true
    @AppStorage(SettingConstants.isPausingAtEndOfMovement) private var isPausingAtEndOfMovement = false
    @AppStorage(SettingConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(SettingConstants.standDurationSeconds) private var standDurationSeconds = 2700

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .trailing) {
                Text("Auto-start")
                    .frame(height: SettingViewConstants.frameHeight)
                Text("Auto-play")
                    .frame(height: SettingViewConstants.frameHeight)
                Text("Initial posture")
                    .frame(height: SettingViewConstants.frameHeight)
                Text("Take a break")
                    .frame(height: SettingViewConstants.frameHeight)
                Text("Sit duration")
                    .frame(height: SettingViewConstants.frameHeight)
                Text("Stand duration")
                    .frame(height: SettingViewConstants.frameHeight)
            }
            VStack(alignment: .leading) {
                LaunchAtLogin.Toggle()
                    .frame(height: SettingViewConstants.frameHeight)
                Toggle("Pause at launch", isOn: $isPausingAtLaunch)
                    .frame(height: SettingViewConstants.frameHeight)
                Toggle("Sit at launch", isOn: $isSittingAtLaunch)
                    .frame(height: SettingViewConstants.frameHeight)
                Toggle("Pause after each movement", isOn: $isPausingAtEndOfMovement)
                    .frame(height: SettingViewConstants.frameHeight)
                DurationPickerView(durationSeconds: $sitDurationSeconds)
                    .frame(height: SettingViewConstants.frameHeight)
                DurationPickerView(durationSeconds: $standDurationSeconds)
                    .frame(height: SettingViewConstants.frameHeight)
            }
        }
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
    }
}
