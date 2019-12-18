//
//  VMDetail.swift
//  coordinator-demo
//
//  Created by Evegeny Kalashnikov on 5/30/19.
//  Copyright © 2019 Evgeny Kalashnikov. All rights reserved.
//

import Foundation

class VMDetail {
    let from: String
    
    init(from: String) {
        self.from = from
    }
    
    var isShowClose: Bool {
        return self.from != "Tab 3 UISplitViewController"
    }
}
