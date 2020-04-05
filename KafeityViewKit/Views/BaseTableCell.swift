//
//  BaseTableCell.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import RxSwift
import UIKit

open class BaseTableCell: UITableViewCell, ReusableCell {
    public private(set) var disposeBag = DisposeBag()

    open override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    open override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open func setup() {}
}
