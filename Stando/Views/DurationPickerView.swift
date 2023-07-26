//
//  DurationPickerView.swift
//  Stando
//
//  Created by Max Wo on 25/7/2023.
//

import SwiftUI

struct DurationPickerView: View {
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int

    var body: some View {
        HStack(spacing: 12) {
            Stepper("\(hours) hours", value: $hours, in: minutes == 0 && seconds == 0 ? 1...60 : 0...60)
            Stepper("\(minutes) min.", value: $minutes, in: hours == 0 && seconds == 0 ? 1...59 : 0...59)
            Stepper("\(seconds) sec.", value: $seconds, in: hours == 0 && minutes == 0 ? 1...59 : 0...59)
        }
        .padding(.leading, 12)
        .background(.background)
        .cornerRadius(4)
    }
}

struct DurationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DurationPickerView(hours: .constant(0), minutes: .constant(15), seconds: .constant(21))
    }
}
