//
//  TabBarCoordinator.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

public protocol TabBarCoordinator: Coordinator {
    associatedtype TB: UITabBarController & Coordinated

    var window: UIWindow { get }
    var storyboard: UIStoryboard { get }
    var identifier: String { get }

    /// must to be weak
    var tabBarController: TB? { get }

    func configuration(tabBarController: TB) throws
    func setTabBarController(tabBarController: TB)
}

public extension TabBarCoordinator {

    func start() throws {
        guard var tabBarController = self.storyboard.instantiateViewController(withIdentifier: self.identifier) as? TB else {
            throw CoordinatorError.start(message: "Not correct tabBarController for identifier '\(self.identifier)'")
        }

        tabBarController.setCoordinator(self)
        try self.configuration(tabBarController: tabBarController)
        self.setTabBarController(tabBarController: tabBarController)

        self.window.rootViewController = tabBarController
        self.window.makeKeyAndVisible()
    }

    func tab<Tab: TabCoordinator>(for coordinator: Tab) throws -> UIViewController {
        try coordinator.start()

        guard let viewController = coordinator.rootViewController as? UIViewController else {
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
