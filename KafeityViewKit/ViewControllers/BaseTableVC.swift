//
//  BaseTableVC.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift


open class BaseTableVC: UITableViewController {

    public let disposeBag = DisposeBag()
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }

    open func setupViews() {
    }

    open func bind() {
    }
    
    open func reload() {
    }
    
}
