//
//  BaseCollectionView.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import RxSwift
import UIKit

open class BaseCollectionCell: UICollectionViewCell, ReusableCell {
    public private(set) var disposeBag = DisposeBag()

    open override func awakeFromNib() {
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

    open override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    open func setup() {}
}
