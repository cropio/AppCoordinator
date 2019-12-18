//
//  VCPopover.swift
//  coordinator-demo
//
//  Created by Evegeny Kalashnikov on 5/30/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class VCPopover: UIViewController {
    private var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        try? self.coordinator?.stop()
    }
}

extension VCPopover: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return self.coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
