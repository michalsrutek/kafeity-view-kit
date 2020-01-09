//
//  DynamicTableViewController.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DynamicTableViewController: UITableViewController {
    
    var defaultCellHeight: CGFloat {
        set {
            dynamicLogic.defaultCellHeight = newValue
        }
        get {
            return dynamicLogic.defaultCellHeight
        }
    }
    
    var defaultSectionHeight: CGFloat {
        set {
            dynamicLogic.defaultSectionHeight = newValue
        }
        get {
            return dynamicLogic.defaultSectionHeight
        }
    }
    
    var sections: BehaviorRelay<[Section<CellData>]> {
        return dynamicLogic.sections
    }
    
    let disposeBag = DisposeBag()
    
    private var dynamicLogic = DynamicTableViewLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let dynamicTableView = tableView as? DynamicTableView {
            dynamicLogic = dynamicTableView.dynamicLogic
        }
        
        dynamicLogic.controller = self
        dynamicLogic.tableView = self.tableView
        dynamicLogic.registerNibsHandler = { [weak self] in self?.registerNibs() }
        dynamicLogic.reloadDataHandler = { [weak self] in self?.reloadData() }
        
        setupViews()
        bind()
        
        let sections = setupData()
        Observable.just(sections).bind(to: self.sections).disposed(by: DisposeBag())
    }
    
    // MARK: - Logic
    
    func setupViews() {
        
    }
    
    func bind() {
        
    }
    
    func registerNibs() {
        
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func setupData() -> [Section<CellData>] {
        return []
    }

    // MARK: - Table view

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dynamicLogic.numberOfSections(in: tableView)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dynamicLogic.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dynamicLogic.tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dynamicLogic.tableView(tableView, titleForHeaderInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dynamicLogic.tableView(tableView, titleForFooterInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return dynamicLogic.tableView(tableView, viewForHeaderInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForHeaderInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return dynamicLogic.tableView(tableView, viewForFooterInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForFooterInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dynamicLogic.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return dynamicLogic.tableView(tableView, shouldHighlightRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dynamicLogic.tableView(tableView, didSelectRowAt: indexPath)
    }

}
