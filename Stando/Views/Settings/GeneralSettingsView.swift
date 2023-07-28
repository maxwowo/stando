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
    @AppStorage(SettingConstants.isSendingMovementNotifications) private var isSendingMovementNotifications = true
    @AppStorage(SettingConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(SettingConstants.standDurationSeconds) private var standDurationSeconds = 2700

    private let frameHeight: Double = 20

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .trailing) {
                Text("Auto-start")
                    .frame(height: frameHeight)
                Text("Auto-play")
                    .frame(height: frameHeight)
                Text("Default posture")
                    .frame(height: frameHeight)
                Text("Take a break")
                    .frame(height: frameHeight)
                Text("Be notified")
                    .frame(height: frameHeight)
                Text("Sit duration")
                    .frame(height: frameHeight)
                Text("Stand duration")
                    .frame(height: frameHeight)
            }
            VStack(alignment: .leading) {
                LaunchAtLogin.Toggle()
                    .frame(height: frameHeight)
                Toggle("Pause at launch", isOn: $isPausingAtLaunch)
                    .frame(height: frameHeight)
                Toggle("Sit at launch", isOn: $isSittingAtLaunch)
                    .frame(height: frameHeight)
                Toggle("Pause after each movement", isOn: $isPausingAtEndOfMovement)
                    .frame(height: frameHeight)
                Toggle("Send notifications to sit / stand", isOn: $isSendingMovementNotifications)
                    .frame(height: frameHeight)
                DurationPickerView(durationSeconds: $sitDurationSeconds)
                    .frame(height: frameHeight)
                DurationPickerView(durationSeconds: $standDurationSeconds)
                    .frame(height: frameHeight)
            }
        }
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
    }
}
