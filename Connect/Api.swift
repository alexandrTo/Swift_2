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
    typealias errorCompletion = (Error?) -> Void
    typealias dataCompletion = ([Any]?, Error?) -> Void
    
    enum methods {
        case getFriends
        case getPhotos
        case getGroups
        case searchGroups
        
        var nameMethod: String {
            switch self {
            case .getFriends:
                return "friends.get"
            case .getPhotos:
                return "photos.get"
            case .getGroups:
                return "groups.get"
            case .searchGroups:
                return "groups.search"
            }
        }
        
        var parametrs: String {
            switch self {
            case .getFriends:
                return "&fields=photo_100,photo_200_orig"
            case .getPhotos:
                return "&album_id=profile&owner_id="
            case .getGroups:
                return "&extended=1"
            case .searchGroups:
                return "&type=group&q="
            }
        }
    }
    
    
    func getFriends(result: errorCompletion? = nil) {
        let method: methods = .getFriends
        var arrayObj: [Any] = []
        guard let url = URL(string: "\(baseUrl)\(method.nameMethod)?access_token=\(Api.token)\(method.parametrs)&version=5.74&") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                result!(error)
                return
            }
            if let data = data, let json = try? JSON(data: data) {
                arrayObj = json["response"].map { Friends(json: $0.1) }
                self.saveFriendsData(arrayObj as! [Friends])
                result!(nil)
            }
            }.resume()
    }
    
    func saveFriendsData(_ friends: [Friends]) {
        let realm = try! Realm()
        let forRemoving = realm.objects(Friends.self)
        do {
            try realm.write {
                realm.delete(forRemoving)
                realm.add(friends)
                //print(Realm.Configuration.defaultConfiguration.fileURL!)
            }
        } catch {
            print(error)
        }
    }

    func getGroups(result: errorCompletion? = nil) {
        let method: methods = .getGroups
        var arrayObj: [Any] = []
        guard let url = URL(string: "\(baseUrl)\(method.nameMethod)?access_token=\(Api.token)\(method.parametrs)&version=5.74&") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                result!(error)
                return
            }
            if let data = data, let json = try? JSON(data: data) {
                arrayObj = json["response"].map { Groups(json: $0.1) }
                self.saveGroupsData(arrayObj as! [Groups])
                result!(nil)
            }
            }.resume()
    }
    
    func saveGroupsData(_ groups: [Groups]) {
        let realm = try! Realm()
        let forRemoving = realm.objects(Groups.self)
        do {
            try realm.write {
                realm.delete(forRemoving)
                realm.add(groups)
                //print(Realm.Configuration.defaultConfiguration.fileURL!)
            }
        } catch {
            print(error)
        }
    }
    
    func getPhotos(user_id: Int, result: dataCompletion? = nil) {
        let method: methods = .getPhotos
        var arrayObj: [Any] = []
        guard let url = URL(string: "\(baseUrl)\(method.nameMethod)?access_token=\(Api.token)\(method.parametrs)\(user_id)&version=5.74&") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                result?(nil, error)
                return
            }
            if let data = data, let json = try? JSON(data: data) {
                arrayObj = json["response"].map { Photos(json: $0.1) }
                result?(arrayObj as? [Photos], nil)
            }
            }.resume()
    }

    func searchGroups(searchText: String, result: dataCompletion? = nil) {
        let method: methods = .searchGroups
        var arrayObj: [Any] = []
        guard let url = URL(string: "\(baseUrl)\(method.nameMethod)?access_token=\(Api.token)\(method.parametrs)\(searchText)&version=5.74&") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                result?(nil, error)
                return
            }
            if let data = data, let json = try? JSON(data: data) {
                arrayObj = json["response"].map { Groups(json: $0.1) }
                result?(arrayObj as? [Groups], nil)
            }
            }.resume()
    }
    
    
}
