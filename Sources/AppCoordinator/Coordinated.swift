//
//  Coordinated.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import Foundation

/// Used typically on view controllers to refer to it's coordinator
public protocol Coordinated {
    func getCoordinator() -> Coordinator?
    mutating func setCoordinator(_ coordinator: Coordinator)
}
