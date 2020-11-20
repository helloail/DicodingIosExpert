//
//  PlaceMapper.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 03/11/20.
//

import Foundation

final class PlaceMapper {
    static func mapPlaceResponsesToEntities(input placeResponses: [PlaceResponse] ) -> [PlaceEntity] {
        return placeResponses.map { result in
            let newPlace = PlaceEntity()
            newPlace.id = result.id ?? 0
            newPlace.name = result.name ?? "Unknow"
            newPlace.image = result.image ?? "Unknow"
            newPlace.desc = result.placeDescription ?? "Unknow"
            newPlace.address = result.address ?? "Unknow"
            newPlace.longitude = result.longitude ?? 0.0
            newPlace.latitude = result.latitude ?? 0.0
            return newPlace
        }
    }
    
    static func mapPlaceEntitiesToDomains ( input placeEntities: [PlaceEntity] ) -> [PlaceModel] {
        
        return placeEntities.map { result in
            
            return PlaceModel(
                id: result.id,
                name: result.name,
                placeDescription: result.desc,
                address: result.address,
                longitude: result.longitude,
                latitude: result.latitude,
                image: result.image,
                favorite: result.favorite
                
            )
        }
    }
    
    static func mapPlaceResponseToDomains ( input placeResponse: [PlaceResponse] ) -> [PlaceModel] {
        
        return placeResponse.map { result in
            
            return PlaceModel(
                id: result.id ?? 0,
                name: result.name ?? "Unknow",
                placeDescription: result.placeDescription ?? "Unknow",
                address: result.address,
                longitude: result.longitude,
                latitude: result.latitude,
                image: result.image
                
            )
        }
    }
    
    static func mapDetailMealEntityToDomain( input placeEntity: PlaceEntity  ) -> PlaceModel {
     
      return PlaceModel(
        id: placeEntity.id,
        name: placeEntity.name,
        placeDescription: placeEntity.desc,
        address: placeEntity.address,
        longitude: placeEntity.longitude,
        latitude: placeEntity.latitude,
        image: placeEntity.image,
        favorite: placeEntity.favorite
      )
    }
    
    static func mapMealEntitiesToDomains( input placeEntities: [PlaceEntity]) -> [PlaceModel] {
      return placeEntities.map { result in
      
         return PlaceModel(
           id: result.id,
           name: result.name,
           placeDescription: result.desc,
           address: result.address,
           longitude: result.longitude,
           latitude: result.latitude,
           image: result.image,
           favorite: result.favorite
         )
      }
    }
    
}
