//
//  PostureModel.swift
//  Stando
//
//  Created by Max Wo on 19/7/2023.
//

import SwiftUI
import Combine

enum Posture {
    case sitting, standing
}

class PostureModel: ObservableObject {
    @Published var posture: Posture

    var isSitting: Bool {
        posture == Posture.sitting
    }

    init(posture: Posture = Posture.sitting) {
        self.posture = posture
    }
}
