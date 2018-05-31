//
//  TableViewCellGroup.swift
//  Swift_2
//
//  Created by Александр Токарев on 31.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCellGroup: UITableViewCell {

    @IBOutlet weak var photoGroup: UIImageView!
    @IBOutlet weak var nameGroupTextField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoGroup.layer.cornerRadius = 30
        photoGroup.clipsToBounds = true        
    }

    func loadData(group: Groups) {
        nameGroupTextField.text = group.name
        
        if let imageURL = URL(string: group.photo) {
            photoGroup.kf.setImage(with: imageURL)
        }
    }

}
