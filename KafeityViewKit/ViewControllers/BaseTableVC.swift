//
//  BaseTableVC.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift


public class BaseTableVC: UITableViewController {

    public let disposeBag = DisposeBag()
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }

    public func setupViews() {
    }

    public func bind() {
    }
    
    public func reload() {
    }
    
}
