//
//  ContentView.swift
//  LocalNotificatioins
//
//  Created by Nitin Bhatt on 12/9/20.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    private func notificationInitialization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("successfully initialized")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    private func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Local Notification"
        content.subtitle = "Notification received"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    
    var body: some View {
        HStack{
            Button("Initialize"){
                self.notificationInitialization()
            }.padding().foregroundColor(.white).background(Color.red)
            
            Button("Schedule"){
                self.scheduleNotification()
            }.padding().foregroundColor(.white).background(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
