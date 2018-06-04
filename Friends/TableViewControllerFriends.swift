//
//  TableViewControllerFriends.swift
//  Swift_2
//
//  Created by Александр Токарев on 20.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

class TableViewControllerFriends: UITableViewController {
    
    var friends = [Friends]()
    var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = Api()
        api.getData(method: "friends.get", param: "&fields=photo_100,photo_200_orig") { (friends) in
            self.friends = friends as! [Friends]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFriend", for: indexPath) as! TableViewCellFriend
        
        let friend = friends[indexPath.row]
        cell.loadData(friend: friend)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexRow = indexPath.row
        performSegue(withIdentifier: "segueToCollection", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let collectionView = segue.destination as? CollectionViewController {
            collectionView.friend = friends[indexRow]
        }
    }
    
    
}
