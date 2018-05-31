//
//  Group.swift
//  Swift_2
//
//  Created by Александр Токарев on 31.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation
import SwiftyJSON

class Groups {
    
    var photo_medium = ""
    var name = ""
    var screen_name = ""
    var photo = ""
    var gid = 0
    var photo_big = ""
    var type = ""
    
    init(json: JSON) {
        self.photo_medium = json["photo_medium"].stringValue
        self.name = json["name"].stringValue
        self.screen_name = json["screen_name"].stringValue
        self.photo = json["photo"].stringValue
        self.gid = json["gid"].intValue
        self.photo_big = json["photo_big"].stringValue
        self.type = json["type"].stringValue
    }
    
}
