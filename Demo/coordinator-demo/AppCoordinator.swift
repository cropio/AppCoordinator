//
//  AppCoordinator.swift
//  coordinator-demo
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private var sign = false
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() throws {
        if self.sign {
            try CRMain(window: self.window)
            .start()
        } else {
            try CRSignIn(window: self.window)
            .start()
            self.sign = true
        }
    }
}
