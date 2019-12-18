//
//  CoordinatorPresentSegue.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import Foundation

public class CoordinatorPresentSegue: CoordinatorSegue {
    
    override public func perform() {
        let coordination = Coordination(type: .present,
                                        from: self.source,
                                        to: self.destination,
                                        identifier: self.identifier,
                                        sender: self.sender)
        self.navigate(coordination: coordination)
    }
}
