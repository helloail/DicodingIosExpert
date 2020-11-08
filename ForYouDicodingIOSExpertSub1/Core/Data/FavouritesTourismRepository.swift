//
//  FavouritesTourismRepository.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import Foundation
import RxSwift

protocol FavouritesTourismRepositoryProtocol {
    
    func getFavourites() -> Observable<[PlaceModel]>

}
final class FavouritesTourismRepository: NSObject {

  typealias FavouritesTourismInstance = (FavouritesTourismLocaleDataSource) -> FavouritesTourismRepository

  fileprivate let locale: FavouritesTourismLocaleDataSource

  private init(locale: FavouritesTourismLocaleDataSource) {
    self.locale = locale
  }

  static let sharedInstance: FavouritesTourismInstance = { localeRepo in
    return FavouritesTourismRepository(locale: localeRepo)
  }

}

extension FavouritesTourismRepository: FavouritesTourismRepositoryProtocol {
    func getFavourites() -> Observable<[PlaceModel]> {
        return self.locale.getFavourites()
            .map { FavouriteMapper.mapPlaceEntitiesToDomains(input: $0) }
    }
    
}
