//
//  Coordinator.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import Foundation

public protocol Coordinator {
    /// Triggers navigation to the corresponding controller
    func start() throws
    
    /// Stops corresponding controller and returns back to previous one
    func stop() throws
    
    /// Called when segue navigation form corresponding controller to different controller is about to start and should handle this navigation
    func navigate(coordination: Coordination) throws
}

/// Navigate and stop methods are optional
public extension Coordinator {
    
    func stop() throws {
        throw CoordinatorError.notImplemented
    }
    
    func navigate(coordination: Coordination) throws {
        throw CoordinatorError.notImplemented
    }
}
