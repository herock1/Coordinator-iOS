//
//  PlayCoordinator.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 25/1/23.
//

import Foundation
import UIKit

protocol PlayFlow {
    func goToTabBar()
}

class PlayCoordinator: Coordinator {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let playVC = storyboard.instantiateViewController(withIdentifier: "play") as? PlayVC
        playVC?.coordinator = self
        if let playVC {
            navigationController.pushViewController(playVC, animated: true)
        }
    }
}

extension PlayCoordinator: PlayFlow {
    func goToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
