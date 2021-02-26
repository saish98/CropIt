//
//  AppCoordinator.swift
//  CropIt
//
//  Created by Deepak Thakur on 26/02/21.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    private (set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let cropViewCoordinator = CropViewCoordinator(navigationController: navigationController)
        childCoordinators.append(cropViewCoordinator)
        cropViewCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

