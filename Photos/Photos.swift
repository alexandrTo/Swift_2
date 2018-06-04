//
//  Photos.swift
//  Swift_2
//
//  Created by Александр Токарев on 31.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Photos: Object {
    
    @objc dynamic var src_small = ""
    @objc dynamic var src_big = ""
    @objc dynamic var src_xbig = ""
    @objc dynamic var src_xxbig = ""
    @objc dynamic var owner_id = 0
    
    convenience init(json: JSON) {
        self.init()
        self.src_small = json["src_small"].stringValue
        self.src_big = json["src_big"].stringValue
        self.src_xbig = json["src_xbig"].stringValue
        self.src_xxbig = json["src_xxbig"].stringValue
        self.owner_id = json["owner_id"].intValue
    }
    
}
