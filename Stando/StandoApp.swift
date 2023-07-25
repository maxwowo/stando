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
