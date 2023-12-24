//
//  NotificationSettingsView.swift
//  Stando
//
//  Created by Max Wo on 23/12/2023.
//

import SwiftUI
import AVFoundation

struct NotificationSettingsView: View {
    @AppStorage(SettingConstants.isSendingMovementNotifications) private var isSendingMovementNotifications = true
    @AppStorage(SettingConstants.notificationVolume) private var notificationVolume = 1.0
    @AppStorage(SettingConstants.notificationSoundPath) private var notificationSoundPath = "Default"

    @State private var audioPlayer: AVAudioPlayer?

    private let frameHeight: Double = 20

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .trailing) {
                Text("Be notified")
                    .frame(height: frameHeight)
                Text("Custom tone")
                    .frame(height: frameHeight)
            }
            VStack(alignment: .leading) {
                Toggle("Send notifications to sit / stand", isOn: $isSendingMovementNotifications)
                    .frame(height: frameHeight)

                HStack {
                    Picker("Select a file", selection: $notificationSoundPath) {
                        Text("Default").tag("Default")

                        Divider()

                        Text("Basso").tag("Basso.aiff")
                        Text("Blow").tag("Blow.aiff")
                        Text("Bottle").tag("Bottle.aiff")
                        Text("Frog").tag("Frog.aiff")
                        Text("Funk").tag("Funk.aiff")
                        Text("Glass").tag("Glass.aiff")
                        Text("Hero").tag("Hero.aiff")
                        Text("Morse").tag("Morse.aiff")
                        Text("Ping").tag("Ping.aiff")
                        Text("Pop").tag("Pop.aiff")
                        Text("Purr").tag("Purr.aiff")
                        Text("Sosumi").tag("Sosumi.aiff")
                        Text("Submarine").tag("Submarine.aiff")
                        Text("Tink").tag("Tink.aiff")
                    }
                    .labelsHidden()
                    .frame(width: 150, height: frameHeight)

                    Button {
                        guard let soundUrl = Bundle.main.url(forResource: notificationSoundPath, withExtension: nil) else {
                            return print("Audio file not found")
                        }

                        do {
                            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)

                            audioPlayer?.play()
                        } catch {
                            print("Error playing audio: \(error.localizedDescription)")
                        }
                    } label: {
                        Image(systemName: "play.circle")
                    }
                    .buttonStyle(.plain)
                    .disabled(notificationSoundPath == "Default")
                    .frame(height: frameHeight)
                }
            }
        }
    }
}

struct NotificationSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSettingsView()
    }
}
