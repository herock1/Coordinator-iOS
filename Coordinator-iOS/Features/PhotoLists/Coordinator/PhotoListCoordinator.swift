//
//  TopChartsCoordinator.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 30/1/23.
//

import Foundation

import UIKit

protocol TopChartdFlow {
    func coordinateToDetail()
}

class PhotoListCoordinator: Coordinator, TopChartdFlow {

    weak var navigationController: UINavigationController?

    // Navigation Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // StartTopChart
    func start() {

        let storyboard = UIStoryboard(name: "PhotoLists", bundle: nil)
        let topChartsVC = storyboard.instantiateViewController(withIdentifier: "topCharts") as? PhotoListVC
            topChartsVC?.coordinator = self
        if let topChartsVC {
            navigationController?.pushViewController(topChartsVC, animated: false)
        }
    }

    // MARK: - Flow Methods
    func coordinateToDetail() {
//        let topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
//        coordinate(to: topRatedDetailCoordinator)
    }
}
