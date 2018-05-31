//
//  TableViewControllerGroup.swift
//  Swift_2
//
//  Created by Александр Токарев on 21.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

class TableViewControllerGroup: UITableViewController {
    
    var groups = [Groups]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = Api()
        api.getGroups { (groups) in
            self.groups = groups
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellGroup", for: indexPath) as! TableViewCellGroup
        
        let group = groups[indexPath.row]
        cell.loadData(group: group)
        
        return cell
    }

}
