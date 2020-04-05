//
//  FWOneOut.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation

public class FWOneOut<Input: Any, Output: Any>: FWBase {
    private var function: (Input) -> Output

    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> ((Input) -> Output), defaultValue: Output? = nil) {
        function = { [weak owner] input in
            if let owner = owner {
                return closure(owner)(input)
            } else if let defaultValue = defaultValue {
                return defaultValue
            }
            return closure(owner!)(input)
        }
    }

    public func perform(_ input: Input) -> Output {
        function(input)
    }
}
