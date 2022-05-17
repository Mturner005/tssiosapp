//
//  AppDelegate.swift
//  tssiosapp
//
//  Created by Michael Turner on 9/30/21.
//

import UIKit
import Firebase
import IterableSDK
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    private func setupNotifications() {
            UNUserNotificationCenter.current().delegate = self
            // ...
        }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        IterableAppIntegration.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }


    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        IterableAPI.register(token: deviceToken)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupNotifications()
        
        FirebaseApp.configure()
        
        let config = IterableConfig()
        config.urlDelegate = self
        IterableAPI.initialize(apiKey: "4416a6a514cc466a8c8790f5b67d991d", launchOptions: launchOptions, config: config)
        

        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                print(error)
            }
            
            print("User accepted notifcations")
        }
        
        return true
    }
    
    //MARK: Deep linking
    
//    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
//        guard let url = userActivity.webpageURL else {
//                        print("we made it to url false")
//                        return false
//                    }
//        
//                    // ITBL:
//                    print("we made it to IterableAPI handle true")
//                    return IterableAPI.handle(universalLink: url)
//                }

    
//    func application(_: UIApplication, continue userActivity: NSUserActivity, restorationHandler _: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
//            guard let url = userActivity.webpageURL else {
//                print("we made it to url false")
//                return false
//            }
//
//            // ITBL:
//            print("we made it to IterableAPI handle true")
//            return IterableAPI.handle(universalLink: url)
//        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_: UNUserNotificationCenter, willPresent _: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner, .list, .sound])
    }

    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        IterableAppIntegration.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
    }
}

extension AppDelegate: IterableURLDelegate {
    // return true if we handled the url
    func handle(iterableURL url: URL, inContext _: IterableActionContext) -> Bool {
        print("the extension break point stop us?")
        return false
    }
}
