//
//  FWTwo.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation

public class FWTwo<FirstInput: Any, SecondInput: Any>: FWBase {
    private var function: (FirstInput, SecondInput) -> Void

    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> ((FirstInput, SecondInput) -> Void)) {
        function = { [weak owner] firstInput, secondInput in
            if let owner = owner {
                closure(owner)(firstInput, secondInput)
            }
        }
    }

    public func perform(_ firstInput: FirstInput, _ secondInput: SecondInput) {
        function(firstInput, secondInput)
    }
}
