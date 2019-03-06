//
//  OverviewController.swift
//  Kjorelista
//
//  Created by Sven Aanesen on 05/03/2019.
//  Copyright © 2019 svenway. All rights reserved.
//

import UIKit

class OverviewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let image = UIImage(named: "add")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addButtonHandler(_:)))
    }
    
    @objc private func addButtonHandler(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "register", sender: self)
    }
}
