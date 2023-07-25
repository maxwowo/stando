//
//  MetricsModel.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI
import Combine

class SessionModel: ObservableObject {
    @Published var sitDurationSeconds: Int
    @Published var standDurationSeconds: Int
    @Published var caloriesBurned: Double

    init(sitDurationSeconds: Int = 0, standDurationSeconds: Int = 0, caloriesBurned: Double = 0) {
        self.sitDurationSeconds = sitDurationSeconds
        self.standDurationSeconds = standDurationSeconds
        self.caloriesBurned = caloriesBurned
    }
}
