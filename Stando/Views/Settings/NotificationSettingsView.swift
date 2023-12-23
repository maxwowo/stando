//
//  NotificationSettingsView.swift
//  Stando
//
//  Created by Max Wo on 23/12/2023.
//

import SwiftUI

struct NotificationSettingsView: View {
    @AppStorage(SettingConstants.isSendingMovementNotifications) private var isSendingMovementNotifications = true
    @AppStorage(SettingConstants.notificationVolume) private var notificationVolume = 1.0

    private let frameHeight: Double = 20

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .trailing) {
                Text("Be notified")
                    .frame(height: frameHeight)
                Text("Notification volume")
                    .frame(height: frameHeight)
            }
            VStack(alignment: .leading) {
                Toggle("Send notifications to sit / stand", isOn: $isSendingMovementNotifications)
                    .frame(height: frameHeight)
                Slider(value: $notificationVolume, in: 0.0...1.0) {} minimumValueLabel: {
                    Image("speaker.fill")
                } maximumValueLabel: {
                    Image("speaker.wave.3.fill")
                }
                .frame(width: 200, height: frameHeight)
            }
        }
    }
}

struct NotificationSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSettingsView()
    }
}
