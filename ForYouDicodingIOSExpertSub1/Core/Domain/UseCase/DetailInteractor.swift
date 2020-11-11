//
//  DetailInteractor.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import Foundation
import Combine

protocol DetailUseCase {
    
    func getPlace() -> PlaceModel
    
    func updateFavoriteMeal() -> AnyPublisher<PlaceModel, Error>
    
}

class DetailInteractor: DetailUseCase {
    
    private let repository: TourismRepositoryProtocol
    private let place: PlaceModel
    
    required init( repository: TourismRepositoryProtocol, place: PlaceModel) {
        self.repository = repository
        self.place = place
    }
    
    func getPlace() -> PlaceModel {
        return place
    }
    func updateFavoriteMeal() -> AnyPublisher<PlaceModel, Error> {
        return repository.updateFavoritePlace(by: place.id )
    }
}
