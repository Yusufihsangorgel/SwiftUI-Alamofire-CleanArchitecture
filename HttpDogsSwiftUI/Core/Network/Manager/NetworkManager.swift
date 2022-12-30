//
//  NetworkManager.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation
import Alamofire


final class NetworkManager: INetworkManager {
    var config: NetworkConfig
    
    required init(config: NetworkConfig) {
        self.config = config
    }
    
    func fetch<T>(path: NetworkPath, paramaters: [String : String]?, method: HTTPMethod, onSuccess: @escaping Success<T>, onError: @escaping Error) where T : Decodable, T : Encodable {
        
        AF.request(url(path), method: method , parameters: paramaters)
            .validate().responseDecodable(of: T.self)
            { (response) in
                guard let model = response.value else {
                    onError(BaseError(afError: response.error))
                    return
                }
                onSuccess(BaseResponse.init(model: model, message: ""))
            }
    }
    

    func url(_ path: NetworkPath) -> String
    {
        return config.baseUrl + path.firebasePath()
    }
    
}
