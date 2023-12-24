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
    @AppStorage(SettingConstants.notificationSoundPath) private var notificationSoundPath = "default"

    struct CustomToneOption: Identifiable {
        var id: String
        var text: String
    }

    private var defaultToneOption = CustomToneOption(id: "default", text: "Default")

    @State private var toneOptions: [CustomToneOption] = []

    private let frameHeight: Double = 20

    func readSystemSoundDirectoryContents() {
        let systemSoundsURL = URL(fileURLWithPath: "/System/Library/Sounds")

        do {
            let toneFiles = try FileManager.default.contentsOfDirectory(at: systemSoundsURL, includingPropertiesForKeys: nil)

            toneOptions = toneFiles.map { toneFile in CustomToneOption(id: toneFile.absoluteString, text: toneFile.deletingPathExtension().lastPathComponent) }.sorted { $0.text < $1.text}
        } catch {
            print("Error reading sounds directory contents: \(error)")
        }
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .trailing) {
                Text("Be notified")
                    .frame(height: frameHeight)
                Text("Custom tone")
                    .frame(height: frameHeight)
                Text("Tone volume")
                    .frame(height: frameHeight)
            }
            VStack(alignment: .leading) {
                Toggle("Send notifications to sit / stand", isOn: $isSendingMovementNotifications)
                    .frame(height: frameHeight)

                HStack {
                    Picker("Select a file", selection: $notificationSoundPath) {
                        Text(defaultToneOption.text).tag(defaultToneOption.id)

                        Divider()

                        ForEach(toneOptions) { fileName in
                            Text(fileName.text).tag(fileName.id)
                        }
                    }
                    .labelsHidden()
                    .onAppear(perform: {
                        readSystemSoundDirectoryContents()
                    })

                    Button {

                    } label: {
                        Image(systemName: "play.circle")
                    }
                    .buttonStyle(.plain)
                }.frame(width: 200, height: frameHeight)

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
