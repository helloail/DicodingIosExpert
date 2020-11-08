//
//  Injection.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    let realm = try? Realm()
    
    private func provideTourismRepository() -> TourismRepositoryProtocol {
    
        let locale: TourismLocaleDataSource = TourismLocaleDataSource.sharedInstance(realm)
        let remote: TourismRemoteDataSource = TourismRemoteDataSource.sharedInstance
        
        return TourismRepository.sharedInstance(locale, remote)
    }
    
    private func provideFavouritesTourismRepository() -> FavouritesTourismRepositoryProtocol {

        let locale: FavouritesTourismLocaleDataSource = FavouritesTourismLocaleDataSource.sharedInstance(realm)
        
        return FavouritesTourismRepository.sharedInstance(locale)
    }
   
}

//Mark : - ViewProvider
extension Injection {
    
    func provideHome() -> HomeUseCase {
        let repository = provideTourismRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideFavourites() -> FavouritesUseCase {
        let repository = provideFavouritesTourismRepository()
        return FavouritesInteractor(repository: repository)
    }
    
    func provideDetailHome(place: PlaceModel) -> DetailHomeUseCase {
        let repository = provideTourismRepository()
        return DetailHomeInteractor(repository: repository, place: place)
    }
    
    func provideDetailFavourites(favourites: PlaceModel) -> DetailFavouritesUseCase {
        let repository = provideFavouritesTourismRepository()
        return DetailFavouritesInteractor(repository: repository, favourites: favourites)
    }
}
