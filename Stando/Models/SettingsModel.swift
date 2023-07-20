//
//  SettingsModel.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI
import Combine

class SettingsModel: ObservableObject {
    @AppStorage("isLaunchingAtLogin") var isLaunchingAtLogin = false
    @AppStorage("isPausingAtLaunch") var isPausingAtLaunch = false
    @AppStorage("isSittingAtLaunch") var isSittingAtLaunch = false
    @AppStorage("isPausingAtEndOfSet") var isPausingAtEndOfSet = false
    
    @AppStorage("sitDurationSeconds") var sitDurationSeconds = 900
    @AppStorage("standDurationSeconds") var standDurationSeconds = 2700
    
    func getDurationSeconds(isSitting: Bool) -> Int {
        return isSitting ? sitDurationSeconds : standDurationSeconds
    }
}
