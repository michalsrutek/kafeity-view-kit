//
//  NavigationBarHelper.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit


public enum NavigationBarHelper {
    
    public static func solid(_ viewController: UIViewController, color: UIColor, titleColor: UIColor? = nil, tintColor: UIColor? = nil, largeTitles: Bool = true) {
        
        let titleAttributes: [NSAttributedString.Key: Any] = titleColor == nil ? [:] : [.foregroundColor: titleColor!]
        let navigationBar = viewController.navigationController?.navigationBar
        
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.backgroundColor = color
            
            if titleColor != nil {
                navigationBarAppearance.titleTextAttributes = titleAttributes
                navigationBarAppearance.largeTitleTextAttributes = titleAttributes
            }
            
            navigationBar?.standardAppearance = navigationBarAppearance
            navigationBar?.compactAppearance = navigationBarAppearance
            navigationBar?.scrollEdgeAppearance = navigationBarAppearance
        } else {
            if titleColor != nil {
                navigationBar?.titleTextAttributes = titleAttributes
                if #available(iOS 11.0, *) {
                    navigationBar?.largeTitleTextAttributes = titleAttributes
                }
            }
            navigationBar?.barTintColor = color
            navigationBar?.backgroundColor = color
            navigationBar?.isTranslucent = true
        }
        
        if #available(iOS 11.0, *) {
            navigationBar?.prefersLargeTitles = true
            viewController.navigationItem.largeTitleDisplayMode = largeTitles ? .always : .never
        }
        
        if let tintColor = tintColor {
            navigationBar?.tintColor = tintColor
        }
    }
    
}
