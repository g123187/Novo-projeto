//
//  ConversasViewController.swift
//  ItauBot
//
//  Created by Gilmar on 15/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import UIKit



class ConversasViewController: UIViewController {
    
    var msg:Message!
    
    
    @IBOutlet weak var ivEva: UIImageView!
    @IBOutlet weak var lbName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ivEva.layer.cornerRadius = ivEva.frame.size.width / 2
        ivEva.clipsToBounds = true
    }


    @IBAction func addEdit(_ sender: UIButton) {
        if msg == nil{
            msg  = Message()
        }
        msg.text = lbName.text!
        
        REST.loadPost(t: msg) { (success) in
           print("teste")
        }
    
    }
    
}
