//
//  StandoApp.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI

@main
struct StandoApp: App {
    @StateObject var set = SetModel()
    @StateObject var movement = MovementModel()
    
    var body: some Scene {
        MenuBarExtra("Stando", image: set.isSitting ? "figure.seated.side" : "figure.stand") {
            PopoverView()
                .environmentObject(set)
                .environmentObject(movement)
        }
        .menuBarExtraStyle(.window)
    }
}
