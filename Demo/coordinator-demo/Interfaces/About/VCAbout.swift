//
//  VCAbout.swift
//  coordinator-demo
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class VCAbout: UIViewController {
    private var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        try? self.coordinator?.stop()
    }
}

extension VCAbout: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return self.coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
