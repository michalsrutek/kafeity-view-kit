//
//  GradientLayer.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import UIKit


public enum FadeGradientType {
    
    case leftToRight
    case bottomToTop
    case rightToLeft
    case topToBottom
    
}


public class FadeGradientLayer: CAGradientLayer {
    
    public init(type: FadeGradientType, startColor: UIColor = .white, endColor: UIColor = .black) {
        super.init()
        
        switch type {
        case .leftToRight:
            colors = [startColor.cgColor, endColor.withAlphaComponent(0.0).cgColor]
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
        case .bottomToTop:
            colors = [endColor.withAlphaComponent(0.0).cgColor, startColor.cgColor]
        case .rightToLeft:
            colors = [endColor.withAlphaComponent(0.0).cgColor, startColor.cgColor]
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
        case .topToBottom:
            colors = [startColor.cgColor, endColor.withAlphaComponent(0.0).cgColor]
        }
    }
    
    public override init(layer: Any) {
        super.init(layer: layer)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
