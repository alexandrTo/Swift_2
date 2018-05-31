//
//  Connection.swift
//  Swift_2
//
//  Created by Александр Токарев on 22.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import Foundation

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
    
}
