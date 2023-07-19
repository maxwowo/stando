//
//  ProgressModel.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI

class ProgressModel: ObservableObject {
    @Published var isSitting = true
    @Published var durationSeconds = 0
}
