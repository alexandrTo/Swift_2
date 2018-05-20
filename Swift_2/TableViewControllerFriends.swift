//
//  TableViewControllerFriends.swift
//  Swift_2
//
//  Created by Александр Токарев on 20.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

class TableViewControllerFriends: UITableViewController {

    var arrayFriends = ["Johnny Depp", "Will Smith", "Leonardo Wilhelm DiCaprio"]
    var arrayPhoto = ["Джонни Депп", "Уил Смит", "Леонардо ДиКаприо"]
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayFriends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCellFriend
        
        cell.nameFriend!.text = arrayFriends[indexPath.row]
        cell.imageFriend.image = UIImage(named: arrayPhoto[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81.0
    }

}

