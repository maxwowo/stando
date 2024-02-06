//
//  PreferencesView.swift
//  Stando
//
//  Created by Max Wo on 21/7/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .frame(width: 500)

            AppearanceSettingsView()
                .tabItem {
                    Label("Appearance", systemImage: "paintpalette")
                }
                .frame(width: 500)

            NotificationSettingsView()
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }
                .frame(width: 500)
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
