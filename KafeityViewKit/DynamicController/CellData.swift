//
//  CellData.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit

public class CellData {
    public typealias TableIndexHandlerType = FWTwo<UITableView, IndexPath>
    public typealias TableCellHandlerType = FWTwoOut<UITableView, IndexPath, UITableViewCell>

    public let cell: TableCellHandlerType
    public private(set) var height: FWOneOut<UITableView, CGFloat>?

    public let select: TableIndexHandlerType?
    public let segue: String?
    public let showAccessoryIndicator: Bool

    public var autoHeight = false

    public convenience init(cell: TableCellHandlerType) {
        self.init(cell: cell, segue: nil)
    }

    public convenience init(nCell: TableCellHandlerType) {
        self.init(cell: nCell, segue: nil, showAccessoryIndicator: false)
    }

    public convenience init(cell: TableCellHandlerType, staticHeight: CGFloat, select: TableIndexHandlerType? = nil, showAccessoryIndicator: Bool = true) {
        self.init(cell: cell, height: nil, select: select, showAccessoryIndicator: showAccessoryIndicator)
        height = FWOneOut(self) { _ in { _ in staticHeight } }
    }

    public convenience init(nCell: TableCellHandlerType, staticHeight: CGFloat, select: TableIndexHandlerType? = nil) {
        self.init(cell: nCell, height: nil, select: select, showAccessoryIndicator: false)
        height = FWOneOut(self) { _ in { _ in staticHeight } }
    }

    public convenience init(cell: TableCellHandlerType, select: TableIndexHandlerType? = nil, segue: String? = nil, showAccessoryIndicator: Bool = true) {
        self.init(cell: cell, height: nil, select: select, segue: segue, showAccessoryIndicator: showAccessoryIndicator)
    }

    public convenience init(nCell: TableCellHandlerType, height: FWOneOut<UITableView, CGFloat>? = nil, select: TableIndexHandlerType? = nil) {
        self.init(cell: nCell, height: nil, select: select, segue: nil, showAccessoryIndicator: false)
    }

    public init(cell: TableCellHandlerType, height: FWOneOut<UITableView, CGFloat>?, select: TableIndexHandlerType? = nil, segue: String? = nil, showAccessoryIndicator: Bool = true) {
        self.segue = segue
        self.showAccessoryIndicator = showAccessoryIndicator

        self.cell = cell
        self.height = height
        self.select = select
    }
}
