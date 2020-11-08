//
//  FavouritesRouter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import Foundation
import SwiftUI
class FavouritesRouter {

  func makeDetailView(for favourites: PlaceModel) -> some View {
    let detailUseCase = Injection.init().provideDetailFavourites(favourites: favourites)
    let presenter = DetailFavouritesPresenter(detailUseCase: detailUseCase)
    return DetailFavouritesView(presenter: presenter)
  }

}
