//
//  ViewControllerWeb.swift
//  Swift_2
//
//  Created by Александр Токарев on 22.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit
import WebKit

class ViewControllerWeb: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var currentToken = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        
        let newConnect = Connection()
        
        if let request = newConnect.oauthSession() {
            webView.load(request)
        }
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Swift.Void) {
        
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment else {
                decisionHandler(.allow)
                return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map({$0.components(separatedBy: "=")})
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        if let token = params["access_token"] {
            currentToken = token
            performSegue(withIdentifier: "segueToAPI", sender: nil)
            //test
            //performSegue(withIdentifier: "WebSegueToTabBar", sender: nil)
            //test
        }
        decisionHandler(.allow)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToAPI" {
            if let apiView = segue.destination as? APIViewController {
                apiView.token = currentToken
            }
        }
        //test
        if segue.identifier == "WebSegueToTabBar" {
            
        }
        //test
    }
    
}
