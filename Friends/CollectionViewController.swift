//
//  CollectionViewController.swift
//  Swift_2
//
//  Created by Александр Токарев on 21.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

let reuseIdentifier = "myCell"

class CollectionViewController: UICollectionViewController {

    var indexRow: Int?
    var data: DataFriends?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCellFriend

        if let indexRow = indexRow {
            cell.imageFriend.image = UIImage(named: (data?.arrayPhoto[indexRow])!)
        }
        
        return cell
    }

}
