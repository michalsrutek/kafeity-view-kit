//
//  FWVoid.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation


public class FWVoid: FWBase {
    
    private let function: () -> Void
    
    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> (() -> Void)) {
        function = { [weak owner] in
            if let owner = owner {
                closure(owner)()
            }
        }
    }
    
    public func perform() {
        function()
    }
    
}
