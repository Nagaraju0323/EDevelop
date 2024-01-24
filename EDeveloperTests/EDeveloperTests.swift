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
        let sut = RequestServices(httpRequet: client)
        sut.load()
        XCTAssertNotNil(client.url)
    }
    

}
