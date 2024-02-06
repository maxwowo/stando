//
//  StandoApp.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI
import UserNotifications

@main
struct StandoApp: App {
    @AppStorage(SettingConstants.isShowingDurationInMenuBar) private var isShowingDurationInMenuBar = false

    @StateObject private var movement = MovementModel()

    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Succeeded requesting notification authorization")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    var body: some Scene {
        Settings {
            SettingsView()
        }

        MenuBarExtra {
            PopoverView()
                .environmentObject(movement)
        } label: {
            Image(systemName: movement.isSitting ? "figure.seated.side" : "figure.stand")

            if isShowingDurationInMenuBar {
                Text(movement.formattedRemainingTime)
            }
        }
        .menuBarExtraStyle(.window)
    }
}
