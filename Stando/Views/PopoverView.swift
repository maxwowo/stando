//
//  PopoverView.swift
//  Stando
//
//  Created by Max Wo on 18/7/2023.
//

import SwiftUI

struct PopoverView: View {
    @EnvironmentObject private var set: SetModel
    @EnvironmentObject private var movement: MovementModel

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
                    .frame(width: DimensionConstants.screenWidth, height: DimensionConstants.screenWidth)
                VStack(spacing: 4) {
                    Text("15:00")
                        .font(.largeTitle)
                        .monospacedDigit()
                    Text("\(Image(set.isSitting ? "figure.seated.side" : "figure.stand")) \(set.isSitting ? "Sitting" : "Standing")")
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
                    Text("195.5")
                        .font(.title2)
                }
            }
            
            HStack(spacing: 12) {
                HoverableSymbolButtonView(imageName: "pause") {
                    
                }
                .help("Pause")
                
                SymbolButtonView(imageName: "figure.stand", backgroundColor: Color.accentColor) {
                    
                }
                .help("Stand up")
                
                HoverableSymbolButtonView(imageName: "restart") {
                    
                }
                .help("Restart")
            }
        }
        .frame(width: DimensionConstants.screenWidth)
        .padding(24)
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
            .environmentObject(SetModel(isSitting: true, durationSeconds: 123))
            .environmentObject(MovementModel(sitDurationSeconds: 396, standDurationSeconds: 4428, caloriesBurned: 195.5))
    }
}
