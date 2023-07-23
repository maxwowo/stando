//
//  MetricView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct StatisticView: View {
    let name: String
    let value: String

    var body: some View {
        VStack {
            Text(name)
                .font(.caption)
                .foregroundColor(Color.primary.opacity(0.5))
            Text(value)
                .font(.title2)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(name: "Calories", value: "195.5")
    }
}
