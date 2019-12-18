//
//  VCDetail.swift
//  coordinator-demo
//
//  Created by Evegeny Kalashnikov on 5/30/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class VCDetail: UIViewController {
    @IBOutlet private weak var fromLabel: UILabel!
    @IBOutlet private weak var closeButton: UIBarButtonItem!
    
    var viewModel: VMDetail!
    private var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fromLabel.text = "From " + self.viewModel.from
        self.closeButton.isEnabled = self.viewModel.isShowClose || UIDevice.current.userInterfaceIdiom == .phone
    }
    
    @IBAction func closeAction(_ sender: Any) {
        try? self.coordinator?.stop()
    }
}

extension VCDetail: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return self.coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
