//
//  ViewController.swift
//  Localnotifications
//
//  Created by Michael Mutinda on 7/14/20.
//  Copyright © 2020 Michael Mutinda. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    
    private var publisher = NotificationPublisher()
    
    @IBAction func handleBtnTapped(_ sender: UIButton) {
        publisher.sendNotification(title: "Title", subtitle: "Message", body: "michael falds", badge: 1, delayInterval: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let center = UNUserNotificationCenter.current()
        
//        center.requestAuthorization(options: [.alert, .sound]) {
//            (granted, error) in
//            print(granted)
//        }
//
//        let content = UNMutableNotificationContent()
//        content.title = "Today is tuesday"
//        content.body = "hey michael "
//
//        let date = Date().addingTimeInterval(2)
//
//        let dateComponents = Calendar.current.dateComponents([.year, .month,.day,.hour,.minute,.second], from: date)
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//
//        let uuid = UUID().uuidString
//
//        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
//
//        center.add(request) { (error) in
//            print(error)
//        }
        
        
        
    }


}

