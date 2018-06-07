//
//  TableViewControllerGroup.swift
//  Swift_2
//
//  Created by Александр Токарев on 21.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewControllerGroup: UITableViewController {
    
    var groups = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGroupsApi()        
    }
    
    func loadGroupsApi() {
        let api = Api()
        api.getGroups { (error) in
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.loadGroupsRealm()
                self.tableView.reloadData()
            }
        }
    }
    
    func loadGroupsRealm() {
        let realm = try! Realm()
        let groups = realm.objects(Groups.self)
        self.groups = Array(groups)
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
