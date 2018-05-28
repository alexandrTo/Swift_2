//
//  TableViewControllerFriends.swift
//  Swift_2
//
//  Created by Александр Токарев on 20.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

class TableViewControllerFriends: UITableViewController {
    
    let data = DataFriends()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //test
//        guard let token = data.tok else { return }
//        let connect = Connection()
//        connect.getFriends(token: token) { (data) in
//            print(data)
//        }
        //test

    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.arrayFriends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCellFriend
        
//        cell.nameFriend!.text = data.arrayFriends[indexPath.row]
//        cell.imageFriend.image = UIImage(named: data.arrayPhoto[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToCollection", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow?.row
        
        if segue.identifier == "segueToCollection" {
            if let collView = segue.destination as? CollectionViewController {
                collView.indexRow = indexPath
                collView.data = data
            }
        }
    }
    
    
}
