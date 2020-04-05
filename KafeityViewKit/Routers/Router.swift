//
//  Router.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit

open class Router {
    public init() {}

    public func show(_ vc: UIViewController, from: UIViewController, withTransition transition: Transition = .push) {
        transition.perform(from: from, to: vc)
    }

    public func dismiss(_ controller: UIViewController, animated: Bool = true) {
        controller.dismiss(animated: animated, completion: nil)
    }

    public func pop(from nvc: UINavigationController, animated: Bool = true) {
        nvc.popViewController(animated: animated)
    }

    public func dismissToRoot(_ controller: UIViewController, animated: Bool = true) {
        if let nvc = controller as? UINavigationController {
            nvc.popToRootViewController(animated: animated)
        } else {
            controller.navigationController?.popToRootViewController(animated: animated)
        }
    }

    public func showError(_ vc: UIViewController, errorMessage: String) {
        let title = "Oops"
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
