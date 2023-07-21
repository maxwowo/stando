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
                        print("pref clicked")
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
