//
//  ViewController.swift
//  Kjorelista
//
//  Created by Sven Aanesen on 04/03/2019.
//  Copyright © 2019 svenway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegue(withIdentifier: "login", sender: self)
    }
    
}

