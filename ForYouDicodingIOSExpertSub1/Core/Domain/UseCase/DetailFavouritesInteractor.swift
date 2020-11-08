//
//  FavouritesDetailInteractor.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import Foundation

protocol DetailFavouritesUseCase {

  func getFavourites() -> PlaceModel

}

class DetailFavouritesInteractor: DetailFavouritesUseCase {

  private let repository: FavouritesTourismRepositoryProtocol
  private let favourites: PlaceModel

  required init( repository: FavouritesTourismRepositoryProtocol, favourites: PlaceModel) {
    self.repository = repository
    self.favourites = favourites
  }

  func getFavourites() -> PlaceModel {
    return favourites
  }
}
