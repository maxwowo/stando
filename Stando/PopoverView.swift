//
//  PopoverView.swift
//  Stando
//
//  Created by Max Wo on 18/7/2023.
//

import SwiftUI

struct PopoverView: View {
    @Binding var isSitting: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Text("Stando")
                    .font(.largeTitle)
                    .bold()

                HStack {
                    Spacer()
                    
                    Button(action: {
                        print("stand clicked")
                    }, label: {
                        Image("gear")
                            .font(.title2)
                    })
                    .buttonStyle(.plain)
                    .help("Settings")
                }
            }
            
            ZStack {
                ProgressView(progress: 0.8)
                    .frame(width: 200, height: 200)
                VStack(spacing: 4) {
                    Text("15:00")
                        .font(.largeTitle)
                    Text("\(Image(isSitting ? "figure.seated.side" : "figure.stand")) \(isSitting ? "Sitting" : "Standing")")
                }
            }
            
            HStack(spacing: 12) {
                VStack {
                    Text("Sitting")
                        .font(.caption)
                        .foregroundColor(Color.primary.opacity(0.5))
                    Text("0.11h")
                        .font(.title2)
                }
                
                Divider()
                    .frame(height: 30)
                
                VStack {
                    Text("Standing")
                        .font(.caption)
                        .foregroundColor(Color.primary.opacity(0.5))
                    Text("1.12h")
                        .font(.title2)
                }
                Divider()
                    .frame(height: 30)
                
                VStack {
                    Text("Calories")
                        .font(.caption)
                        .foregroundColor(Color.primary.opacity(0.5))
                    Text("1000")
                        .font(.title2)
                }
            }
            
            HStack(spacing: 24) {
                Button(action: {
                    print("stand clicked")
                }) {
                    Image("pause")
                        .font(.title2)
                }
                .buttonStyle(.plain)
                .help("Pause")

                Button(action: {
                    print("stand clicked")
                }) {
                    Image("figure.stand")
                        .font(.title2)
                        .padding()
                        .foregroundColor(Color.white.opacity(0.85))
                        .background(Color.accentColor)
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
                .help("Stand up")
                
                Button(action: {
                    print("stand clicked")
                }) {
                    Image("restart")
                        .font(.title2)
                }
                .buttonStyle(.plain)
                .help("Restart")
            }
        }
        .frame(width: 200)
        .padding(24)
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView(isSitting: .constant(true))
    }
}

