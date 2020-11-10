//
//  HomeInteractor.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import Foundation
import Combine

protocol HomeUseCase {

//    func getPlaces() -> Observable<[PlaceModel]>
    
    func getPlaces() -> AnyPublisher<[PlaceModel], Error>
}

class HomeInteractor: NSObject {
    
    private let repository: TourismRepositoryProtocol
    
    required init(repository: TourismRepositoryProtocol) {
        self.repository = repository
    }
    
}

extension HomeInteractor: HomeUseCase {
    func getPlaces() -> AnyPublisher<[PlaceModel], Error> {
        return repository.getPlaces()
    }
    
    
//    func getPlaces() -> Observable<[PlaceModel]> {
//        return repository.getPlaces()
//    }
    
}
