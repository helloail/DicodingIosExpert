//
//  TourismResponse.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 02/11/20.
//

import Foundation

// MARK: - TourismResponse
struct TourismResponse: Codable {
    let error: Bool?
    let message: String?
    let count: Int?
    let places: [PlaceResponse]

    enum CodingKeys: String, CodingKey {
        case error 
        case message
        case count
        case places
    }
}

// MARK: - Place
struct PlaceResponse: Codable {
    let id: Int?
    let name: String?
    let placeDescription: String?
    let address: String?
    let longitude: Double?
    let latitude: Double?
    let like: Int?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case placeDescription = "description"
        case address = "address"
        case longitude = "longitude"
        case latitude = "latitude"
        case like = "like"
        case image = "image"
    }
}
