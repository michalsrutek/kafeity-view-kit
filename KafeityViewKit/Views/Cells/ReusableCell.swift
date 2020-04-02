//
//  ReusableCell.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit


public protocol ReusableCell: AnyObject {

    static var defaultReuseId: String { get }
    static var defaultNibName: String { get }

}

public extension ReusableCell where Self: UIView {

    static var defaultReuseId: String {
        return String(describing: self)
    }

    static var defaultNibName: String {
        return defaultReuseId
    }

}
