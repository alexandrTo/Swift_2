//
//  Friends.swift
//  Swift_2
//
//  Created by Александр Токарев on 30.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Friends: Object {
    
    @objc dynamic var nameFriend = ""
    @objc dynamic var imageFriend = ""
    @objc dynamic var imageBig = ""
    @objc dynamic var user_id = 0
    
    convenience init(json: JSON) {
        self.init()
        self.nameFriend = "\(json["first_name"].stringValue) \(json["last_name"].stringValue)"
        self.imageFriend = json["photo_100"].stringValue
        self.imageBig = json["photo_200_orig"].stringValue
        self.user_id = json["user_id"].intValue
    }
    
}
