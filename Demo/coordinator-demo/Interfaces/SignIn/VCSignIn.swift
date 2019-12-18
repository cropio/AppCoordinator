//
//  VCSignIn.swift
//  coordinator-demo
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class VCSignIn: UIViewController {
    private var coordinator: CRSignIn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        self.coordinator?.signedIn()
    }
}

extension VCSignIn: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return self.coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        guard let _coordinator = coordinator as? CRSignIn else { fatalError() }
        self.coordinator = _coordinator
    }
}
