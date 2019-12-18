//
//  CRDetail.swift
//  coordinator-demo
//
//  Created by Evegeny Kalashnikov on 5/30/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import UIKit
import AppCoordinator

class CRDetail: RootDetailCoordinator<VCDetail> {
    init(coordination: Coordination, from: String) throws {
        try super.init(coordination: coordination) { vc in
            vc.viewModel = VMDetail(from: from)
        }
    }
}
