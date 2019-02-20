//
//  ViewController.swift
//  ItauBot
//
//  Created by Gilmar on 14/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var msg:Message!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        REST.loadGET()
    
    }

}

