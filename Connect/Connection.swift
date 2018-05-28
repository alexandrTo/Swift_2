//
//  Connection.swift
//  Swift_2
//
//  Created by Александр Токарев on 22.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation
import SwiftyJSON

class Connection {
    
    func oauthSession() -> URLRequest? {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "http"
        urlConstructor.host = "oauth.vk.com"
        urlConstructor.path = "/authorize"
        urlConstructor.queryItems = [
            URLQueryItem(name: "client_id", value: "6487025"),
            URLQueryItem(name: "redirect_url", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "scope", value: "6"),
            URLQueryItem(name: "v", value: "5.74")
        ]

        guard let url = urlConstructor.url else { return nil }
        
        return URLRequest(url: url)
    }
    
    
    func getFriends(token: String, _ result: @escaping (_ json: JSON) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=\(token)&fields=nickname&version=5.74&") else { return }
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
    
    func getPhotos(token: String, _ result: @escaping (_ json: JSON) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(token)&album_id=profile&version=5.74&") else { return }
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
    
    func getGroups(token: String, _ result: @escaping (_ json: JSON) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(token)&extended=1&version=5.74&") else { return }
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
    
    func searchGroups(token: String, srch: String, _ result: @escaping (_ json: JSON) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.search?access_token=\(token)&q=\(srch)&type=group&version=5.74&") else { return }
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
