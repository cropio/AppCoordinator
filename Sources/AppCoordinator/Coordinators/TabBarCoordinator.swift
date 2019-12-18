//
//  TabBarCoordinator.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

public protocol TabBarCoordinator: Coordinator {
    var window: UIWindow { get }
    var storyboard: UIStoryboard { get }
    var identifier: String { get }
    
    /// must to be weak
    var tabBarController: UITabBarController? { get }
    
    func configuration(tabBarController: UITabBarController) throws
    func setTabBarController(tabBarController: UITabBarController)
}

public extension TabBarCoordinator {
    
    func start() throws {
        guard let tabBarController = self.storyboard.instantiateViewController(withIdentifier: self.identifier) as? UITabBarController else {
            throw CoordinatorError.start(message: "Not correct tabBarController for identifier '\(self.identifier)'")
        }
        
        try self.configuration(tabBarController: tabBarController)
        self.setTabBarController(tabBarController: tabBarController)
        
        self.window.rootViewController = tabBarController
        self.window.makeKeyAndVisible()
    }
    
    func tab<Tab: TabCoordinator>(for coordinator: Tab) throws -> UIViewController {
        try coordinator.start()
        
        guard let viewController = coordinator.rootViewController else {
            throw CoordinatorError.start(message: "TabCoordinator start not correct, root view controller not seted")
        }
        return viewController
    }
    
    func tab<Tab: TabCoordinator>(for coordinator: Tab) throws -> UIViewController where Tab.RootType == UIViewController {
        try coordinator.start()
        
        guard let viewController = coordinator.viewController else {
            throw CoordinatorError.start(message: "TabCoordinator start not correct, view controller not seted")
        }
        return viewController
    }
}
