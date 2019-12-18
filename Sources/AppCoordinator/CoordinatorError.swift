//
//  CoordinatorError.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import Foundation

enum CoordinatorError: Error {
    case wrongViewControllerType(type: String)
    case start(message: String)
    case start(message: String, coordination: Coordination)
    case notImplemented
}
