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
        MenuBarExtra("Stando", image: "figure.seated.side") {
            MenuBarView()
        }
    }
}
