//
//  FeedsCoordinator.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 30/1/23.
//

import Foundation

import UIKit

protocol FeedsFlow {
    func coordinateToDetail()
}

class FeedsCoordinator: Coordinator, FeedsFlow {
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let storyboard = UIStoryboard(name: "Feeds", bundle: nil)
        let feedsVC = storyboard.instantiateViewController(withIdentifier: "feedsVC") as? FeedsVC
            feedsVC?.coordinator = self
        if let feedsVC {
            navigationController?.pushViewController(feedsVC, animated: false)

        }
    }

    // MARK: - Flow Methods
    func coordinateToDetail() {
//        let topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
//        coordinate(to: topRatedDetailCoordinator)
    }
}
