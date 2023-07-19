//
//  SessionModel.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI

class SessionModel: ObservableObject {
    @Published var sitDurationSeconds = true
    @Published var standDurationSeconds = 0
    @Published var caloriesBurned: Double = 0
}
