//
//  GeneralSettingsView.swift
//  Stando
//
//  Created by Max Wo on 25/7/2023.
//

import SwiftUI

struct GeneralSettingsView: View {
    @AppStorage(SettingConstants.isLaunchingAtLogin) private var isLaunchingAtLogin = true
    @AppStorage(SettingConstants.isPausingAtLaunch) private var isPausingAtLaunch = false
    @AppStorage(SettingConstants.isSittingAtLaunch) private var isSittingAtLaunch = true
    @AppStorage(SettingConstants.isPausingAtEndOfSet) private var isPausingAtEndOfSet = false
    @AppStorage(SettingConstants.sitDurationSeconds) private var sitDurationSeconds = 900
    @AppStorage(SettingConstants.standDurationSeconds) private var standDurationSeconds = 2700

    var body: some View {
        VStack(alignment: .leading) {
            Toggle("Launch at login", isOn: $isLaunchingAtLogin)
            Toggle("Pause at launch", isOn: $isPausingAtLaunch)
            Toggle("Sit at launch", isOn: $isSittingAtLaunch)
            Toggle("Pause at end of set", isOn: $isPausingAtEndOfSet)

            Divider()

            Text("Sit duration (seconds)")
                .font(.headline)
            TextField("Sit duration", value: $sitDurationSeconds, format: .number)
                .textFieldStyle(.roundedBorder)

            Text("Stand duration (seconds)")
                .font(.headline)
            TextField("Stand duration", value: $standDurationSeconds, format: .number)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
    }
}
