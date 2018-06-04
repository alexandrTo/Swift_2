//
//  Api.swift
//  Swift_2
//
//  Created by Александр Токарев on 31.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Api {
    
    let baseUrl = "https://api.vk.com/method/"
    static var token = ""
    
    func getData(method: String, param: String, result: @escaping ([Any]) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)\(method)?access_token=\(Api.token)\(param)&version=5.74&") else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            let json = JSON(data)
            
            var arrayObj: [Any] = []
            let response = json["response"]
            
            switch method {
            case "friends.get":
                arrayObj = response.map { Friends(json: $0.1) }
                DispatchQueue.main.async {
                    result(arrayObj)
                    self.saveFriendsData(arrayObj as! [Friends])
                }
                
            case "groups.get":
                arrayObj = response.map { Groups(json: $0.1) }
                DispatchQueue.main.async {
                    result(arrayObj)
                    self.saveGroupsData(arrayObj as! [Groups])
                }
                
            case "groups.search":
                arrayObj = response.map { Groups(json: $0.1) }
                
            case "photos.get":
                arrayObj = response.map { Photos(json: $0.1) }
                DispatchQueue.main.async {
                    result(arrayObj)
                    self.savePhotosData(arrayObj as! [Photos])
                }
                
            default:
                break
            }
            }.resume()
    }
    
    func saveFriendsData(_ friends: [Friends]) {
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.add(friends)
                print(Realm.Configuration.defaultConfiguration.fileURL!)
            }
        } catch {
            print(error)
        }
    }
    
    func saveGroupsData(_ groups: [Groups]) {
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.add(groups)
            }
        } catch {
            print(error)
        }
    }
    
    func savePhotosData(_ photos: [Photos]) {
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.add(photos)
            }
        } catch {
            print(error)
        }
    }
    
}
