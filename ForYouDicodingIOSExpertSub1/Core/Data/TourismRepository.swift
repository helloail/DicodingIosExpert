//
//  ToursmRepository.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import Foundation
import RxSwift
import Combine

protocol TourismRepositoryProtocol {
    
    func getPlaces() -> AnyPublisher<[PlaceModel], Error>
    
    
    func getFavoritePlaces() -> AnyPublisher<[PlaceModel], Error>
    
    func updateFavoritePlace(by idPlace: Int) -> AnyPublisher<PlaceModel, Error>
    
}

final class TourismRepository: NSObject {
    
    typealias TourismInstance = (TourismLocaleDataSource, TourismRemoteDataSource) -> TourismRepository
    
    fileprivate let remote: TourismRemoteDataSource
    fileprivate let locale: TourismLocaleDataSource
    
    private init(locale: TourismLocaleDataSource, remote: TourismRemoteDataSource) {
        self.locale = locale
        self.remote = remote
    }
    
    static let sharedInstance: TourismInstance = { localeRepo, remoteRepo in
        return TourismRepository(locale: localeRepo, remote: remoteRepo)
    }
    
}

extension TourismRepository: TourismRepositoryProtocol {
    func getPlaces() -> AnyPublisher<[PlaceModel], Error> {
        return self.locale.getPlaces()
            .flatMap { result -> AnyPublisher<[PlaceModel], Error> in
                if result.isEmpty {
                    return self.remote.getPlaces()
                        .map { PlaceMapper.mapPlaceResponsesToEntities(input: $0) }
                        .flatMap { self.locale.addPlaces(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getPlaces()
                            .map { PlaceMapper.mapPlaceEntitiesToDomains(input: $0) }
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.locale.getPlaces()
                        .map { PlaceMapper.mapPlaceEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    
    func getFavoritePlaces() -> AnyPublisher<[PlaceModel], Error> {
        return self.locale.getFavoritePlaces()
        .map { PlaceMapper.mapMealEntitiesToDomains(input: $0) }
        .eraseToAnyPublisher()
    }
    
    func updateFavoritePlace( by idPlace: Int ) -> AnyPublisher<PlaceModel, Error> {
        return self.locale.updateFavoritePlace(by: idPlace)
            .map { PlaceMapper.mapDetailMealEntityToDomain(input: $0) }
            .eraseToAnyPublisher()
    }
    
}
