//
//  VCMain.swift
//  coordinator-demo
//
//  Created by Evegeny Kalashnikov on 16.04.2020.
//  Copyright © 2020 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class VCMain: UITabBarController {

    private var coordinator: CRMain?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension VCMain: Coordinated {

    func getCoordinator() -> Coordinator? {
        return self.coordinator
    }

    func setCoordinator(_ coordinator: Coordinator) {
        guard let coordinator = coordinator as? CRMain else {
            fatalError("Incorrect coordinator")
        }
        self.coordinator = coordinator
    }
}
