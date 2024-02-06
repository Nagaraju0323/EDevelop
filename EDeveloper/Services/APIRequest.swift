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

    public enum Error:Swift.Error {
        case Connectivity
    }
    
    func loadService(completin:@escaping(Error) -> Void = { _ in  }) {
        apiRequest.load(url:URL(string: "http://google.com")!){ error in
            completin(.Connectivity)
            
        }
    }
}

public protocol httpClient  {
    func load(url:URL,completion:@escaping(Error) -> Void)
}



public final class APIRequest :httpClient {
    public func load(url: URL, completion:@escaping (Error) -> Void) {
        urlRequest = url
    }
    
    var urlRequest:URL?
    
}
