//
//  StandoApp.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI

@main
struct StandoApp: App {
    @StateObject private var settings = SettingsModel()
    @StateObject private var set = SetModel()
    @StateObject private var movement = MovementModel()
    
    var body: some Scene {
        MenuBarExtra("Stando", image: set.isSitting ? "figure.seated.side" : "figure.stand") {
            PopoverView()
                .environmentObject(settings)
                .environmentObject(set)
                .environmentObject(movement)
        }
        .menuBarExtraStyle(.window)
    }
}
