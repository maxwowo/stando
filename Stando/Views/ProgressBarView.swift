//
//  ProgressBarView.swift
//  Stando
//
//  Created by Max Wo on 18/7/2023.
//

import SwiftUI

struct ProgressBarView: View {
    let progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.primary.opacity(0.5),
                    lineWidth: 10
                )
            Circle()
                .trim(from: 0, to: 1 - progress)
                .stroke(
                    Color.accentColor,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: progress)
        }
        .padding(5)
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(progress: 0.4)
    }
}
