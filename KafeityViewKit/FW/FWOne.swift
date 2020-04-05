//
//  FWOne.swift
//  KafeityViewKit
//
//  Created by SKOUMAL Studio on 09/01/2020.
//  Copyright © 2020 SKOUMAL, s.r.o. All rights reserved.
//

import Foundation

public class FWOne<Input: Any>: FWBase {
    private var function: (Input) -> Void

    public init<Owner: AnyObject>(_ owner: Owner, _ closure: @escaping (Owner) -> ((Input) -> Void)) {
        function = { [weak owner] input in
            if let owner = owner {
                closure(owner)(input)
            }
        }
    }

    public func perform(_ input: Input) {
        function(input)
    }
}
