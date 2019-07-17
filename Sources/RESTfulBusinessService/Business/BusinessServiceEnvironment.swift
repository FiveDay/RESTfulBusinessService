//
//  BusinessServiceEnvironment.swift
//  
//
//  Created by zhangyu528 on 2019/7/11.
//

import Foundation

public enum BusinessServiceEnvironment {
    case dev(root: URL)
    case test(root: URL)
    case product(root: URL)
    case mock(root: URL)
}

extension BusinessServiceEnvironment {
    var root: URL {
        switch self {
        case .dev(let root):
            return root
        case .test(let root):
            return root
        case .product(let root):
            return root
        case .mock(let root):
            return root
        }
    }
}
