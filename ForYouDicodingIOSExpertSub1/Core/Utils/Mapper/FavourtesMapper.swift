//
//  FavourtesMapper.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import Foundation

final class FavouriteMapper {
    
    static func mapPlaceEntitiesToDomains ( input favouritesEntities: [FavoritePlacesEntity] ) -> [PlaceModel] {
        
        return favouritesEntities.map { result in
            
            return PlaceModel(
                id: result.id,
                name: result.name,
                placeDescription: result.desc,
                address: result.address,
                longitude: result.longitude,
                latitude: result.latitude,
                image: result.image
                
            )
        }
    }
}
