//
//  BaseError.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation
import Alamofire


struct BaseError {
    var errorMessage: String?
    var statusCode: Int?
    var debugMessage: String?
    
    init(message: String){
        self.errorMessage = message
    }
    
    init(afError: AFError?){
        guard let error = afError else {
            self.statusCode = 500
            self.errorMessage = ErrorMessage.someThingWentWrong.rawValue
            return
        }
        self.errorMessage = error.errorDescription
        self.statusCode = error.responseCode
        self.debugMessage = error.localizedDescription
    }
    
}
