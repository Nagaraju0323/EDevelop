//
//  RequestServices.swift
//  EDeveloper
//
//  Created by Nagaraju on 24/01/24.
//

import Foundation

class RequestServices {
    let httpRequet : HttpRequest
    init(httpRequet: HttpRequest) {
        self.httpRequet = httpRequet
    }
    
    func load() {
        httpRequet.apirequest(requesturl: URL(string: "http://google.com")!)
    }
}


class HttpRequest {
    var url : URL?
    func apirequest(requesturl:URL) {
        url = requesturl
    }
}



