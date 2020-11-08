//
//  HomeRouter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import SwiftUI

class HomeRouter {

  func makeDetailHomeView(for place: PlaceModel) -> some View {
    let detailUseCase = Injection.init().provideDetailHome(place: place)
    let presenter = DetailHomePresenter(detailUseCase: detailUseCase)
    return DetailHomeView(presenter: presenter)
  }
  
}
