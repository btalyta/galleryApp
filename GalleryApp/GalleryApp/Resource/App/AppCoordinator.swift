//
//  AppCoordinator.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import UIKit

 class AppCoordinator {

     var window: UIWindow?
     var navigationController: UINavigationController

     init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
         self.window = window
         self.navigationController = navigationController
         setupNavigationController()
     }

     func start() {
         window?.makeKeyAndVisible()
         window?.rootViewController = navigationController

         let controller = GalleryViewController()
         navigationController.pushViewController(controller, animated: true)
     }

     private func setupNavigationController() {
         let appearance = UINavigationBarAppearance()
         appearance.configureWithTransparentBackground()
         navigationController.navigationBar.standardAppearance = appearance
         navigationController.navigationBar.scrollEdgeAppearance = appearance
         navigationController.navigationBar.prefersLargeTitles = true
     }
 }
