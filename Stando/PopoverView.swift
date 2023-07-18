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
        VStack {
            Text("Stando")
                .font(.largeTitle)
                .bold()
            
            ZStack {
                ProgressView(progress: 0.8)
                    .frame(width: 200, height: 200)
                VStack {
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
        }
        .padding()
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView(isSitting: .constant(true))
    }
}

