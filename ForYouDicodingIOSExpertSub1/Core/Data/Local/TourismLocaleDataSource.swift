//
//  PlaceLocaleDataSource.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import Foundation
import RealmSwift
import RxSwift

protocol TourismLocaleDataSourceProtocol: class {
    func getPlaces() -> Observable<[PlaceEntity]>
    func addPlaces(from places: [PlaceEntity]) -> Observable<Bool>
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
    func getPlaces() -> Observable<[PlaceEntity]> {
        return Observable<[PlaceEntity]>.create { observer in
            
            guard let realmstorage = self.realm else {
                return observer.onError(DatabaseError.invalidInstance) as! Disposable }
            
            let places: Results<PlaceEntity> = {
                realmstorage.objects(PlaceEntity.self)
                    .sorted(byKeyPath: "name", ascending: true)
            }()
            
            observer.onNext(places.toArray(ofType: PlaceEntity.self))
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    func addPlaces(from places: [PlaceEntity]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            
            guard let realmstorage = self.realm else {
                return observer.onError(DatabaseError.invalidInstance) as! Disposable }

            do {
                try realmstorage.write {
                    for place in places {
                        realmstorage.add(place, update: .all)
                    }
                    observer.onNext(true)
                    observer.onCompleted()
                }
            } catch {
                observer.onError(DatabaseError.requestFailed)
            }
            
            return Disposables.create()
        }
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
