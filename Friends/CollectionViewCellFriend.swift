//
//  CollectionViewCell.swift
//  Swift_2
//
//  Created by Александр Токарев on 21.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

class CollectionViewCellFriend: UICollectionViewCell {
    
    @IBOutlet weak var imageFriend: UIImageView!
    @IBOutlet weak var nameFriend: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageFriend.layer.cornerRadius = 10
        imageFriend.clipsToBounds = true
    }
}
