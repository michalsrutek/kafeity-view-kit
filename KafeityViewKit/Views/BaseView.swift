//
//  BaseView.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift


public class BaseView: UIView {
    
    public let disposeBag = DisposeBag()
    
    deinit {
        debugPrint("DEINIT \(String(_cocoaString: self))")
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        bind()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        bind()
    }
    
    public func xibSetup() -> UIView {
        let contentView = loadFromNib()
        contentView.backgroundColor = UIColor.clear
        addFullSizeConstraints(view: contentView)
        return contentView
    }
    
    public func setup() {
        
    }
    
    public func bind() {
        
    }
    
    private func loadFromNib<T: UIView>() -> T {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Error loading nib with name \(nibName)")
        }
        return view
    }
    
}
