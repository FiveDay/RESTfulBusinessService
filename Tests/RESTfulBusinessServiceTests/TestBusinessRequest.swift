//
//  TestBusinessRequest.swift
//  
//
//  Created by zhangyu528 on 2019/7/15.
//

import Foundation
@testable import RESTfulBusinessService

class TestBusinessRequest: BusinessRequest {
    var argment: Dictionary<String, Any>?
    
    func requestPath() -> String {
        return "/user/info"
    }
    

}
