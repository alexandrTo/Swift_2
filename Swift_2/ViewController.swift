//
//  ViewController.swift
//  Swift_2
//
//  Created by Александр Токарев on 20.05.2018.
//  Copyright © 2018 Александр Токарев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let whiteColor: UIColor = UIColor.white
        let cyanColor: UIColor = UIColor.cyan
        
        enterButton.layer.borderWidth = 0.8
        enterButton.layer.borderColor = whiteColor.cgColor
        enterButton.layer.cornerRadius = 8.0
        enterButton.clipsToBounds = true
        
        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.cornerRadius = 5.0
        loginTextField.layer.borderColor = cyanColor.cgColor
        loginTextField.borderStyle = UITextBorderStyle.roundedRect
        
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 5.0
        passwordTextField.layer.borderColor = cyanColor.cgColor
        passwordTextField.borderStyle = UITextBorderStyle.roundedRect
        
        registerForKeyboardNotifications()

    }
    
    
    @IBAction func enterTappedButton(_ sender: UIButton) {
        if checkAuthentication() {
            performSegue(withIdentifier: "SegueToTabBar", sender: nil)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAuthentication() -> Bool {
        guard let loginTextField = loginTextField.text, let passwordTextField = passwordTextField.text else {
            return false
        }
        if loginTextField == "admin" && passwordTextField == "123" {
            return true
        }
        return false
    }
    
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    @objc func keyboardShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    
    
    @objc func keyboardHide() {
        scrollView.contentOffset = CGPoint.zero
    }
    
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
}

