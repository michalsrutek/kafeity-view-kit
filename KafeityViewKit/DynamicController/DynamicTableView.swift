//
//  DynamicTableView.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


open class DynamicTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    open var defaultCellHeight: CGFloat {
        set {
            dynamicLogic.defaultCellHeight = newValue
        }
        get {
            return dynamicLogic.defaultCellHeight
        }
    }
    
    open var defaultSectionHeight: CGFloat {
        set {
            dynamicLogic.defaultSectionHeight = newValue
        }
        get {
            return dynamicLogic.defaultSectionHeight
        }
    }
    
    open var registerNibsHandler: (() -> Void)? {
        set {
            dynamicLogic.registerNibsHandler = newValue
        }
        get {
            return dynamicLogic.registerNibsHandler
        }
    }
    
    open var reloadDataHandler: (() -> Void)? {
        set {
            dynamicLogic.reloadDataHandler = newValue
        }
        get {
            return dynamicLogic.reloadDataHandler
        }
    }
    
    open var controller: UIViewController? {
        set {
            dynamicLogic.controller = newValue
        }
        get {
            return dynamicLogic.controller
        }
    }
    
    open var sections: BehaviorRelay<[Section<CellData>]> {
        return dynamicLogic.sections
    }
    
    public let disposeBag = DisposeBag()
    
    open override var tableHeaderView: UIView? {
        get {
            return super.tableHeaderView
        }
        set {
            super.tableHeaderView = newValue
        }
    }
    
    public let dynamicLogic = DynamicTableViewLogic()
    
    public init(style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: style)
        configuration()
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configuration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configuration()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configuration()
    }
    
    open override func didMoveToSuperview() {
        super.didMoveToSuperview()
        //let sections = setupData()
        //Observable.just(sections).bind(to: self.sections).dispose()
    }
    
    private func configuration() {
        dataSource = self
        delegate = self
        
        dynamicLogic.tableView = self
        dynamicLogic.registerNibsHandler = registerNibs
        dynamicLogic.reloadDataHandler = reloadData
        
        setup()
        bind()
    }
    
    // MARK: - Logic
    
    open func setup() {
        
    }
    
    open func registerNibs() {
        
    }
    
    open func bind() {
        
    }
    
    open override func reloadData() {
        super.reloadData()
    }
    
    open func setupData() -> [Section<CellData>] {
        return []
    }
    
    // MARK: - Table view
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return dynamicLogic.numberOfSections(in: tableView)
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dynamicLogic.tableView(tableView, numberOfRowsInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dynamicLogic.tableView(tableView, cellForRowAt: indexPath)
    }
    
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dynamicLogic.tableView(tableView, titleForHeaderInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dynamicLogic.tableView(tableView, titleForFooterInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return dynamicLogic.tableView(tableView, viewForHeaderInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForHeaderInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return dynamicLogic.tableView(tableView, viewForFooterInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForFooterInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForRowAt: indexPath)
    }
    
    open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return dynamicLogic.tableView(tableView, shouldHighlightRowAt: indexPath)
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dynamicLogic.tableView(tableView, didSelectRowAt: indexPath)
    }

}
