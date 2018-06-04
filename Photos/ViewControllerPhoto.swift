//
//  ViewControllerPhoto.swift
//  Swift_2
//
//  Created by Александр Токарев on 31.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit
import Kingfisher

class ViewControllerPhoto: UIViewController {
    
    var urlPhoto = ""
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageURL = URL(string: urlPhoto) {
            self.image.kf.setImage(with: imageURL)
        }
        
        
    }
    
    
    
}
