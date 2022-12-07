//
//  Publisher+withUnretained.swift
//  Core
//
//  Created by Junho Lee on 2022/12/07.
//  Copyright © 2022 SOPT-Stamp-iOS. All rights reserved.
//

import Foundation
import Combine

public extension Publisher {
    func withUnretained<T: AnyObject>(_ object: T) -> Publishers.CompactMap<Self, (T, Self.Output)> {
        compactMap { [weak object] output in
            guard let object = object else {
                return nil
            }
            return (object, output)
        }
    }
}
