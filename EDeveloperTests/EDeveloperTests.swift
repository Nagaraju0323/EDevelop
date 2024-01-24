//
//  EDeveloperTests.swift
//  EDeveloperTests
//
//  Created by Nagaraju on 24/01/24.
//

import XCTest
@testable import EDeveloper
final class EDeveloperTests: XCTestCase {

    func test_ApiRequestload_Empty() throws {
        let client  = HttpRequest()
        XCTAssertNil(client.url)
    }
    
    func test_URLRequestload() throws {
        let client  = HttpRequest()
        let sut = RemoteFeedLoader(httpRequet: client)
        sut.load()
        XCTAssertNotNil(client.url)
    }
    
    func test_URLRequestloadedValudURL() throws {
        let client  = HttpRequest()
        let sut = RemoteFeedLoader(httpRequet: client)
        sut.load()
        XCTAssertEqual(client.url,URL(string: "http://google.com"))
    }

}
