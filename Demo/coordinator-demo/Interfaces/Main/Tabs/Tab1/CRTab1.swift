//
//  CRTab1.swift
//  coordinator-demo
//
//  Created by Evegeny Kalashnikov on 5/30/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class CRTab1: TabCoordinator {
    typealias VC = VCTab1
    typealias RootType = UIViewController
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    var identifier: String {
        return "VCTab1"
    }
    
    private(set) weak var viewController: VC?
    private(set) weak var rootViewController: RootType? // not seting for UIViewController RootType
    
    init() { }
    
    func configuration(viewController: VC) throws {
        // you can configure view controller
    }
    
    func setViewController(viewController: VC) {
        self.viewController = viewController
    }
    
    func navigate(coordination: Coordination) throws {
        if coordination.identifier == "showDetail" {
            try CRDetail(coordination: coordination, from: "Tab 1 UIViewController")
                .start()
        }
    }
}
