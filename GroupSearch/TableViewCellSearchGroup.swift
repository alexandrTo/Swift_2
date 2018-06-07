//
//  TableViewCellSearchGroup.swift
//  Swift_2
//
//  Created by Александр Токарев on 02.06.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCellSearchGroup: UITableViewCell {
    
    @IBOutlet weak var groupTextField: UILabel!
    @IBOutlet weak var imageSearchGroup: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageSearchGroup.layer.cornerRadius = 30
        imageSearchGroup.clipsToBounds = true
    }
    
    func loadData(group: Groups) {
        groupTextField.text = group.name
        if let imageURL = URL(string: group.photo_medium) {
            DispatchQueue.main.async {
                self.imageSearchGroup.kf.setImage(with: imageURL)
            }
            
        }
    }
    
}
