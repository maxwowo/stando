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

        MenuBarExtra("Stando", image: movement.isSitting ? "figure.seated.side" : "figure.stand") {
            PopoverView()
                .environmentObject(movement)
        }
        .menuBarExtraStyle(.window)
    }
}
