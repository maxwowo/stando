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

    @State private var fileNames: [String] = []
    @State private var selectedFile: String?

    private let frameHeight: Double = 20

    func readSystemSoundDirectoryContents() {
        let systemSoundsURL = URL(fileURLWithPath: "/System/Library/Sounds")

        do {
            let soundFileURLs = try FileManager.default.contentsOfDirectory(at: systemSoundsURL, includingPropertiesForKeys: nil)
            fileNames = soundFileURLs.map { $0.lastPathComponent }
        } catch {
            print("Error reading system sound directory contents: \(error)")
        }
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .trailing) {
                Text("Be notified")
                    .frame(height: frameHeight)
                Text("Custom tones")
                    .frame(height: frameHeight)
                Text("Tone volume")
                    .frame(height: frameHeight)
            }
            VStack(alignment: .leading) {
                Toggle("Send notifications to sit / stand", isOn: $isSendingMovementNotifications)
                    .frame(height: frameHeight)

                Picker("Select a file", selection: $selectedFile) {
                    ForEach(fileNames, id: \.self) { fileName in
                        Text(fileName).tag(fileName)
                    }
                }
                .frame(width: 200, height: frameHeight)
                .labelsHidden()
                .onAppear(perform: {
                    readSystemSoundDirectoryContents()
                })

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
