//
//  APIViewController.swift
//  Swift_2
//
//  Created by Александр Токарев on 22.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

class APIViewController: UIViewController {
    
    var token: String?
    
    @IBOutlet weak var search: UITextField!
    
    @IBAction func getFriends(_ sender: UIButton) {
        guard let token = token else { return }
        
        let newConnect = Connection()
        newConnect.getFriends(token: token, {(data) in
            print(data)
        })
    }
    
    @IBAction func getPhotos(_ sender: UIButton) {
        guard let token = token else { return }
        
        let newConnect = Connection()
        newConnect.getPhotos(token: token, {(data) in
            print(data)
        })
    }
    
    @IBAction func getGroups(_ sender: UIButton) {
        guard let token = token else { return }
        
        let newConnect = Connection()
        newConnect.getGroups(token: token, {(data) in
            print(data)
        })
    }
    
    @IBAction func searchGroups(_ sender: UIButton) {
        guard let token = token, let search = search else { return }
        
        let newConnect = Connection()
        newConnect.searchGroups(token: token, srch: search.text!, { (data) in
            print(data)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = token {
            print(token)
        }
    }

}
