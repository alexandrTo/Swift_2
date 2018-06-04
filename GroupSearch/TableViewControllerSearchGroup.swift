//
//  TableViewControllerSearchGroup.swift
//  Swift_2
//
//  Created by Александр Токарев on 02.06.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

class TableViewControllerSearchGroup: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var groups = [Groups]()
    
    //    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    //    }
    //
    //    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    //    }
    //
    //    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let api = Api()
        api.getData(method: "groups.search", param: "&q=\(searchBar.text!)&type=group") { (foundGroups) in
            self.groups = foundGroups as! [Groups]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        print("ok")
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //        tableView.delegate = self
    //        tableView.dataSource = self
        searchBar.delegate = self
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellGroupSearch", for: indexPath) as! TableViewCellSearchGroup
        let group = groups[indexPath.row]
        cell.loadData(group: group)        
        return cell
    }
    
}
