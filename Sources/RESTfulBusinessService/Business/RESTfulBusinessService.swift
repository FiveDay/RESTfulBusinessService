import Foundation

public typealias BusinessResponse = (_ model: Any?, _ error: Error?) -> Void

public final class RESTfulBusinessService {
    
    public static let shared = RESTfulBusinessService()
    
    private init() {}
    
    var isLogEnable = false
    var env: BusinessServiceEnvironment?
    let agent = NetworkAgent()
    let reachabilityMng = NetworkReachabilityManager()

    //开启Log信息, 默认为不开启
    public func setLogEnable() {
        isLogEnable = true
    }
    
    //设置服务器环境
    public func setEnv(_ env: BusinessServiceEnvironment) {
        self.env = env
    }
    
    //向服务发请求, 并返回结果
    public func request(_ request: BusinessRequest, response: BusinessResponse?) {
        guard let env = env else {
            print(BusinessError.EnviormentError.notSetEnv)
            return
        }
        
        //判断当前网络状态
        if reachabilityMng?.isReachable ?? false {
            guard let resp = response else {
                return
            }
            let error = BusinessError.networkIsNotReachable
            resp(nil, error)
        }
        
        //向agent发请求
        let timeoutInterval = request.timeout()
        guard let url = URL(string: request.requestPath(), relativeTo: env.root) else {
            guard let resp = response else {
                return
            }
            let error = BusinessError.EnviormentError.urlIsWrong
            resp(nil, error)
            return
        }
        let urlRequest = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: timeoutInterval)
        agent.startRequest(urlRequest, response: { (data, resp, error) in
            
        })
    }
}
