//
//  StandoApp.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI

@main
struct StandoApp: App {
    var body: some Scene {
        MenuBarExtra("Stando", image: isSitting ? "figure.seated.side" : "figure.stand") {
            PopoverView(isSitting: $isSitting)
        }
        .menuBarExtraStyle(.window)
    }
}
