//
//  HomeInteractor.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import Foundation
import RxSwift

protocol HomeUseCase {

    func getPlaces() -> Observable<[PlaceModel]>
}

class HomeInteractor: NSObject {
    
    private let repository: TourismRepositoryProtocol
    
    required init(repository: TourismRepositoryProtocol) {
        self.repository = repository
    }
    
}

extension HomeInteractor: HomeUseCase {
    
    func getPlaces() -> Observable<[PlaceModel]> {
        return repository.getPlaces()
    }
    
}
