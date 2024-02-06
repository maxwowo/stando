//
//  AppearanceSettingsView.swift
//  Stando
//
//  Created by Max Wo on 6/2/2024.
//

import SwiftUI

struct AppearanceSettingsView: View {
    @AppStorage(SettingConstants.isShowingDurationInMenuBar) private var isShowingDurationInMenuBar = false

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .trailing) {
                Text("Menu bar")
                    .frame(height: SettingViewConstants.frameHeight)
            }
            VStack(alignment: .leading) {
                Toggle("Show duration in menu bar", isOn: $isShowingDurationInMenuBar)
                    .frame(height: SettingViewConstants.frameHeight)
            }
        }
    }
}

struct AppearanceSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceSettingsView()
    }
}
