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
    @AppStorage(PreferenceConstants.isSittingAtLaunch) private var isSittingAtLaunch = true

    @Published var posture: Posture

    var isSitting: Bool {
        posture == Posture.sitting
    }

    init(posture: Posture = Posture.sitting) {
        self.posture = posture

        self.posture = isSittingAtLaunch ? Posture.sitting : Posture.standing
    }
}
