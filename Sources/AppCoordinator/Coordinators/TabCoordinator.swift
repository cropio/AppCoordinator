//
//  TabCoordinator.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

public protocol TabCoordinator: Coordinator {
    associatedtype VC: UIViewController & Coordinated
    associatedtype RootType: UIViewController
    
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

public extension TabCoordinator where RootType: UIViewController {
    
    func start() throws {
        guard var viewController = self.storyboard.instantiateViewController(withIdentifier: self.identifier) as? VC else {
            throw CoordinatorError.start(message: "Not correct viewController type for identifier '\(self.identifier)', must be '\(VC.self)'")
        }
        
        viewController.setCoordinator(self)
        
        try self.configuration(viewController: viewController)
        self.setViewController(viewController: viewController)
    }
    
    func configuration(rootViewController: UIViewController) throws { /* not need */ }
    func setRootViewController(rootViewController: UIViewController) { /* not need */ }
}

public extension TabCoordinator where RootType == UINavigationController {
    
    func start() throws {
        
        guard let navigation = self.storyboard.instantiateViewController(withIdentifier: self.identifier) as? UINavigationController else {
            throw CoordinatorError.start(message: "Not correct NavigationController for identifier '\(self.identifier)'")
        }
        
        guard var viewController = navigation.topViewController as? VC else {
            throw CoordinatorError.start(message: "Not correct viewController type for identifier '\(self.identifier)', must be '\(VC.self)'")
        }
        
        viewController.setCoordinator(self)
        
        try self.configuration(viewController: viewController)
        self.setViewController(viewController: viewController)
        
        try self.configuration(rootViewController: navigation)
        self.setRootViewController(rootViewController: navigation)
    }
}

public extension TabCoordinator where RootType == UISplitViewController {
    
    func start() throws {
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
        
        try self.configuration(rootViewController: split)
        self.setRootViewController(rootViewController: split)
    }
}
