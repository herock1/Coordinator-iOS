//
//  TabBarCoordinator.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 30/1/23.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController

    // Init Tabbar navigation
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // Start Tabbar
    func start() {
        let tabBarController = TabBarVC()
        tabBarController.coordinator = self
        let photoListNavigation = UINavigationController()
        photoListNavigation.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let photolistCoordinator = PhotoListCoordinator(navigationController: photoListNavigation)
        let feedsNavigation = UINavigationController()
        feedsNavigation.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search, tag: 1)
        let feedsCoordinator = FeedsCoordinator(navigationController: feedsNavigation)
        tabBarController.viewControllers = [photoListNavigation,
                                            feedsNavigation
        ]
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        coordinate(to: photolistCoordinator)
        coordinate(to: feedsCoordinator)
    }
}
