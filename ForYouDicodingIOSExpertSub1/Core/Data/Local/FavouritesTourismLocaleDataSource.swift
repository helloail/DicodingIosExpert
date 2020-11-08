//
//  FavouritesTourismLocaleDataSource.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import Foundation
import RealmSwift
import RxSwift

protocol FavouritesTourismLocaleDataSourceProtocol: class {
    func getFavourites() -> Observable<[FavoritePlacesEntity]>
//    func addPlaces(from categories: [FavoritePlacesEntity]) -> Observable<Bool>
}

final class FavouritesTourismLocaleDataSource: NSObject {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> FavouritesTourismLocaleDataSource = { realmDatabase in
        return FavouritesTourismLocaleDataSource(realm: realmDatabase)
    }
    
}

extension FavouritesTourismLocaleDataSource: FavouritesTourismLocaleDataSourceProtocol {
//    func addPlaces(from categories: [FavoritePlacesEntity]) -> Observable<Bool> {
//
//    }
    
    func getFavourites() -> Observable<[FavoritePlacesEntity]> {
        return Observable<[FavoritePlacesEntity]>.create { observer in
            
            guard let realmstorage = self.realm else {
                return observer.onError(DatabaseError.invalidInstance) as! Disposable }
            
            let places: Results<FavoritePlacesEntity> = {
                realmstorage.objects(FavoritePlacesEntity.self)
                    .sorted(byKeyPath: "name", ascending: true)
            }()
            
            observer.onNext(places.toArray(ofType: FavoritePlacesEntity.self))
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
}
