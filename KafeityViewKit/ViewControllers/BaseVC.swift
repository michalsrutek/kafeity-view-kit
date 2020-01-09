//
//  BaseVC.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift


class BaseVC<ContentView: UIView, ViewModel, RouterType: Router>: UIViewController {
    
    var router: RouterType!
    var viewModel: ViewModel!
    
    var contentView: ContentView {
        return view as! ContentView
    }

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        bind()
    }

    func setupViews() {
    }

    func bind() {
    }
    
}
