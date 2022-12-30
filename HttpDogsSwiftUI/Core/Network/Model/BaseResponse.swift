//
//  BaseResponse.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation

struct BaseResponse <T: Codable> {
    var model: T?
    var message: String?
}
