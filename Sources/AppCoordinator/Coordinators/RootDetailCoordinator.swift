//
//  RootDetailCoordinator.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

open class RootDetailCoordinator<VC: UIViewController & Coordinated>: DetailCoordinator {
    public private(set) weak var viewController: VC?
    public private(set) weak var delegate: CoordinatorDelegate?
    public private(set) var coordination: Coordination
    
    public init(coordination: Coordination, delegate: CoordinatorDelegate? = nil, configuration: ((VC) throws -> Void)? = nil) throws {
        self.coordination = coordination
        self.delegate = delegate
        
        let viewController: VC = try coordination.viewController()
        try configuration?(viewController)
        
        self.viewController = viewController
    }
    
    open func navigate(coordination: Coordination) throws { /* for override */ }
}
