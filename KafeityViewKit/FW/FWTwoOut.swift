//
//  FWTwoOut.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation

public class FWTwoOut<FirstInput: Any, SecondInput: Any, Output: Any>: FWBase {
    private var function: (FirstInput, SecondInput) -> Output

    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> ((FirstInput, SecondInput) -> Output), defaultValue: Output? = nil) {
        function = { [weak owner] firstInput, secondInput in
            if let owner = owner {
                return closure(owner)(firstInput, secondInput)
            } else if let defaultValue = defaultValue {
                return defaultValue
            }
            return closure(owner!)(firstInput, secondInput)
        }
    }

    public func perform(_ firstInput: FirstInput, _ secondInput: SecondInput) -> Output {
        function(firstInput, secondInput)
    }
}
