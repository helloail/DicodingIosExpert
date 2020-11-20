//
//  TourismModel.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import Foundation

struct PlaceModel: Equatable, Identifiable {
    
    let id: Int
    let name: String?
    let placeDescription: String?
    let address: String?
    let longitude: Double?
    let latitude: Double?
    let image: String?
    var favorite: Bool = false
}
