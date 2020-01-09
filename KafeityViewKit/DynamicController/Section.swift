//
//  Section.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit


public class Section<Element> {
    
    public typealias HeaderFooterType = FWTwoOut<UITableView, Int, UIView?>
    
    public let title: String?
    public var footerTitle: String?
    
    public let header: HeaderFooterType?
    public var headerHeight: CGFloat?
    
    public var footer: HeaderFooterType?
    public var footerHeight: CGFloat?
    
    public var data: [Element]
    
    public init(title: String?, data: [Element]) {
        self.title = title
        self.data = data
        header = nil
    }
    
    public init(header: HeaderFooterType?, data: [Element]) {
        self.title = nil
        self.data = data
        self.header = header
    }
    
    public init(footer: HeaderFooterType?, data: [Element]) {
        self.title = nil
        self.data = data
        self.footer = footer
        header = nil
    }
    
    public init?(header: HeaderFooterType?, ifData: [Element]) {
        if ifData.count == 0 {
            return nil
        }
        
        self.title = nil
        self.data = ifData
        self.header = header
    }
    
    public init?(title: String?, element: Element, count: Int) {
        if count == 0 {
            return nil
        }
        
        self.title = title
        
        var data = [Element]()
        for _ in 0..<count {
            data.append(element)
        }
        self.data = data
        header = nil
    }
    
    public init?(header: HeaderFooterType?, element: Element, count: Int) {
        if count == 0 {
            return nil
        }
        
        self.title = nil
        
        var data = [Element]()
        for _ in 0..<count {
            data.append(element)
        }
        self.data = data
        self.header = header
    }
    
    public class func dataObject(sections: [Section], indexPath: IndexPath) -> Element? {
        if sections.count > indexPath.section {
            let section = sections[indexPath.section]
            if section.data.count > indexPath.row {
                return section.data[indexPath.row]
            }
        }
        return nil
    }
    
}

public extension Section where Element: CellData {
    
    func setAutoHeight(autoHeight: Bool) {
        for cellData in data {
            cellData.autoHeight = autoHeight
        }
    }
    
}
