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
    @StateObject private var posture = PostureModel()
    @StateObject private var metrics = MetricsModel()
    @StateObject private var timer = TimerModel()
    
    var body: some Scene {
        MenuBarExtra("Stando", image: posture.isSitting ? "figure.seated.side" : "figure.stand") {
            PopoverView()
                .environmentObject(settings)
                .environmentObject(posture)
                .environmentObject(metrics)
                .onAppear {
                    timer.onTimerTick = {
                        posture.durationSeconds += 1
                    }
                }
        }
        .menuBarExtraStyle(.window)
    }
}
