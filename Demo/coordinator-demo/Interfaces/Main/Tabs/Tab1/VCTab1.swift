//
//  VCTab1.swift
//  coordinator-demo
//
//  Created by Evegeny Kalashnikov on 5/30/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class VCTab1: UIViewController {
    private var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension VCTab1: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return self.coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
