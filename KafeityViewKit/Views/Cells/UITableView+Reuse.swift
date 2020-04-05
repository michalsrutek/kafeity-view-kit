//
//  UITableView+Reuse.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit

public extension UITableView {
    func register<T: ReusableCell>(cell: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: cell.defaultNibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: cell.defaultReuseId)
    }

    func register<T: ReusableHeaderFooter>(view: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: view.defaultNibName, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: view.defaultReuseId)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableCell {
        let identifier = T.defaultReuseId
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReusableHeaderFooter {
        let identifier = T.defaultReuseId
        return dequeueReusableHeaderFooterView(withIdentifier: identifier) as! T
    }
}
