//
//  CropViewCoordinator.swift
//  CropIt
//
//  Created by Deepak Thakur on 26/02/21.
//

import UIKit

final class CropViewCoordinator: Coordinator {
    private (set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let cropViewController: CropViewController = .instantiate()
        let cropViewModel = CropViewModel()
        cropViewController.viewModel = cropViewModel
        navigationController.setViewControllers([cropViewController], animated: false)
    }
}
