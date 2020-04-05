//
//  UIView+Constraints.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit


public extension UIView {
    
    func addCenterConstraints(view: UIView, offset: CGPoint = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: offset.x))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: offset.y))
    }
    
    func addFullSizeConstraints(view: UIView, edgeInsets: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        //self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions.alignAllFirstBaseline, metrics: nil, views: ["view" : view]))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: edgeInsets.top))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -edgeInsets.right))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -edgeInsets.bottom))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: edgeInsets.left))
    }
    
    func addSizeConstraints(width: CGFloat? = nil, height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            self.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width))
        }
        if let height = height {
            self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height))
        }
    }
    
    func addConstraint(view: UIView, left: Bool = true, top: Bool = true, right: Bool = true, bottom: Bool = true) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if self != view.superview {
            self.addSubview(view)
        }
        
        if left {
            self.addConstraint(NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        }
        if top {
            self.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
        }
        if right {
            self.addConstraint(NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        }
        if bottom {
            self.addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        }
    }
    
    func addConstraint(view: UIView, left: CGFloat?, top: CGFloat?, right: CGFloat?, bottom: CGFloat?) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if self != view.superview {
            self.addSubview(view)
        }

        if left != nil {
            self.addConstraint(NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: left!))
        }
        if top != nil {
            self.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: top!))
        }
        if right != nil {
            self.addConstraint(NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -right!))
        }
        if bottom != nil {
            self.addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -bottom!))
        }
    }
    
    func addEqualSizeConstraint(firstView: UIView, secondView: UIView, edgeInsets: UIEdgeInsets = .zero) {
        //self.translatesAutoresizingMaskIntoConstraints = false
        
        //self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions.alignAllFirstBaseline, metrics: nil, views: ["view" : view]))
        self.addConstraint(NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: secondView, attribute: .top, multiplier: 1.0, constant: edgeInsets.top))
        self.addConstraint(NSLayoutConstraint(item: firstView, attribute: .right, relatedBy: .equal, toItem: secondView, attribute: .right, multiplier: 1.0, constant: edgeInsets.right))
        self.addConstraint(NSLayoutConstraint(item: firstView, attribute: .bottom, relatedBy: .equal, toItem: secondView, attribute: .bottom, multiplier: 1.0, constant: edgeInsets.bottom))
        self.addConstraint(NSLayoutConstraint(item: firstView, attribute: .left, relatedBy: .equal, toItem: secondView, attribute: .left, multiplier: 1.0, constant: edgeInsets.left))
    }
    
}
