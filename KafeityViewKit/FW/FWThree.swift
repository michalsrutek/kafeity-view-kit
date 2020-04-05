//
//  FWThree.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation

public class FWThree<FirstInput: Any, SecondInput: Any, ThirdInput: Any>: FWBase {
    private var function: (FirstInput, SecondInput, ThirdInput) -> Void

    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> ((FirstInput, SecondInput, ThirdInput) -> Void)) {
        function = { [weak owner] firstInput, secondInput, thirdInput in
            if let owner = owner {
                closure(owner)(firstInput, secondInput, thirdInput)
            }
        }
    }

    public func perform(_ firstInput: FirstInput, _ secondInput: SecondInput, _ thirdInput: ThirdInput) {
        function(firstInput, secondInput, thirdInput)
    }
}
