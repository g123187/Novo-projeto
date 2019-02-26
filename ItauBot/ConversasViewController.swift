//
//  ConversasViewController.swift
//  ItauBot
//
//  Created by Gilmar on 15/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import UIKit

enum MessageType {
    case user
    case botText
    case botForecast
}

class ConversasViewController: UIViewController {
   
    var session_id:String = ""
    var message: String = ""
    var nickName: String = ""
    var botName = "Itaú"
    var perguntas: String = ""
    var respostas: String = ""
  
    var passos:Array = [
        "Com você gostaria de ser chamado?",
        "Definir uma senha",
        "Um número para contato",
        "Confirmar número de contato",
        "Informar renda",
        "Escolher plano",
        "Enviar documento",
        "Enviar endereço",
        "Retornar para Home"
    ]
    
    
    @IBOutlet weak var ivEva: UIImageView!
    @IBOutlet weak var lbteste: UILabel!
    @IBOutlet weak var lbUsername: UILabel!
    @IBOutlet weak var ivUser: UIImageView!
    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var ivClient: UIView!
    @IBOutlet weak var ivbot: UIView!
    @IBOutlet weak var lbPasso: UILabel!
    @IBOutlet weak var lbtextUser: UILabel!
    @IBOutlet weak var btNextShow: UIButton!
    
    
    let myColor : UIColor = UIColor(red:0, green: 0 , blue:0, alpha: 100 )
   
    override func viewDidLoad() {
        super.viewDidLoad()
        lbteste.text = self.botName
        
        //imagem
        ivEva.image = UIImage(named: "chatbot" )
        ivEva.layer.cornerRadius = ivEva.frame.size.width / 2
        ivEva.clipsToBounds = true
        ivEva.layer.borderWidth = 1
        ivEva.layer.borderColor = myColor.cgColor
        
        ivUser.image = UIImage(named: "client")
        ivUser.layer.cornerRadius = ivUser.frame.size.width / 2
        ivUser.clipsToBounds = true
        ivUser.layer.borderWidth = 1
        ivUser.layer.borderColor = myColor.cgColor
       
        //chat mokado
        lbPasso.text = passos[0]
    }
    
    @IBAction func btCPF(_ sender: Any) {
      
        switch lbPasso.text!{
        case passos[0]:
            
            lbPasso.text! = passos[1]
            self.lbUsername.text = self.tfUser.text
            self.tfUser.text = ""
            lbtextUser.text = "Somente numeros,sem pontos e traços"
            tfUser.placeholder = "digite seu cpf"
            lbtextUser.textAlignment = NSTextAlignment.left;
            btNextShow.setTitle("agora definir uma senha →", for: .normal)
            tfUser.keyboardType = .decimalPad
            
        case passos[1]:
           
          lbPasso.text! = passos[2]
        case passos[2]:
            lbPasso.text! = passos[3]
        case passos[3]:
            lbPasso.text! = passos[4]
        case passos[4]:
            lbPasso.text! = passos[5]
        case passos[5]:
            lbPasso.text! = passos[6]
        case passos[6]:
            //inica capitura de foto
            lbPasso.text! = passos[7]
            ivbot.isHidden = true
            ivClient.isHidden = true
        case passos[7]:
            lbPasso.text! = passos[8]
        case passos[8]:
            lbPasso.text! = passos[9]
       break
        default:
         lbPasso.text! = passos[0]
        }
        
    
}
}
