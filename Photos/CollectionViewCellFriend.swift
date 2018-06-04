//
//  CollectionViewCell.swift
//  Swift_2
//
//  Created by Александр Токарев on 21.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCellFriend: UICollectionViewCell {
    
    @IBOutlet weak var imageFriend: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageFriend.layer.cornerRadius = 5
        imageFriend.clipsToBounds = true
    }
    
    func loadData(photo: Photos) {
        
        if let imageURL = URL(string: photo.src_big) {
            imageFriend.kf.setImage(with: imageURL)
        }
    }
    
}
