//
//  FWFourOut.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation

public class FWFourOut<FirstInput: Any, SecondInput: Any, ThirdInput: Any, FourthInput: Any, Output: Any>: FWBase {
    private var function: (FirstInput, SecondInput, ThirdInput, FourthInput) -> Output

    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> ((FirstInput, SecondInput, ThirdInput, FourthInput) -> Output), defaultValue: Output? = nil) {
        function = { [weak owner] firstInput, secondInput, thirdInput, fourthInput in
            if let owner = owner {
                return closure(owner)(firstInput, secondInput, thirdInput, fourthInput)
            } else if let defaultValue = defaultValue {
                return defaultValue
            }
            return closure(owner!)(firstInput, secondInput, thirdInput, fourthInput)
        }
    }

    public func perform(_ firstInput: FirstInput, _ secondInput: SecondInput, _ thirdInput: ThirdInput, _ fourthInput: FourthInput) -> Output {
        function(firstInput, secondInput, thirdInput, fourthInput)
    }
}
