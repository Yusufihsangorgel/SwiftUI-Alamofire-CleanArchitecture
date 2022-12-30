//
//  Dog.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation

struct Dog: Identifiable, Codable {
    var id = UUID()
    
    let code: Int
    let dogMockDescription: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case dogMockDescription = "description"
        case imageUrl = "imageUrl"
    }
}
