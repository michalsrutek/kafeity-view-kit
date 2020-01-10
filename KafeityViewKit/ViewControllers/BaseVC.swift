//
//  BaseVC.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift


public class BaseVC<ContentView: UIView, ViewModel, RouterType: Router>: UIViewController {
    
    public var router: RouterType!
    public var viewModel: ViewModel!
    
    public var contentView: ContentView {
        return view as! ContentView
    }

    public let disposeBag = DisposeBag()

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        bind()
    }

    public func setupViews() {
    }

    public func bind() {
    }
    
}
