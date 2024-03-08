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

    func incrementHour() {
        durationSeconds += 3600
    }

    func decrementHour() {
        durationSeconds -= 3600
    }

    func incrementMinute() {
        durationSeconds += 60
    }

    func decrementMinute() {
        durationSeconds -= 60
    }

    func incrementSecond() {
        durationSeconds += 1
    }

    func decrementSecond() {
        durationSeconds -= 1
    }

    var body: some View {
        HStack(spacing: 10) {
            Stepper {
                Text("\(hours) hours")
                    .frame(width: 50, alignment: .trailing)
            } onIncrement: {
                if hours < 9 {
                    incrementHour()
                }
            } onDecrement: {
                if minutes == 0 && seconds == 0 {
                    if hours > 1 {
                        decrementHour()
                    }
                } else {
                    if hours > 0 {
                        decrementHour()
                    }
                }
            }
            .background(.background)
            .cornerRadius(4)

            Stepper {
                Text("\(minutes) min.")
                    .frame(width: 50, alignment: .trailing)
            } onIncrement: {
                if minutes < 59 {
                    incrementMinute()
                }
            } onDecrement: {
                if hours == 0 && seconds == 0 {
                    if minutes > 1 {
                        decrementMinute()
                    }
                } else {
                    if minutes > 0 {
                        decrementMinute()
                    }
                }
            }
            .background(.background)
            .cornerRadius(4)

            Stepper {
                Text("\(seconds) sec.")
                    .frame(width: 50, alignment: .trailing)
            } onIncrement: {
                if seconds < 59 {
                    incrementSecond()
                }
            } onDecrement: {
                if hours == 0 && minutes == 0 {
                    if seconds > 1 {
                        decrementSecond()
                    }
                } else {
                    if seconds > 0 {
                        decrementSecond()
                    }
                }
            }
            .background(.background)
            .cornerRadius(4)
        }
    }
}

struct DurationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DurationPickerView(durationSeconds: .constant(1234))
    }
}
