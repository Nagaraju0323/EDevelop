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
        
        XCTAssertTrue(client.requestURL.isEmpty)
    }
    
    func test_apiRequestedLoadService_loadValid() {
        
        let (sut,client) = MakeSUT()
        sut.loadService()
        XCTAssertNotNil(client.requestURL.isEmpty)
    }
    
    func test_apiRequestLoadService_ApiIsValid() {
        let (sut,client) = MakeSUT()
        sut.loadService()
        let url = URL(string: "http://google.com")
        XCTAssertEqual(client.requestURL, [url],"Both is not same")
    }
    
    func test_apiRequestLoad_apiLoadservcie_MultipleTimes() {
        let (sut,client) = MakeSUT()
        sut.loadService()
        sut.loadService()
        let url = URL(string: "http://google.com")
        XCTAssertEqual(client.requestURL, [url,url],"Both is not same")
    }
    
    func test_load_deliversErrorOnClientError() {
        let (sut,client) = MakeSUT()
        var capturedError = [RequestService.Error]()
        sut.loadService { capturedError.append($0)}
        let clientError = NSError(domain: "Text", code: 0)
        client.completions[0](clientError)
        XCTAssertEqual(capturedError, [.Connectivity])
    }
    
    //MARK: - helper Function
    
    private func MakeSUT(url:URL = URL(string: "http://google.com")!) -> (sut:RequestService,client:APIRequestSPY) {
        let client = APIRequestSPY()
        let sut = RequestService(apiRequest: client)
        return(sut,client)
    }
    
    
    private class APIRequestSPY: httpClient {
        
        var requestURL = [URL]()
        var error : Error?
        var completions = [(Error) -> Void]()
        func load(url: URL,completion:@escaping(Error) -> Void) {
            completions.append(completion)
            requestURL.append(url)
        }
    }
}
