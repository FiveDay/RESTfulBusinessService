import XCTest
@testable import RESTfulBusinessService

final class RESTfulBusinessServiceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(RESTfulBusinessService().text, "Hello, World!")
        
        let serviceMng = RESTfulBusinessService.shared
        serviceMng.setEnv(BusinessServiceEnvironment.dev(root: URL(string: "http://www.baidu.com")!))
        let request = TestBusinessRequest()
        serviceMng.request(request) { (model, error) in
            
        }
    }

    func NetworkReachabilityManagerTest() {
        let mng = NetworkReachabilityManager()
        if mng?.isReachable ?? false {
            print("ok")
        }
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
