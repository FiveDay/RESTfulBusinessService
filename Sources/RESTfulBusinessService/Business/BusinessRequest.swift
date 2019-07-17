//
//  BusinessRequest.swift
//  
//
//  Created by zhangyu528 on 2019/7/12.
//

import Foundation

public enum RequestMethod {
    case get
    case post
    case postWithBody
    case postWithProgress
}

public protocol BusinessRequest {
    
    var argment: Dictionary<String, Any>? {get set}
        
    func requestPath() -> String
    
    func timeout() -> TimeInterval
    func requestMethod() -> RequestMethod
}

extension BusinessRequest {
    
    mutating func setArgment(param: Dictionary<String, Any>?) {
        self.argment = param
    }
    
    func requestMethod() -> RequestMethod {
        return RequestMethod.post
    }
    
    func timeout() -> TimeInterval {
        return Double(exactly: 30)!
    }
}
