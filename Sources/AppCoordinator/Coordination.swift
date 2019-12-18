//
//  Coordination.swift
//  Coordinator
//
//  Created by Evgeny Kalashnikov on 4/22/19.
//

import UIKit

public struct Coordination {
    enum CoordinationType {
        case push
        case present
        case showDetail
    }
    
    let type: CoordinationType
    weak var from: UIViewController?
    weak var to: UIViewController?
    public var animated: Bool
    public let identifier: String?
    public let sender: Any?
    
    init(type: CoordinationType, from: UIViewController, to: UIViewController, animated: Bool = true, identifier: String?, sender: Any?) {
        self.type = type
        self.from = from
        self.to = to
        self.animated = animated
        self.identifier = identifier
        self.sender = sender
    }
    
    public func viewController<T: UIViewController>() throws -> T {
        var viewController = self.to
        
        if let to = self.to as? UINavigationController {
            viewController = to.topViewController ?? self.to
        }
        
        guard let _viewController = viewController as? T else {
            throw CoordinatorError.wrongViewControllerType(type: String(describing: viewController) + " to type -> \(T.self)")
        }
        
        return _viewController
    }
}
