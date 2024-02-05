//
//  APIRequest.swift
//  EDeveloper
//
//  Created by Nagaraju on 05/02/24.
//

import Foundation

class RequestService {
    
    let apiRequest : httpClient
    init(apiRequest: httpClient = APIRequest()) {
        self.apiRequest = apiRequest
    }
    
    func loadService() {
        apiRequest.load(url:URL(string: "http://google.com")!)
    }
}

public protocol httpClient  {
    func load(url:URL)
}



public final class APIRequest :httpClient {
    var urlRequest:URL?
    public func load(url:URL) {
        urlRequest = url
    }
}
