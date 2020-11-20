//
//  PlaceLocaleDataSource.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import Foundation
import RealmSwift
import Combine

protocol TourismLocaleDataSourceProtocol: class {
    
    func getPlaces() -> AnyPublisher<[PlaceEntity], Error>
    func addPlaces(from places: [PlaceEntity]) -> AnyPublisher<Bool, Error>

    func getFavoritePlaces() -> AnyPublisher<[PlaceEntity], Error>
    func updateFavoritePlace(by idPlace: Int) -> AnyPublisher<PlaceEntity, Error>
}

final class TourismLocaleDataSource: NSObject {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> TourismLocaleDataSource = { realmDatabase in
        return TourismLocaleDataSource(realm: realmDatabase)
    }
    
}

extension TourismLocaleDataSource: TourismLocaleDataSourceProtocol {
    
    func getFavoritePlaces() -> AnyPublisher<[PlaceEntity], Error> {
        return Future<[PlaceEntity], Error> { completion in
            
            guard let realmstorage = self.realm else {
                return  completion(.failure(DatabaseError.invalidInstance))
            }
            
            let placeEntities = {
                realmstorage.objects(PlaceEntity.self)
                    .filter("favorite = \(true)")
                    .sorted(byKeyPath: "name", ascending: true)
            }()
            completion(.success(placeEntities.toArray(ofType: PlaceEntity.self)))
        }.eraseToAnyPublisher()
        
    }
    
    func updateFavoritePlace(by idPlace: Int) -> AnyPublisher<PlaceEntity, Error> {
        return Future<PlaceEntity, Error> { completion in
            if let realm = self.realm, let placeEntity = {
                realm.objects(PlaceEntity.self).filter("id = \(idPlace)")
            }().first {
                do {
                    try realm.write {
                        placeEntity.setValue(!placeEntity.favorite, forKey: "favorite")
                        
                    }
                    completion(.success(placeEntity))
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getPlaces() -> AnyPublisher<[PlaceEntity], Error> {
        return Future<[PlaceEntity], Error> { completion in
            
            guard let realmstorage = self.realm else {
                return  completion(.failure(DatabaseError.invalidInstance))
            }
            
            let categories: Results<PlaceEntity> = {
                realmstorage.objects(PlaceEntity.self)
                    .sorted(byKeyPath: "name", ascending: true)
            }()
            completion(.success(categories.toArray(ofType: PlaceEntity.self)))
            
        }.eraseToAnyPublisher()
    }
    
    func addPlaces(from places: [PlaceEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            
            guard let realmstorage = self.realm else {
                return  completion(.failure(DatabaseError.invalidInstance))
                
            }
            do {
                try realmstorage.write {
                    for place in places {
                        realmstorage.add(place, update: .all)
                    }
                    completion(.success(true))
                }
            } catch {
                completion(.failure(DatabaseError.requestFailed))
            }
            
        }.eraseToAnyPublisher()
    }
    
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
