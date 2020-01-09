//
//  DynamicTableViewLogic.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


public class DynamicTableViewLogic: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    public var defaultCellHeight: CGFloat = 45.0 {
        didSet {
            if defaultCellHeight < 0.0 {
                defaultCellHeight = 0.0
            }
        }
    }
    
    public var defaultSectionHeight: CGFloat = 40.0 {
        didSet {
            if defaultSectionHeight < 0.0 {
                defaultSectionHeight = 0.0
            }
        }
    }
    
    public var registerNibsHandler: (() -> Void)? {
        didSet {
            registerNibsHandler?()
        }
    }
    
    public var reloadDataHandler: (() -> Void)? {
        didSet {
            reloadDataHandler?()
            tableView?.reloadData()
        }
    }
    
    public weak var controller: UIViewController?
    
    public weak var tableView: UITableView?
    
    public let sections: BehaviorRelay<[Section<CellData>]>
    
    private let disposeBag = DisposeBag()
    
    public override init() {
        sections = BehaviorRelay(value: [])
        super.init()
        
        sections.asObservable().subscribe(onNext: { sections in
            DispatchQueue.main.async {
                self.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Logic
    
    public func registerNibs() {
        registerNibsHandler?()
    }
    
    public func reloadData() {
        reloadDataHandler?()
        tableView?.reloadData()
    }
    
    // MARK: - Table View
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.value.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.value[section].data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = Section.dataObject(sections: sections.value, indexPath: indexPath) else {
            return UITableViewCell()
        }
        let cell = cellData.cell.perform(tableView, indexPath)
        
        if (cellData.segue != nil || cellData.select != nil) && cellData.showAccessoryIndicator {
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        else {
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sections.value[section].data.count == 0 {
            return nil
        }
        return sections.value[section].title
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if sections.value[section].data.count == 0 {
            return nil
        }
        return sections.value[section].footerTitle
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = sections.value[section].header else {
            return nil
        }
        return header.perform(tableView, section)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionData = sections.value[section]
        if self.tableView(tableView, titleForHeaderInSection: section) == nil && sectionData.header == nil {
            if let height = sectionData.headerHeight {
                return height
            }
            return 0.0
        }
        if let height = sectionData.headerHeight {
            return height
        }
        return defaultSectionHeight
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = sections.value[section].footer else {
            return nil
        }
        return footer.perform(tableView, section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionData = sections.value[section]
        if self.tableView(tableView, titleForFooterInSection: section) == nil && sectionData.footer == nil {
            if let height = sectionData.footerHeight {
                return height
            }
            return 0.0
        }
        if let height = sectionData.footerHeight {
            return height
        }
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellData = Section.dataObject(sections: sections.value, indexPath: indexPath) else {
            return 0.0
        }
        if let heightClosure = cellData.height {
            return heightClosure.perform(tableView)
        }
        if tableView.rowHeight == UITableView.automaticDimension && tableView.estimatedRowHeight > 0.0 && cellData.autoHeight {
            return UITableView.automaticDimension
        }
        return defaultCellHeight
        
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        guard let cellData = Section.dataObject(sections: sections.value, indexPath: indexPath) else {
            return false
        }
        return cellData.segue != nil || cellData.select != nil
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellData = Section.dataObject(sections: sections.value, indexPath: indexPath) else {
            return
        }
        
        if let selectHandler = cellData.select {
            selectHandler.perform(tableView, indexPath)
        }
        if let segue = cellData.segue {
            controller?.performSegue(withIdentifier: segue, sender: self)
        }
    }
    
}
