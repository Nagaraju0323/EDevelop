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
        let (sut,client) = MakeSUT()
        sut.loadService()
        let url = URL(string: "http://google.com")
        XCTAssertEqual(client.requestURL, [url,url],"Both is not same")
        
        
    }
    
    //MARK: - helper Function
    
    private func MakeSUT(url:URL = URL(string: "http://google.com")!) -> (sut:RequestService,client:APIRequestSPY) {
        let client = APIRequestSPY()
        let sut = RequestService(apiRequest: client)
        return(sut,client)
    }
    
    
    private class APIRequestSPY: httpClient {
       
        var urlRequest:URL?
        var requestURL = [URL]()
        
        func load(url: URL) {
            urlRequest = url
            requestURL.append(url)
        }
        
        
    }
    

}
