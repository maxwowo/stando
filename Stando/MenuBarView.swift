//
//  MenuBarView.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI

struct MenuBarView: View {
    var body: some View {
        Button(action: {
            print("Clock tapped")
        }) {
            Image("clock")
            Text("Remaining Duration")
        }

        Divider()
        
        Button(action: {
            print("Pause tapped")
        }) {
            Image("pause")
            Text("Pause")
        }
        
        Button(action: {
            print("Restart tapped")
        }) {
            Image("restart")
            Text("Restart")
        }
        
        Divider()
        
        Button(action: {
            print("Start standing tapped")
        }) {
            Image("figure.stand")
            Text("Start Standing")
        }
        
        Divider()

        Button("Preferences") {
            print("Preferences tapped")
        }
        
        Divider()
        
        Button("Quit") {
            NSApplication.shared.terminate(nil)
        }
    }
}

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
    }
}
