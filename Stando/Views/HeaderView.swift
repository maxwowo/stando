//
//  HeaderView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct HeaderView: View {
    @State private var isShowingMenu = false

    var body: some View {
        ZStack {
            Text("Stando")
                .font(.largeTitle)
                .bold()

            HStack {
                Spacer()

                Menu {
                    Button("Preferences") {
                        NSApplication.shared.activate(ignoringOtherApps: true)

                        // macOS 13+ renamed the action name
                        if #available(macOS 13, *) {
                            print("available")
                            NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
                        } else {
                            NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
                        }
                    }

                    Divider()

                    Button("Quit") {
                        NSApplication.shared.terminate(nil)
                    }
                } label: {
                    Image("gear")
                        .font(.title2)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
