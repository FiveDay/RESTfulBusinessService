//
//  BusinessError.swift
//  
//
//  Created by zhangyu528 on 2019/7/15.
//

import Foundation

public enum BusinessError: Error {
    enum EnviormentError: Error {
        case notSetEnv
        case urlIsWrong
    }

    case networkIsNotReachable
}


extension BusinessError {
    var localizedDescription: String {
        switch self {
        case .networkIsNotReachable:
            return "无法连接到互联网"
        }
    }
}

extension BusinessError.EnviormentError {
    var localizedDescription: String {
        switch self {
        case .notSetEnv:
            return "请设置服务器环境"
        case .urlIsWrong:
            return "url描述不正确"
        }
    }
}
