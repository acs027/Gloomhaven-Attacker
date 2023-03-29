//
//  AppDelegate.swift
//  CardFlip
//
//  Created by Furkan Eken on 8.03.2023.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication,
    supportedInterfaceOrientationsFor window:
    UIWindow?) -> UIInterfaceOrientationMask {
    return AppDelegate.orientationLock
    }
}
