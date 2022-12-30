//
//  DogsViewModel.swift
//  HttpDogsSwiftUI
//
//  Created by Yusuf İhsan Görgel on 30.12.2022.
//

import Foundation

final class DogsViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var dogList: [Dog] = []

    let dogService: DogService


    init() {
        self.dogService = DogService(service: NetworkService.instance)
        fetchDogList()
    }

    func fetchDogList() {
        changeLoading()
        dogService.getAllDogs(onSucess: { (datas) in
            self.changeLoading()
            self.dogList = datas
        }) { (error) in
            self.changeLoading()
            print("error")
        }
    }
    
    private func changeLoading() {
        self.isLoading = !isLoading
    }

    func fetchDogListLoadMore(dog: Dog) {
        changeLoading()
        dogService.getLimitDogs(dog: dog, onSucess: { (response) in
            self.changeLoading()
            self.dogList.append(contentsOf: response)

        }) { (error) in
            self.changeLoading()

        }
    }

    func loadMoreContent(currentItem item: Dog) {
        if dogList.last?.id == item.id && !isLoading {
            fetchDogListLoadMore(dog: item)
        }
    }




}
