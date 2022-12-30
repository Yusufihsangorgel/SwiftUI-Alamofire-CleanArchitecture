//
//  NetworkPath.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation

enum NetworkPath: String {
    case dogs = "dogs"
    
    func firebasePath()-> String {
        return "\(self.rawValue).json"
    }
}
