//
//  CoordinatorSegue.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

public class CoordinatorSegue: UIStoryboardSegue {
    
    let coordinator: Coordinator
    var sender: Any? {
        return self.value(forKey: "_sender")
    }
    
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        guard let _source = source as? Coordinated else {
            fatalError("🔴 coordinator not Coordinated protocol type")
        }
        guard let coordinator = _source.getCoordinator() else {
            fatalError("🔴 source.getCoordinator() - coordinator == nil")
        }
        
        self.coordinator = coordinator
        
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    override public func perform() {
        fatalError("🔴 Not use me! Use some of this -> CoordinatorPushSegue, CoordinatorPresentSegue, CoordinatorShowDetailSegue")
    }
    
    func navigate(coordination: Coordination) {
        do {
            try self.coordinator.navigate(coordination: coordination)
        } catch let error {
            fatalError("🔴 Can't perform navigation with 'coordination' - \(coordination), error - \(error)")
        }
    }
}
