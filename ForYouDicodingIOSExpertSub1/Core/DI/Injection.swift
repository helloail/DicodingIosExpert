//
//  Injection.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private func provideTourismRepository() -> TourismRepositoryProtocol {
        let realm = try? Realm()
        
        let locale: TourismLocaleDataSource = TourismLocaleDataSource.sharedInstance(realm)
        let remote: TourismRemoteDataSource = TourismRemoteDataSource.sharedInstance
        
        return TourismRepository.sharedInstance(locale, remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideTourismRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideDetail(place: PlaceModel) -> DetailUseCase {
      let repository = provideTourismRepository()
      return DetailInteractor(repository: repository, place: place)
    }

    func provideFavourite() -> FavouriteUseCase {
      let repository = provideTourismRepository()
      return FavouriteInteractor(repository: repository)
    }
}
