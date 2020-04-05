//
//  FWFour.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation

public class FWFour<FirstInput: Any, SecondInput: Any, ThirdInput: Any, FourthInput: Any>: FWBase {
    private var function: (FirstInput, SecondInput, ThirdInput, FourthInput) -> Void

    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> ((FirstInput, SecondInput, ThirdInput, FourthInput) -> Void)) {
        function = { [weak owner] firstInput, secondInput, thirdInput, fourthInput in
            if let owner = owner {
                closure(owner)(firstInput, secondInput, thirdInput, fourthInput)
            }
        }
    }

    public func perform(_ firstInput: FirstInput, _ secondInput: SecondInput, _ thirdInput: ThirdInput, _ fourthInput: FourthInput) {
        function(firstInput, secondInput, thirdInput, fourthInput)
    }
}
