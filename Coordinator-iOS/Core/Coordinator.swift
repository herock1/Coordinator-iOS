//
//  Coordinator.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 24/1/23.
//

import Foundation

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
