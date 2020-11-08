//
//  DetailFavouritesPresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import Foundation

class DetailFavouritesPresenter: ObservableObject {
  
    private let detailUseCase: DetailFavouritesUseCase

    @Published var place: PlaceModel

    init(detailUseCase: DetailFavouritesUseCase) {
      self.detailUseCase = detailUseCase
        place = detailUseCase.getFavourites()
    }
    
}
