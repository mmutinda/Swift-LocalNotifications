//
//  NotificationPublisher.swift
//  Localnotifications
//
//  Created by Michael Mutinda on 7/14/20.
//  Copyright © 2020 Michael Mutinda. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationPublisher: NSObject {
    
    func sendNotification(title: String,
                          subtitle: String,
                          body: String,
                          badge:Int?,
                          delayInterval:Int?) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        
        
        var delayTimeTrigger: UNTimeIntervalNotificationTrigger?
        
        if let delayInterval = delayInterval {
            delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delayInterval), repeats: false)
        }
        
        if let badge = badge {
            var currentbage = UIApplication.shared.applicationIconBadgeNumber

            currentbage += badge
            notificationContent.badge = NSNumber(integerLiteral: currentbage)
            
        }
        
        notificationContent.sound = UNNotificationSound.default
        
        UNUserNotificationCenter.current().delegate = self
        let request = UNNotificationRequest(identifier: "TestLocal", content: notificationContent, trigger: delayTimeTrigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error)
            }
        }
    }
}

extension NotificationPublisher: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("THe notifications is about to be presented ")
        completionHandler([.alert,.badge,.sound])
            
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let identifier = response.actionIdentifier
        
        switch identifier {
            case UNNotificationDismissActionIdentifier:
                print("The notification was dismissed")
                completionHandler()
            case UNNotificationDefaultActionIdentifier:
                print("The user opened the app from the notification")
                completionHandler()
            default:
                print("We reached the default part")
                completionHandler()
        }
    }
}
