//
//  RequestServices.swift
//  EDeveloper
//
//  Created by Nagaraju on 24/01/24.
//

import Foundation

enum ErrorHandling : Error {
    case BadURL
    case NodDataFound
    case ModelDataError
    case statusError
}

extension ErrorHandling : CustomStringConvertible {
    var description: String {
        switch self {
        case .BadURL:
            return "Server Error with Bad URL"
        case .NodDataFound:
            return "400 Error No DataFound"
        case .ModelDataError:
            return "502 Error With Model Data"
        case .statusError:
            return "Bad Status Code"
        }
    }
}


class RemoteViewModel:ObservableObject {
    let apiRequest : ApiRequest
    @Published var commentsData = [ImageModel]()
    init(apiRequest: ApiRequest = HttpRequestImage()) {
        self.apiRequest = apiRequest
    }
    func load() async{
        do {
            let ReponseData = try await apiRequest.ARIrequest(requesturl: URL(string: "https://api.slingacademy.com/v1/sample-data/photos?offset=5&limit=20")!)
            DispatchQueue.main.async {
                print(ReponseData)
                self.commentsData = [ReponseData]
            }
        }catch {
            print("Error fetching data: \(error)")
        }
    }
}

protocol ApiRequest {
    func ARIrequest(requesturl:URL?) async throws -> ImageModel
}

//Solid Principle
class HttpRequestImage : ApiRequest{
    var url : URL?
    func ARIrequest(requesturl:URL?) async throws -> ImageModel {
        guard let url = requesturl else { throw ErrorHandling.BadURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpstatus = response as? HTTPURLResponse,httpstatus.statusCode == 200  else {
            throw ErrorHandling.statusError
        }
        
        do {
            let jsonData = try JSONDecoder().decode(ImageModel.self, from: data)
            return jsonData
        }catch {
            throw ErrorHandling.ModelDataError
        }
        
    }
}





//class requestservice:https://api.slingacademy.com/v1/sample-data/photos?offset=5&limit=20
