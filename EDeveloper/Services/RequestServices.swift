//
//  RequestServices.swift
//  EDeveloper
//
//  Created by Nagaraju on 24/01/24.
//

import Foundation

//enum ErrorHandling : Error {
//    case BadURL
//    case NodDataFound
//    case ModelDataError
//    case statusError
//}
//
//extension ErrorHandling : CustomStringConvertible {
//    var description: String {
//        switch self {
//        case .BadURL:
//            return "Server Error with Bad URL"
//        case .NodDataFound:
//            return "400 Error No DataFound"
//        case .ModelDataError:
//            return "502 Error With Model Data"
//        case .statusError:
//            return "Bad Status Code"
//        }
//    }
//}
//
//
//class RemoteViewModel:ObservableObject {
//    let httpRequet : HttpRequest
//    @Published var commentsData = [Comments]()
//    init(httpRequet: HttpRequest = HttpRequest()) {
//        self.httpRequet = httpRequet
//    }
//    func load() async{
//        do {
//            let ReponseData = try await httpRequet.ARIrequest(requesturl: URL(string: "https://jsonplaceholder.typicode.com/comments")!)
//            
//            DispatchQueue.main.async {
//                self.commentsData = ReponseData
//            }
//        }catch {
//            
//        }
//    }
//}
//
////Solid Principle
//class HttpRequest {
//    var url : URL?
//    func ARIrequest(requesturl:URL?) async throws -> [Comments] {
//        guard let url = requesturl else { throw ErrorHandling.BadURL }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard let httpstatus = response as? HTTPURLResponse,httpstatus.statusCode == 200  else {
//            throw ErrorHandling.statusError
//        }
//        
//        do {
//            let jsonData = try JSONDecoder().decode([Comments].self, from: data)
//            return jsonData
//        }catch {
//            throw ErrorHandling.ModelDataError
//        }
//        
//    }
//}
//
//
//
//
//
