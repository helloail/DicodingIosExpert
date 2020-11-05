//
//  DetailInteractor.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import Foundation

protocol DetailUseCase {

  func getPlace() -> PlaceModel

}

class DetailInteractor: DetailUseCase {

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
