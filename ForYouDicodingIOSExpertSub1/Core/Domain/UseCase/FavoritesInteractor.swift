//
//  File.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import Foundation
import RxSwift

protocol FavouritesUseCase {

    func getFavourites() -> Observable<[PlaceModel]>
}

class FavouritesInteractor: NSObject {
    
    private let repository: FavouritesTourismRepositoryProtocol
    
    required init(repository: FavouritesTourismRepositoryProtocol) {
        self.repository = repository
    }
    
}

extension FavouritesInteractor: FavouritesUseCase {
    func getFavourites() -> Observable<[PlaceModel]> {
        return repository.getFavourites()
    }
    
}
