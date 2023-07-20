//
//  MetricView.swift
//  Stando
//
//  Created by Max Wo on 20/7/2023.
//

import SwiftUI

struct MetricView: View {
    let metricName: String
    let metricValue: String

    var body: some View {
        VStack {
            Text(metricName)
                .font(.caption)
                .foregroundColor(Color.primary.opacity(0.5))
            Text(metricValue)
                .font(.title2)
        }
    }
}

struct MetricView_Previews: PreviewProvider {
    static var previews: some View {
        MetricView(metricName: "Calories", metricValue: "195.5")
    }
}
