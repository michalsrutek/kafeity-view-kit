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


public class DynamicTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    public var defaultCellHeight: CGFloat {
        set {
            dynamicLogic.defaultCellHeight = newValue
        }
        get {
            return dynamicLogic.defaultCellHeight
        }
    }
    
    public var defaultSectionHeight: CGFloat {
        set {
            dynamicLogic.defaultSectionHeight = newValue
        }
        get {
            return dynamicLogic.defaultSectionHeight
        }
    }
    
    public var registerNibsHandler: (() -> Void)? {
        set {
            dynamicLogic.registerNibsHandler = newValue
        }
        get {
            return dynamicLogic.registerNibsHandler
        }
    }
    
    public var reloadDataHandler: (() -> Void)? {
        set {
            dynamicLogic.reloadDataHandler = newValue
        }
        get {
            return dynamicLogic.reloadDataHandler
        }
    }
    
    public var controller: UIViewController? {
        set {
            dynamicLogic.controller = newValue
        }
        get {
            return dynamicLogic.controller
        }
    }
    
    public var sections: BehaviorRelay<[Section<CellData>]> {
        return dynamicLogic.sections
    }
    
    public let disposeBag = DisposeBag()
    
    public override var tableHeaderView: UIView? {
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
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configuration()
    }
    
    public override func didMoveToSuperview() {
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
    
    public func setup() {
        
    }
    
    public func registerNibs() {
        
    }
    
    public func bind() {
        
    }
    
    public override func reloadData() {
        super.reloadData()
    }
    
    public func setupData() -> [Section<CellData>] {
        return []
    }
    
    // MARK: - Table view
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dynamicLogic.numberOfSections(in: tableView)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dynamicLogic.tableView(tableView, numberOfRowsInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dynamicLogic.tableView(tableView, cellForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dynamicLogic.tableView(tableView, titleForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dynamicLogic.tableView(tableView, titleForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return dynamicLogic.tableView(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return dynamicLogic.tableView(tableView, viewForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return dynamicLogic.tableView(tableView, shouldHighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dynamicLogic.tableView(tableView, didSelectRowAt: indexPath)
    }

}
