//
//  Group.swift
//  Swift_2
//
//  Created by Александр Токарев on 31.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Groups: Object {
    
    @objc dynamic var photo_medium = ""
    @objc dynamic var name = ""
    @objc dynamic var screen_name = ""
    @objc dynamic var photo = ""
    @objc dynamic var gid = Int()
    @objc dynamic var photo_big = ""
    @objc dynamic var type = ""
    
    convenience init(json: JSON) {
        self.init()
            self.photo_medium = json["photo_medium"].stringValue
            self.name = json["name"].stringValue
            self.screen_name = json["screen_name"].stringValue
            self.photo = json["photo"].stringValue
            self.gid = json["gid"].intValue
            self.photo_big = json["photo_big"].stringValue
            self.type = json["type"].stringValue
    }
    
}
