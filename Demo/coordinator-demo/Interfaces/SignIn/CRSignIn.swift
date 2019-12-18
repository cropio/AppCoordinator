//
//  CRSignIn.swift
//  coordinator-demo
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class CRSignIn: RootCoordinator {
    private(set) weak var viewController: VCSignIn?
    private(set) weak var delegate: CoordinatorDelegate?
    
    private(set) var window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    var storyboard: UIStoryboard {
        return .init(name: "SignIn", bundle: nil)
    }
    
    var identifier: String {
        return "VCSignIn"
    }
    
    func configuration(viewController: VCSignIn) throws {
        // configure your view controller
    }
    
    func setViewController(viewController: VCSignIn) {
        self.viewController = viewController
    }
    
    func navigate(coordination: Coordination) throws {
        if coordination.identifier == "toAbout" {
            try CRAbout(coordination: coordination)
            .start()
        }
    }
    
    func signedIn() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        delegate.start()
    }
}
