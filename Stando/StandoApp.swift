//
//  StandoApp.swift
//  Stando
//
//  Created by Max Wo on 14/7/2023.
//

import SwiftUI

@main
struct StandoApp: App {
    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
        MenuBarExtra("Stando", image: "figure.seated.side") {
            Label("15:21 remaining", image: "clock")
                .labelStyle(.titleAndIcon)
            
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
            
            Button(action: {
                print("Preferences tapped")
            }) {
                HStack {
                    Spacer()
                    Text("Preferences")
                    Spacer()
                }
            }
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.padding(20)
        }
        
    }
}
