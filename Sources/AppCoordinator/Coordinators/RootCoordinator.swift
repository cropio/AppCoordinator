//
//  RootCoordinator.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

public protocol RootCoordinator: Coordinator {
    associatedtype VC: UIViewController & Coordinated
    
    /// must to be weak
    var viewController: VC? { get }
    
    /// must to be weak
    var delegate: CoordinatorDelegate? { get }
    
    var window: UIWindow { get }
    var storyboard: UIStoryboard { get }
    var identifier: String { get }
    
    func configuration(viewController: VC) throws
    func setViewController(viewController: VC)
}

public extension RootCoordinator {
    
    func start() throws {
        
        guard var viewController = self.storyboard.instantiateViewController(withIdentifier: self.identifier) as? VC else {
            throw CoordinatorError.start(message: "Not correct viewController type for identifier '\(self.identifier)', must be '\(VC.self)'")
        }
        
        viewController.setCoordinator(self)
        try self.configuration(viewController: viewController)
        self.setViewController(viewController: viewController)
        
        self.delegate?.willStart(in: self)
        
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
        
        self.delegate?.didStart(in: self)
    }
    
    func stop() throws {
        throw CoordinatorError.start(message: "Not possible to use stop on this coordinator")
    }
}
