//
//  KeyboardManager.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit


public class KeyboardManager {
    
    public var heightChanged: ((CGFloat) -> Void)?
    
    public private(set) var height: CGFloat = 0.0 {
        didSet {
            heightChanged?(height)
        }
    }
    
    private var userInfo: [AnyHashable : Any]?
    
    public init() {
        addObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func animate(view: UIView) {
        let duration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.3
        let curve = UIView.KeyframeAnimationOptions(rawValue: userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt ?? 0)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: curve, animations: {
            view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let frame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue else {
            return
        }
        userInfo = notification.userInfo
        height = frame.height
    }
    
    @objc
    private func keyboardWillHide(notification: Notification) {
        guard let _ = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue else {
            return
        }
        userInfo = notification.userInfo
        height = 0.0
    }
}
