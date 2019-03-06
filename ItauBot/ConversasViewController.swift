//
//  ConversasViewController.swift
//  ItauBot
//
//  Created by Gilmar on 15/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import UIKit
import PushKit
import UserNotifications

enum MessageType {
    case user
    case botText
    case botForecast
}

class ConversasViewController: UIViewController{
    
    var pushRegistry: PKPushRegistry!
   
    var session_id:String = ""
    var message: String = ""
    var nickName: String = ""
    var botName = "Itaú"
    var perguntas: String = ""
    var respostas: String = ""
  
    var passos:Array = [
        "Com você gostaria de ser chamado?",
        "Poderia informar seu CPF?",
        "Precisammos de uma senha",
        "Poderia informa um telefone para eventual contato",
        "Acabei de enviar um TOKEN,poderia confirmar?",
        "Para indicar os serviço certos para você,qual sua renda atual?",
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
    @IBOutlet weak var lbCpf: UILabel!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var btoEyes: UIButton!
    @IBOutlet weak var ivFone: UILabel!
    @IBOutlet weak var ivEscolhaClient: UIImageView!
    @IBOutlet weak var lbUserEsc: UILabel!
    @IBOutlet weak var uvPlano: UIView!
    
    let myColor : UIColor = UIColor(red:0, green: 0 , blue:0, alpha: 100 )
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        lbteste.text = self.botName
        //botão icon
        btoEyes.isHidden = true
        //uvPlano.isHidden = false
        //imagem
        ivEscolhaClient.layer.cornerRadius = ivEscolhaClient.frame.size.width / 2
        ivEscolhaClient.clipsToBounds = true
        ivEscolhaClient.layer.borderWidth = 1
        ivEscolhaClient.layer.borderColor = myColor.cgColor
        
        ivFone.isHidden = true
        ivIcon.isHidden = true
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
        
        if let image = UIImage(named: "eyes") {
            self.btoEyes.setImage(image, for: .normal)
        }
        
        
    }
    
    @IBAction func btvisibilit(_ sender: Any) {
        if tfUser.isSecureTextEntry == true {
            tfUser.isSecureTextEntry = false
        } else {
        tfUser.isSecureTextEntry = true
        }
    }
    
    //Bot
    @IBAction func btCPF(_ sender: Any) {
    switch lbPasso.text!{
        
        case passos[0]:
            
            lbPasso.text! = passos[1]
            self.lbUsername.text = self.tfUser.text
            tfUser.text = ""
            lbtextUser.text = "Somente numeros,sem pontos e traços"
            tfUser.placeholder = "digite seu cpf"
            lbtextUser.textAlignment = NSTextAlignment.center;
            btNextShow.setTitle("agora definir uma senha →", for: .normal)
            tfUser.keyboardType = .decimalPad
    
        case passos[1]:
            
            lbPasso.text! = passos[2]
            self.lbCpf.text = self.tfUser.text
            tfUser.keyboardType = .default
            ivIcon.isHidden = false
            btoEyes.isHidden = false
            self.tfUser.text = ""
            lbtextUser.text = "defina um senha,pode clicar no olho para ver o que esta escrevendo"
            tfUser.placeholder = "Digite seu senha "
            lbtextUser.textAlignment = NSTextAlignment.left;
            btNextShow.setTitle("um número para contato →", for: .normal)
            tfUser.isSecureTextEntry = true
            tfUser.keyboardType = .decimalPad
        
        case passos[2]:
            
            ivIcon.isHidden = true
            btoEyes.isHidden = true
            ivFone.isHidden = false
            tfUser.isSecureTextEntry = false
            self.tfUser.text = ""
            lbPasso.text! = passos[3]
            lbtextUser.text = "digite o DD e o seu telefone"
            tfUser.placeholder = "digite seu telefone"
            lbtextUser.textAlignment = NSTextAlignment.center
            btNextShow.setTitle("continuar →", for: .normal)
            tfUser.keyboardType = .decimalPad
        
            let content = UNMutableNotificationContent()
            content.title = "teste"
            content.body = "digite este token 1234 no seu App"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval:5, repeats: false )
            let request = UNNotificationRequest(identifier: "teste", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler:nil)
        
        
        case passos[3]:
            
            
            lbPasso.text! = passos[4]
            ivFone.isHidden = true
            //self.lbUsername.text = self.tfUser.text
            self.tfUser.text = ""
            lbtextUser.text = "os 4 digitos que foram enviadoss"
            tfUser.placeholder = "digite o token"
            lbtextUser.textAlignment = NSTextAlignment.center;
            btNextShow.setTitle("agora definir uma senha →", for: .normal)
            //tfUser.keyboardType = .decimalPad
        
        case passos[4]:
            
            lbPasso.text! = passos[5]
            //self.lbUsername.text = self.tfUser.text
            self.tfUser.text = ""
            lbtextUser.text = "Somente o valor brutos"
            tfUser.placeholder = "R$ 0,00"
            lbtextUser.textAlignment = NSTextAlignment.center;
            btNextShow.setTitle("continuar →", for: .normal)
            tfUser.keyboardType = .decimalPad
        
        case passos[5]:
            
            lbPasso.text! = passos[6]
            uvPlano.isHidden = false
            lbUserEsc.text = lbUsername.text
        
          
        case passos[6]:
           
            //inica capitura de foto
            lbPasso.text! = passos[7]
            ivbot.isHidden = true
            ivClient.isHidden = true
             
        case passos[7]:
            lbPasso.text! = passos[8]
            //Enviar endereço
        case passos[8]:
            lbPasso.text! = passos[9]
       break
        default:
         lbPasso.text! = passos[0]
        }
}
    
}
extension ConversasViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return  3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        as? CarrosselCollectionViewCell
        //guard let teste = indexPath.row == 3 else {return}
        cell?.vCarrossel.layer.cornerRadius = 10
        cell?.vCarrossel = cell
        
        return cell!
    }
    
  
}
