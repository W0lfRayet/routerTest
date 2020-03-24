//
//  ViewController.swift
//  Product Test
//
//  Created by George Bakaykin on 24.03.20.
//  Copyright © 2020 George Bakaykin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var router: Router?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.router = Router(viewController: self)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func action(_ sender: Any) {
        self.router?.present()
    }
    

}

