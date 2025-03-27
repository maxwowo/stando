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
    @StateObject private var movementModel = MovementModel()

    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {_, _ in }
    }

    var body: some Scene {
        Settings {
            SettingsView()
        }
        .defaultLaunchBehavior(.suppressed)

        MenuBarExtra("Stando", image: movementModel.isSitting ? "figure.seated.side" : "figure.stand") {
            PopoverView()
                .environmentObject(movementModel)
        }
        .menuBarExtraStyle(.window)
    }
}
