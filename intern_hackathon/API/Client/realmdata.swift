//
//  realmdata.swift
//  intern_hackathon
//
//  Created by 益子智裕 on 2020/08/13.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit
import RealmSwift

class Realmdatas: Object {
    
    @objc dynamic var title: String?
    @objc dynamic var url: String?
    @objc dynamic var id: Int = 0
    @objc dynamic var tapDate: Date?
}

struct FavoriteData{
    var title:String?
    var url:String?
    var id:Int?
    var tapDate:Date?
}
