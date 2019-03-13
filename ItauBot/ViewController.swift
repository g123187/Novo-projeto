//
//  ViewController.swift
//  ItauBot
//
//  Created by Gilmar on 14/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var msg: Message!
    
    @IBOutlet weak var tfuser: UITextField!
    @IBOutlet weak var tfPassaword: UITextField!
    @IBOutlet weak var btGo: UIButton!
    @IBOutlet weak var btOpen: UIButton!
    
    let myColor : UIColor = UIColor(red:0, green:0, blue:0, alpha: 1)
    
    override func viewDidLoad() {
              super.viewDidLoad()
//        REST.loadGET()
            //botões
            btGo.layer.cornerRadius = 6
            btGo.layer.shadowColor = myColor.cgColor
            btGo.layer.shadowOpacity = 0.3
            btGo.layer.shadowOffset = CGSize.init(width: 0, height: 3)
            btGo.layer.shadowRadius = 6
        
            btOpen.layer.cornerRadius = 6
            btOpen.layer.shadowColor = myColor.cgColor
            btOpen.layer.shadowOpacity = 0.3
            btOpen.layer.shadowOffset = CGSize.init(width: 0, height: 3)
            btOpen.layer.shadowRadius = 6
    }

        
    }



