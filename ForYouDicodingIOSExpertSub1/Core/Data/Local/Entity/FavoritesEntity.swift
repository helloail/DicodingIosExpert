//
//  FavoritesEntity.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 08/11/20.
//

import Foundation
import RealmSwift

class FavoritesEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var image: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
