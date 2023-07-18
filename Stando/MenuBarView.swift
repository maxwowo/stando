//
//  MenuBarView.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI

struct MenuBarView: View {
    @Binding var isSitting: Bool
    
    var body: some View {
        Button(action: {
            print("Open tapped")
        }) {
            Text("Open Stando")
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
            Image(isSitting ?  "figure.stand" : "figure.seated.side")
            Text(isSitting ? "Start Standing" : "Start Sitting")
        }
        
        Divider()

        Button("Preferences") {
            print("Preferences tapped")
        }
        
        Divider()
        
        Button(action: {
            NSApplication.shared.terminate(nil)
        }) {
            Text("Quit")
        }
    }
}

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView(isSitting: .constant(true))
    }
}
