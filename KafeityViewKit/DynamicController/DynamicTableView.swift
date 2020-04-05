//
//  DynamicTableView.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

open class DynamicTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    open var defaultCellHeight: CGFloat {
        set {
            dynamicLogic.defaultCellHeight = newValue
        }
        get {
            dynamicLogic.defaultCellHeight
        }
    }

    open var defaultSectionHeight: CGFloat {
        set {
            dynamicLogic.defaultSectionHeight = newValue
        }
        get {
            dynamicLogic.defaultSectionHeight
        }
    }

    open var registerNibsHandler: (() -> Void)? {
        set {
            dynamicLogic.registerNibsHandler = newValue
        }
        get {
            dynamicLogic.registerNibsHandler
        }
    }

    open var reloadDataHandler: (() -> Void)? {
        set {
            dynamicLogic.reloadDataHandler = newValue
        }
        get {
            dynamicLogic.reloadDataHandler
        }
    }

    open var controller: UIViewController? {
        set {
            dynamicLogic.controller = newValue
        }
        get {
            dynamicLogic.controller
        }
    }

    open var sections: BehaviorRelay<[Section<CellData>]> {
        dynamicLogic.sections
    }

    public let disposeBag = DisposeBag()

    open override var tableHeaderView: UIView? {
        get {
            super.tableHeaderView
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
        // let sections = setupData()
        // Observable.just(sections).bind(to: self.sections).dispose()
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

    open func setup() {}

    open func registerNibs() {}

    open func bind() {}

    open override func reloadData() {
        super.reloadData()
    }

    open func setupData() -> [Section<CellData>] {
        []
    }

    // MARK: - Table view

    open func numberOfSections(in tableView: UITableView) -> Int {
        dynamicLogic.numberOfSections(in: tableView)
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dynamicLogic.tableView(tableView, numberOfRowsInSection: section)
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dynamicLogic.tableView(tableView, cellForRowAt: indexPath)
    }

    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dynamicLogic.tableView(tableView, titleForHeaderInSection: section)
    }

    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        dynamicLogic.tableView(tableView, titleForFooterInSection: section)
    }

    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        dynamicLogic.tableView(tableView, viewForHeaderInSection: section)
    }

    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        dynamicLogic.tableView(tableView, heightForHeaderInSection: section)
    }

    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        dynamicLogic.tableView(tableView, viewForFooterInSection: section)
    }

    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        dynamicLogic.tableView(tableView, heightForFooterInSection: section)
    }

    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        dynamicLogic.tableView(tableView, heightForRowAt: indexPath)
    }

    open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        dynamicLogic.tableView(tableView, shouldHighlightRowAt: indexPath)
    }

    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dynamicLogic.tableView(tableView, didSelectRowAt: indexPath)
    }
}
