//
//  CRTab2.swift
//  coordinator-demo
//
//  Created by Evegeny Kalashnikov on 5/30/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class CRTab2: TabCoordinator {
    typealias VC = VCTab2
    typealias RootType = UINavigationController
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    var identifier: String {
        return "VCTab2Navigation"
    }
    
    private(set) weak var viewController: VC?
    private(set) weak var rootViewController: RootType?
    
    init() { }
    
    func configuration(viewController: VC) throws {
        // you can configure view controller here
    }
    
    func setViewController(viewController: VC) {
        self.viewController = viewController
    }
    
    func configuration(rootViewController: RootType) throws {
        // you can configure root view controller here
    }
    
    func setRootViewController(rootViewController: RootType) {
        self.rootViewController = rootViewController
    }
    
    func navigate(coordination: Coordination) throws {
        if coordination.identifier == "showDetail" {
            try CRDetail(coordination: coordination, from: "Tab 2 UINavigationController")
                .start()
        }
    }
}
