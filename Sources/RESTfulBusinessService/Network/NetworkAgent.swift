//
//  NetworkAgent.swift
//  
//
//  Created by zhangyu528 on 2019/7/12.
//

import Foundation


class NetworkAgent {
    
    func startRequest(_ request: URLRequest, response: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) -> Void {
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: response)
        dataTask.resume()
    }
}
