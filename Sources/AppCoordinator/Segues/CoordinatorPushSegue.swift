//
//  CoordinatorPushSegue.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import Foundation

public class CoordinatorPushSegue: CoordinatorSegue {
    
    override public func perform() {
        
        guard let navigation = self.source.navigationController else {
            fatalError("🔴 source must have UINavigationController")
        }
        
        let coordination = Coordination(type: .push,
                                        from: navigation,
                                        to: self.destination,
                                        identifier: self.identifier,
                                        sender: self.sender)
        self.navigate(coordination: coordination)
    }
}
