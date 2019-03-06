//
//  LoginViewController.swift
//  Kjorelista
//
//  Created by Sven Aanesen on 05/03/2019.
//  Copyright © 2019 svenway. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var usernameView: UIView!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInterface()
    }
    
    private func setupInterface() {
        usernameView.layer.borderColor = UIColor.lightGray.cgColor
        usernameView.layer.borderWidth = 1.0
        usernameView.layer.cornerRadius = 20.0
        
        usernameLabel.font = UIFont.defaultRegularFontWithSize(12)
        usernameLabel.textColor = UIColor.appLightTextColor()
        
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        passwordView.layer.borderWidth = 1.0
        passwordView.layer.cornerRadius = 20.0
        
        passwordLabel.font = UIFont.defaultRegularFontWithSize(12)
        passwordLabel.textColor = UIColor.appLightTextColor()
        
        //navigationItem.hidesBackButton = true
    }

}
