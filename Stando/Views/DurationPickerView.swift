//
//  DurationPickerView.swift
//  Stando
//
//  Created by Max Wo on 25/7/2023.
//

import SwiftUI

struct DurationPickerView: View {
    @State private var hours: Int = 0
    @State private var minutes: Int = 900
    @State private var seconds: Int = 0

    @Binding var durationSeconds: Int

    init(durationSeconds: Binding<Int>) {
        self._durationSeconds = durationSeconds
        self.hours = self.durationSeconds / 3600
        self.minutes = (self.durationSeconds % 3600) / 60
        print(self._durationSeconds)
        self.seconds = self.durationSeconds % 60
    }

    func updateDurationSeconds() {
        durationSeconds = hours * 3600 + minutes * 60 + seconds
    }

    var body: some View {
        HStack(spacing: 12) {
            Stepper(value: $hours, in: minutes == 0 && seconds == 0 ? 1...9 : 0...60) {
                Text("\(hours) hours")
            } onEditingChanged: { isEditing in
                if isEditing {
                    updateDurationSeconds()
                }
            }
            Stepper(value: $minutes, in: hours == 0 && seconds == 0 ? 1...59 : 0...59) {
                Text("\(minutes) min.")
            } onEditingChanged: { isEditing in
                if isEditing {
                    updateDurationSeconds()
                }
            }
            Stepper(value: $seconds, in: hours == 0 && minutes == 0 ? 1...59 : 0...59) {
                Text("\(seconds) sec.")
            } onEditingChanged: { isEditing in
                if isEditing {
                    updateDurationSeconds()
                }
            }
        }
        .padding(.leading, 12)
        .background(.background)
        .cornerRadius(4)
    }
}

struct DurationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DurationPickerView(durationSeconds: .constant(123))
    }
}
