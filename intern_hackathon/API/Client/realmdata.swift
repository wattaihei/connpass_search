//
//  realmdata.swift
//  intern_hackathon
//
//  Created by 益子智裕 on 2020/08/13.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit
import RealmSwift

class RealmEventData : Object {
    
    @objc dynamic var title: String? = ""
    @objc dynamic var url: String? = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var tapDate: Date?
    @objc dynamic var eventDescription: String? = ""
    @objc dynamic var eventCatch: String? = ""
    @objc dynamic var eventURL: String? = ""
    @objc dynamic var startedAt: String? = ""
    @objc dynamic var endedAt: String? = ""
    @objc dynamic var limit: Int = 1
    @objc dynamic var hashTag: String? = ""
    @objc dynamic var waiting: Int = 1
    @objc dynamic var accepted: Int = 1
    @objc dynamic var updatedAt: String?  = ""
    @objc dynamic var ownerID : Int = 1
    @objc dynamic var ownerNickname: String?  = ""
    @objc dynamic var ownerDisplayName: String?  = ""
    @objc dynamic var place: Int = 1
    @objc dynamic var address: String?  = ""
    @objc dynamic var lat: String?  = ""
    @objc dynamic var ion: String?  = ""
}

struct FavoriteData{
    var title:String?
    var url:String?
    var id:Int?
    var tapDate:Date?


}
