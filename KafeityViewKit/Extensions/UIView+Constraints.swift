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
        addSubview(view)

        addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: offset.x))
        addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: offset.y))
    }

    func addFullSizeConstraints(view: UIView, edgeInsets: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        // self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions.alignAllFirstBaseline, metrics: nil, views: ["view" : view]))
        addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: edgeInsets.top))
        addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -edgeInsets.right))
        addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -edgeInsets.bottom))
        addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: edgeInsets.left))
    }

    func addSizeConstraints(width: CGFloat? = nil, height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false

        if let width = width {
            addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1.0, constant: width))
        }
        if let height = height {
            addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1.0, constant: height))
        }
    }

    func addConstraint(view: UIView, left: Bool = true, top: Bool = true, right: Bool = true, bottom: Bool = true) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if self != view.superview {
            addSubview(view)
        }

        if left {
            addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0.0))
        }
        if top {
            addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0.0))
        }
        if right {
            addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0.0))
        }
        if bottom {
            addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0.0))
        }
    }

    func addConstraint(view: UIView, left: CGFloat?, top: CGFloat?, right: CGFloat?, bottom: CGFloat?) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if self != view.superview {
            addSubview(view)
        }

        if left != nil {
            addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: left!))
        }
        if top != nil {
            addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: top!))
        }
        if right != nil {
            addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -right!))
        }
        if bottom != nil {
            addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -bottom!))
        }
    }

    func addEqualSizeConstraint(firstView: UIView, secondView: UIView, edgeInsets: UIEdgeInsets = .zero) {
        // self.translatesAutoresizingMaskIntoConstraints = false

        // self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions.alignAllFirstBaseline, metrics: nil, views: ["view" : view]))
        addConstraint(NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: secondView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: edgeInsets.top))
        addConstraint(NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: secondView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: edgeInsets.right))
        addConstraint(NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: secondView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: edgeInsets.bottom))
        addConstraint(NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: secondView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: edgeInsets.left))
    }
}
