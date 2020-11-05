//
//  DetailPresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import SwiftUI


class DetailPresenter: ObservableObject {
    
    private let detailUseCase: DetailUseCase

    @Published var place: PlaceModel

    init(detailUseCase: DetailUseCase) {
      self.detailUseCase = detailUseCase
        place = detailUseCase.getPlace()
    }
}
