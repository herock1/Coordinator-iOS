//
//  AppCoordinator.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 24/1/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow

    // Init window
    init(window: UIWindow) {
        self.window = window
    }

    // Start Home
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let startCoordinator = HomeCoordinator(navigationController: navigationController)
            coordinate(to: startCoordinator)
    }
}
