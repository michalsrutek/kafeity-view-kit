//
//  FWThreeOut.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation


public class FWThreeOut<FirstInput: Any, SecondInput: Any, ThirdInput: Any, Output: Any>: FWBase {
    
    private var function: (FirstInput, SecondInput, ThirdInput) -> Output
    
    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> ((FirstInput, SecondInput, ThirdInput) -> Output), defaultValue: Output? = nil) {
        function = { [weak owner] firstInput, secondInput, thirdInput in
            if let owner = owner {
                return closure(owner)(firstInput, secondInput, thirdInput)
            }
            else if let defaultValue = defaultValue {
                return defaultValue
            }
            return closure(owner!)(firstInput, secondInput, thirdInput)
        }
    }
    
    public func perform(_ firstInput: FirstInput, _ secondInput: SecondInput, _ thirdInput: ThirdInput) -> Output {
        return function(firstInput, secondInput, thirdInput)
    }
    
}
