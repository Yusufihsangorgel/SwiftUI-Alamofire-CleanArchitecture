//
//  INetworkManager.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation
import Alamofire


typealias Success<T : Codable> = (BaseResponse<T>) -> Void
typealias Error = (BaseError) -> Void

protocol INetworkManager {
    var config: NetworkConfig { get set }

    init(config: NetworkConfig)

    func fetch<T>(path: NetworkPath,
                  paramaters: [String: String]?,
                  method: HTTPMethod,
                  onSuccess: @escaping Success<T>,
                  onError: @escaping Error)

}
