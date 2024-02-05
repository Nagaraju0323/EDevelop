//
//  EDeveloperTests.swift
//  EDeveloperTests
//
//  Created by Nagaraju on 24/01/24.
//

import XCTest
@testable import EDeveloper
final class EDeveloperTests: XCTestCase {

    func test_APIRequestLoad_isNotValid() {
        
        let (_,client) = MakeSUT()
        
        XCTAssertNil(client.urlRequest)
    }
    
    func test_apiRequestedLoadService_loadValid() {
        
        let (sut,client) = MakeSUT()
        sut.loadService()
        XCTAssertNotNil(client.urlRequest)
    }
    
    func test_apiRequestLoadService_ApiIsValid() {
        let (sut,client) = MakeSUT()
        sut.loadService()
        let url = URL(string: "http://google.com")
        XCTAssertEqual(client.urlRequest, url,"Both is not same")
    }
    
    func test_apiRequestLoad_apiLoadservcie_MultipleTimes() {
        
        
        
    }
    
    //MARK: - helper Function
    
    private func MakeSUT(url:URL = URL(string: "http://google.com")!) -> (sut:RequestService,client:APIRequest) {
        let client = APIRequest()
        let sut = RequestService(apiRequest: client)
        return(sut,client)
    }
    

}
