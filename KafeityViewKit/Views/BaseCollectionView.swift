//
//  BaseCollectionView.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift


public class BaseCollectionCell: UICollectionViewCell, ReusableCell {
    
    public private(set) var disposeBag = DisposeBag()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    public func setup() {
    }
}
