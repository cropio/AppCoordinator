//
//  DetailCoordinator.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

public protocol DetailCoordinator: Coordinator {
    associatedtype VC: UIViewController & Coordinated
    
    /// must to be weak
    var viewController: VC? { get }
    
    /// must to be weak
    var delegate: CoordinatorDelegate? { get }
    
    var coordination: Coordination { get }
}

public extension DetailCoordinator {
    
    func start() throws {
        
        guard let from = self.coordination.from, let to = self.coordination.to else {
            throw CoordinatorError.start(message: "'from' or 'to' is nil.", coordination: self.coordination)
        }
        guard var viewController = self.viewController else {
            throw CoordinatorError.start(message: "'viewController' is nil.", coordination: self.coordination)
        }
        
        viewController.setCoordinator(self)
        self.delegate?.willStart(in: self)

        switch self.coordination.type {
        case .push:
            
            guard let _from = from as? UINavigationController else {
                throw CoordinatorError.start(message: "'from' in 'push' type must be UINavigationController", coordination: self.coordination)
            }
            
            _from.pushViewController(to, animated: self.coordination.animated)
        case .present:
            from.present(to, animated: self.coordination.animated)
        case .showDetail:
            from.showDetailViewController(to, sender: nil)
        }
        
        self.delegate?.didStart(in: self)
    }
    
    func stop() throws {
        switch self.coordination.type {
        case .push:
            guard let from = self.coordination.from as? UINavigationController else {
                throw CoordinatorError.start(message: "'from' in 'push' type must be UINavigationController", coordination: self.coordination)
            }
            
            self.delegate?.willStop(in: self)
            from.popViewController(animated: self.coordination.animated)
            self.delegate?.didStop(in: self)
        case .present:
            guard let to = self.coordination.to else {
                throw CoordinatorError.start(message: "'to' is nil", coordination: self.coordination)
            }
            
            self.delegate?.willStop(in: self)
            to.dismiss(animated: self.coordination.animated, completion: {
                self.delegate?.didStop(in: self)
            })
        case .showDetail:
            guard let to = self.coordination.to else {
                throw CoordinatorError.start(message: "'to' is nil", coordination: self.coordination)
            }
            
            // Not possible to pop on ipad
            guard let navigationController = to.navigationController else { return }
            
            self.delegate?.willStop(in: self)
            navigationController.popViewController(animated: self.coordination.animated)
            self.delegate?.didStop(in: self)
        }

    }
}
