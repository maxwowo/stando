//
//  StandoApp.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI

@main
struct StandoApp: App {
    @StateObject private var movement = MovementModel()
    @StateObject private var session = SessionModel()

    var body: some Scene {
        Settings {
            SettingsView()
        }

        MenuBarExtra("Stando", image: movement.isSitting ? "figure.seated.side" : "figure.stand") {
            PopoverView()
                .environmentObject(movement)
                .environmentObject(session)
        }
        .menuBarExtraStyle(.window)
    }
}
