//
//  AppDelegate.swift
//  CardFlip
//
//  Created by Furkan Eken on 8.03.2023.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    static var decks: Decks?
    static var orientationLock = UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Register for the willTerminateNotification
        NotificationCenter.default.addObserver(self, selector: #selector(willTerminate), name: UIApplication.willTerminateNotification, object: nil)
        return true
    }

    @objc func willTerminate() {
        AppDelegate.decks?.save()
        print("App is about to be terminated")
    }
}

