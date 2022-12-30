//
//  NetworkMethod.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation
import Alamofire

enum NetworkMethod {
    case GET
    case POST
    case PUT
    case DELETE
    
    func method() throws -> HTTPMethod {
        switch self {
        case .GET:
            return HTTPMethod.get
        case .POST:
            return HTTPMethod.post
        case .PUT:
            return HTTPMethod.put
        case .DELETE:
            return HTTPMethod.delete
        }
    }
}
