//
//  DogService.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation

class DogService {
    let service: INetworkManager

    init(service: NetworkService) {
        self.service = service.manager
    }
    func getAllDogs(onSucess: @escaping ([Dog]) -> Void, onError: @escaping(BaseError) -> Void) {

        service.fetch(path: .dogs, paramaters: nil, method: .get, onSuccess: { (response: BaseResponse<[Dog]>) in
            guard let dogs = response.model else {
                onError(BaseError(message: "Not Found"))
                return
            }
            onSucess(dogs)
        }) { (error) in
            onError(error)
        }
    }

    func getLimitDogs(dog: Dog, onSucess: @escaping ([Dog]) -> Void, onError: @escaping(BaseError) -> Void) {
        service.fetch(path: .dogs, paramaters: [
            NetworkQuery.orderBy.rawValue: NetworkQuery.orderBy.value(),
            NetworkQuery.limitToFirst.rawValue: NetworkQuery.limitToFirst.value(),
            NetworkQuery.startAt.rawValue: "\(dog.code)"
        ], method: .get, onSuccess: { (response: BaseResponse<[Dog]>) in
            guard let dogs = response.model else {
                onError(BaseError(message: "Not Found"))
                return
            }
            onSucess(dogs)
        }) { (error) in
            onError(error)
        }
    }
}
