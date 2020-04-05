//
//  NSAttributedString+Init.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation


public extension NSAttributedString {
    
    static func text(_ text: String, hText: String, attrs: [NSAttributedString.Key : Any], hAttrs: [NSAttributedString.Key : Any]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text, attributes: attrs)
        if let range = attributedString.string.range(of: hText) {
            for attributeTuple in hAttrs {
                attributedString.addAttribute(attributeTuple.key, value: attributeTuple.value, range: NSRange(range, in: text))
            }
        }
        return attributedString
    }
    
    convenience init?(htmlText: String) {
        guard let htmlStringData = htmlText.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: AnyObject] = [.documentType : NSAttributedString.DocumentType.html as AnyObject, .characterEncoding : String.Encoding.utf8.rawValue as AnyObject]
        do {
            try self.init(data: htmlStringData, options: options, documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
}
