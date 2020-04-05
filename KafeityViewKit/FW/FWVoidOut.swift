//
//  FWVoidOut.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation

public class FWVoidOut<Output: Any>: FWBase {
    private let function: () -> Output

    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> (() -> Output), defaultValue: Output? = nil) {
        function = { [weak owner] in
            if let owner = owner {
                return closure(owner)()
            } else if let defaultValue = defaultValue {
                return defaultValue
            }
            return closure(owner!)()
        }
    }

    public func perform() -> Output {
        function()
    }
}
