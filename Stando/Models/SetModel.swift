//
//  SetModel.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI
import Combine

class SetModel: ObservableObject {
    @Published var isSitting: Bool
    @Published var durationSeconds: Int
    
    init(isSitting: Bool = true, durationSeconds: Int = 0) {
        self.isSitting = isSitting
        self.durationSeconds = durationSeconds
    }
}
