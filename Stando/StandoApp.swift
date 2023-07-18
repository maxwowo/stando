//
//  StandoApp.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI

@main
struct StandoApp: App {
    @State private var isSitting = true
    @State private var isPaused = false
    @State private var duration = 0
    
    var body: some Scene {
        MenuBarExtra("Stando", image: isSitting ? "figure.seated.side" : "figure.stand") {
            PopoverView(isSitting: $isSitting)
        }
        .menuBarExtraStyle(.window)
    }
}
