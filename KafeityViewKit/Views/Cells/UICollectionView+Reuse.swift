//
//  UICollectionView+Reuse.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit


public extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableCell {
        let identifier = T.defaultReuseId
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
    func register<T: ReusableCell>(cell: T.Type) {
        let nib = UINib(nibName: cell.defaultNibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: cell.defaultReuseId)
    }
    
}
