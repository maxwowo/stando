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
    
    init(isLaunchingAtLogin: Bool = false, isPausingAtLaunch: Bool = false, isSittingAtLaunch: Bool = false, isPausingAtEndOfSet: Bool = false, sitDurationSeconds: Int = 900, standDurationSeconds: Int = 2700) {
        self.isLaunchingAtLogin = isLaunchingAtLogin
        self.isPausingAtLaunch = isPausingAtLaunch
        self.isSittingAtLaunch = isSittingAtLaunch
        self.isPausingAtEndOfSet = isPausingAtEndOfSet
        self.sitDurationSeconds = sitDurationSeconds
        self.standDurationSeconds = standDurationSeconds
    }
    
    func getDurationSeconds(isSitting: Bool) -> Int {
        return isSitting ? sitDurationSeconds : standDurationSeconds
    }
}
