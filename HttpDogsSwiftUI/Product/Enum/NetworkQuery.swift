//
//  NetworkQuery.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation

enum NetworkQuery: String {
    case orderBy = "orderBy"
    case limitToFirst = "limitToFirst"
    case startAt = "startAt"
    
    func value() -> String {
        switch self {
        case .limitToFirst:
            return "10"
        case .orderBy:
            return "\"code\""
        case .startAt:
            return ""
        }
    }
}
