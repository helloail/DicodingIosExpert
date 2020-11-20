//
//  FavoritesInteractor.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 11/11/20.
//

import Foundation
import Combine

protocol FavouriteUseCase {

  func getFavoriteMeals() -> AnyPublisher<[PlaceModel], Error>

}

class FavouriteInteractor: FavouriteUseCase {

  private let repository: TourismRepositoryProtocol

  required init(repository: TourismRepositoryProtocol) {
    self.repository = repository
  }

  func getFavoriteMeals() -> AnyPublisher<[PlaceModel], Error> {
    return repository.getFavoritePlaces()
  }

}
