//
//  PlanoViewController.swift
//  ItauBot
//
//  Created by Gilmar on 01/03/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import UIKit

class PlanoViewController: UIViewController{

    @IBOutlet weak var ivBot: UIImageView!
    @IBOutlet weak var lbBotText: UILabel!
    @IBOutlet weak var lbTotalPlano: UILabel!
    @IBOutlet weak var lbValorTrans: UILabel!
    @IBOutlet weak var lbvalorSaque: UILabel!
    @IBOutlet weak var lbValorcheque: UILabel!
    var conversas = ConversasViewController()
    
    let myColor : UIColor = UIColor(red:0, green: 0 , blue:0, alpha: 100 )
    override func viewDidLoad() {
        super.viewDidLoad()
        lbBotText.text = conversas.passos[6]
        ivBot.layer.cornerRadius = ivBot.frame.size.width / 2
        ivBot.clipsToBounds = true
        ivBot.layer.borderWidth = 1
        ivBot.layer.borderColor = myColor.cgColor
    
    }
    
    @IBAction func S(_ sender: UISwitch) {
    }
    
    @IBAction func btMais(_ sender: Any) {
        
    }
    
    @IBAction func btMenos(_ sender: Any) {
    }
    

    
  
}

