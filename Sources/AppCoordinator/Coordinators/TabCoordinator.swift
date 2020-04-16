//
//  TabCoordinator.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

public protocol TabCoordinatorRootType: AnyObject {}

extension UIViewController: TabCoordinatorRootType {}
extension UINavigationController: TabCoordinatorRootType {}
extension UISplitViewController: TabCoordinatorRootType {}

public protocol TabCoordinator: Coordinator {
    associatedtype VC: UIViewController & Coordinated
    associatedtype RootType: TabCoordinatorRootType
    
    var storyboard: UIStoryboard { get }
    var identifier: String { get }
    
    /// need to be week
    var viewController: VC? { get }
    /// need to be week
    var rootViewController: RootType? { get }
    
    func configuration(viewController: VC) throws
    func setViewController(viewController: VC)
    
    func configuration(rootViewController: RootType) throws
    func setRootViewController(rootViewController: RootType)
}

public extension TabCoordinator {
    func configuration(viewController: VC) throws { /* optional */ }
    func configuration(rootViewController: RootType) throws { /* optional */ }
}

public extension TabCoordinator where RootType == UIViewController {
    func configuration(rootViewController: RootType) throws { /* optional */ }
    func setRootViewController(rootViewController: RootType) { /* optional */ }
}

public extension TabCoordinator {

    func start() throws {

        if RootType.self == UIViewController.self {
            try self.startViewController()
        } else if RootType.self == UISplitViewController.self {
            try self.startSplitViewController()
        } else if RootType.self == UINavigationController.self {
            try self.startNavigationController()
        } else {
            throw CoordinatorError.start(message: "Unknown RootType")
        }
    }

    func startViewController() throws {
        guard var viewController = self.storyboard.instantiateViewController(withIdentifier: self.identifier) as? VC else {
            throw CoordinatorError.start(message: "Not correct viewController type for identifier '\(self.identifier)', must be '\(VC.self)'")
        }

        viewController.setCoordinator(self)

        try self.configuration(viewController: viewController)
        self.setViewController(viewController: viewController)
    }

    func startNavigationController() throws {

        guard let navigation = self.storyboard.instantiateViewController(withIdentifier: self.identifier) as? UINavigationController else {
            throw CoordinatorError.start(message: "Not correct NavigationController for identifier '\(self.identifier)'")
        }

        guard var viewController = navigation.topViewController as? VC else {
            throw CoordinatorError.start(message: "Not correct viewController type for identifier '\(self.identifier)', must be '\(VC.self)'")
        }

        viewController.setCoordinator(self)

        try self.configuration(viewController: viewController)
        self.setViewController(viewController: viewController)


        guard let _navigation = navigation as? RootType else {
            throw CoordinatorError.start(message: "Not correct RootType for identifier '\(self.identifier)'")
        }

        try self.configuration(rootViewController: _navigation)
        self.setRootViewController(rootViewController: _navigation)
    }

    func startSplitViewController() throws {
        guard let split = self.storyboard.instantiateViewController(withIdentifier: self.identifier) as? UISplitViewController else {
            throw CoordinatorError.start(message: "Not correct SplitViewController for identifier '\(self.identifier)'")
        }

        if let navigation = split.viewControllers.first as? UINavigationController {
            guard var viewController = navigation.topViewController as? VC else {
                throw CoordinatorError.start(message: "Not correct viewController type for identifier '\(self.identifier)', must be '\(VC.self)'")
            }

            viewController.setCoordinator(self)

            try self.configuration(viewController: viewController)
            self.setViewController(viewController: viewController)

        } else if var viewController = split.viewControllers.first as? VC {
            viewController.setCoordinator(self)

            try self.configuration(viewController: viewController)
            self.setViewController(viewController: viewController)
        } else {
            throw CoordinatorError.start(message: "Not correct viewController type for identifier '\(self.identifier)', must be '\(VC.self)'")
        }

        guard let _split = split as? RootType else {
            throw CoordinatorError.start(message: "Not correct RootType for identifier '\(self.identifier)'")
        }

        try self.configuration(rootViewController: _split)
        self.setRootViewController(rootViewController: _split)
    }
}
