//
//  NotificationUtility.swift
//  Stando
//
//  Created by Max Wo on 5/4/2024.
//

import SwiftUI
import UserNotifications

struct NotificationUtility {
    static func sendNotification(title: String, subtitle: String?, sound: UNNotificationSound?) {
        let content = UNMutableNotificationContent()

        content.title = title

        if let subtitle = subtitle {
            content.subtitle = subtitle
        }

        content.sound = sound

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
