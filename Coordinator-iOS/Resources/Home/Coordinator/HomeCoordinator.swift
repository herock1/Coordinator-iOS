//
//  HomeCoordinator.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 24/1/23.
//

import Foundation
import UIKit

protocol StartFlow {
    func openNext()
    func pauseMusic()
}

class HomeCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "home") as? HomeVC
         homeVC?.coordinator = self
        if let homeVC {
            navigationController.pushViewController(homeVC, animated: true)
        }
        for val in 0...10{
            print( val)
        }
    }
}

extension HomeCoordinator: StartFlow {
   
    func openNext() {
        let startCoordinator = PlayCoordinator(navigationController: navigationController)
            coordinate(to: startCoordinator)

    }
    
    // pause music
    func pauseMusic() {
    }
}
