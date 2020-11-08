//
//  DetailPresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import SwiftUI

class DetailHomePresenter: ObservableObject {
  
    private let detailUseCase: DetailHomeUseCase

    @Published var place: PlaceModel

    init(detailUseCase: DetailHomeUseCase) {
      self.detailUseCase = detailUseCase
        place = detailUseCase.getPlace()
    }
    
    func addFavourites() {
        print(place)
    }
    
}
