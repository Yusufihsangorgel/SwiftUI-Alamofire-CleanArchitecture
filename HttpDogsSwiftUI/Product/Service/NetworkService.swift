//
//  NetworkService.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation

class NetworkService {
    private static var _instance: NetworkService?
    
    public static var instance: NetworkService{
        get{
            if let instance = _instance {
                return instance
            }
            else {
                let _instance = NetworkService()
                self._instance = _instance
                return _instance
            }
        }
    }
    
    private init() { }

    private let baseUrl = "https://hwasampleapi.firebaseio.com/"

    lazy var manager: INetworkManager = {
        return NetworkManager(config: NetworkConfig(baseUrl: self.baseUrl))
    }()
}
