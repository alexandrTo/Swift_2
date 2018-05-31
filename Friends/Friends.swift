//
//  Friends.swift
//  Swift_2
//
//  Created by Александр Токарев on 30.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation
import SwiftyJSON

class Friends {
    
    var nameFriend = ""
    var imageFriend = ""
    var imageBig = ""
    
    init(json: JSON) {
        self.nameFriend = "\(json["first_name"].stringValue) \(json["last_name"].stringValue)"
        self.imageFriend = json["photo_100"].stringValue
        self.imageBig = json["photo_200_orig"].stringValue
    }
    
}
