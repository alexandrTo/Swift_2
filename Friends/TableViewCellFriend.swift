//
//  TableViewCellFriend.swift
//  Swift_2
//
//  Created by Александр Токарев on 20.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCellFriend: UITableViewCell {
    
    @IBOutlet weak var imageFriend: UIImageView!
    @IBOutlet weak var nameFriend: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageFriend.layer.cornerRadius = 30
        imageFriend.clipsToBounds = true
    }
    
    func loadData(friend: Friends) {
        nameFriend.text = friend.nameFriend
        
        if let imageURL = URL(string: friend.imageFriend) {
            imageFriend.kf.setImage(with: imageURL)
        }
    }


}

