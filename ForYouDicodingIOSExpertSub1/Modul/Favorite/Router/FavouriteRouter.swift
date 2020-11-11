//
//  FavouriteRouter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 11/11/20.
//

import SwiftUI

class FavouriteRouter {

  func makeDetailView(for place: PlaceModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(place: place)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    return DetailView(presenter: presenter)
  }
  
}
