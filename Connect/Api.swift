//
//  Api.swift
//  Swift_2
//
//  Created by Александр Токарев on 31.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation
import SwiftyJSON

class Api {
    
    func getFriends(result: @escaping ([Friends]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=\(currentToken)&fields=photo_100,photo_200_orig&version=5.74&") else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            let json = JSON(data)
            let friends = json["response"].map{ Friends(json: $0.1) }
            DispatchQueue.main.async {
                result(friends)
            }
            }.resume()
    }
    
    
    func getPhotos(result: @escaping (_ json: JSON) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(currentToken)&album_id=profile&version=5.74&") else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            let json = JSON(data)
            result(json)
            
            }.resume()
    }
    
    func getGroups(result: @escaping ([Groups]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(currentToken)&extended=1&version=5.74&") else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            let json = JSON(data)
            let groups = json["response"].map{ Groups(json: $0.1) }
            DispatchQueue.main.async {
                result(groups)
            }
            }.resume()
    }
    
    func searchGroups(srch: String, _ result: @escaping (_ json: JSON) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.search?access_token=\(currentToken)&q=\(srch)&type=group&version=5.74&") else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            let json = JSON(data)
            result(json)
            
            }.resume()
    }
    
    
}
