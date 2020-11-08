//
//  DetailInteractor.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import Foundation

protocol DetailHomeUseCase {

  func getPlace() -> PlaceModel

}

class DetailHomeInteractor: DetailHomeUseCase {

  private let repository: TourismRepositoryProtocol
  private let place: PlaceModel

  required init( repository: TourismRepositoryProtocol, place: PlaceModel) {
    self.repository = repository
    self.place = place
  }

  func getPlace() -> PlaceModel {
    return place
  }
}
