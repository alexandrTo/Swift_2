//
//  CollectionViewController.swift
//  Swift_2
//
//  Created by Александр Токарев on 21.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit
import RealmSwift

let reuseIdentifier = "myCell"

class CollectionViewController: UICollectionViewController {

    var friend: Friends!
    var photos = [Photos]()
    var index = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotosApi()
    }
    
    func loadPhotosApi() {
        let api = Api()
        api.getPhotos(user_id: friend.user_id) { (data, error) in
            if let error = error {
                print(error)
                return
            }
            if let photos = data {
                self.photos = photos as! [Photos]
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCellFriend
        let photo = photos[indexPath.row]
        cell.loadData(photo: photo)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoView = segue.destination as? ViewControllerPhoto {
            if photos[index].src_xbig != "" {
                photoView.urlPhoto = photos[index].src_xbig
            }else{
                photoView.urlPhoto = photos[index].src_big
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "SegueToPhoto", sender: nil)
        
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.bounds.width - 2) / 3
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
