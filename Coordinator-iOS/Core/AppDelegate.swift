//
//  AppDelegate.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 17/1/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        self.coordinator = AppCoordinator(window: window!)
        self.coordinator.start()
        return true
    }
    // MARK: UISceneSession Lifecycle

}
