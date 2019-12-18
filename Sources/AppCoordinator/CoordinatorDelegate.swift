//
//  CoordinatorDelegate.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import Foundation

public protocol CoordinatorDelegate: class {
    func willStart(in coordinator: Coordinator)
    func didStart(in coordinator: Coordinator)
    func willStop(in coordinator: Coordinator)
    func didStop(in coordinator: Coordinator)
}
