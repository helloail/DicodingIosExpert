//
//  ToursmRepository.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import Foundation
import RxSwift

protocol TourismRepositoryProtocol {
    
    func getPlaces() -> Observable<[PlaceModel]>

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
    func getPlaces() -> Observable<[PlaceModel]> {
        return self.locale.getPlaces()
            .map { PlaceMapper.mapPlaceEntitiesToDomains(input: $0) }
            .filter{ !$0.isEmpty }
            .ifEmpty(switchTo: self.remote.getPlaces()
                        .map{ PlaceMapper.mapPlaceResponsesToEntities(input: $0 ) }
                        .flatMap { self.locale.addPlaces(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getPlaces()
                            .map{ PlaceMapper.mapPlaceEntitiesToDomains(input: $0) }
                            
                        } )
    }
}
