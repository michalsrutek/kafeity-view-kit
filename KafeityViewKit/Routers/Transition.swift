//
//  Transition.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit

public enum Transition {
    case push
    case modal(animated: Bool)
    case replace(animated: Bool)

    public func perform(from: UIViewController, to: UIViewController) {
        switch self {
        case .push:
            from.show(to, sender: nil)
        case let .modal(animated):
            from.present(to, animated: animated, completion: nil)
        case let .replace(animated):
            from.navigationController?.setViewControllers([to], animated: animated)
        }
    }
}
