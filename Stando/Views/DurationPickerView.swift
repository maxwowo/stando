//
//  DurationPickerView.swift
//  Stando
//
//  Created by Max Wo on 25/7/2023.
//

import SwiftUI

struct DurationPickerView: View {
    @Binding var durationSeconds: Int

    private var hours: Int {
        durationSeconds / 3600
    }

    private var minutes: Int {
        (durationSeconds % 3600) / 60
    }

    private var seconds: Int {
        durationSeconds % 60
    }

    init(durationSeconds: Binding<Int>) {
        self._durationSeconds = durationSeconds
    }

    func updateDurationSeconds() {
        durationSeconds = hours * 3600 + minutes * 60 + seconds
    }

    var body: some View {
        HStack {
            Stepper {
                Text("\(hours) hours")
            } onIncrement: {
                if hours < 9 {
                    durationSeconds += 3600
                }
            } onDecrement: {
                if durationSeconds > 3600 {
                    durationSeconds -= 3600
                }
            }

            Stepper {
                Text("\(minutes) min.")
                    .frame(width: 50, alignment: .trailing)
            } onIncrement: {
                if minutes < 59 {
                    durationSeconds += 60
                }
            } onDecrement: {
                if durationSeconds > 60 {
                    durationSeconds -= 60
                }
            }

            Stepper {
                Text("\(seconds) sec.")
                    .frame(width: 50, alignment: .trailing)
            } onIncrement: {
                if seconds < 59 {
                    durationSeconds += 1
                }
            } onDecrement: {
                if durationSeconds > 1 {
                    durationSeconds -= 1
                }
            }
        }
        .padding(.leading, 20)
        .background(.background)
        .cornerRadius(4)
    }
}

struct DurationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DurationPickerView(durationSeconds: .constant(123))
    }
}
