//
//  FotoViewController.swift
//  ItauBot
//
//  Created by Gilmar on 06/03/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import UIKit
import UserNotifications



enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

class FotoViewController: UIViewController {
    
    var teste = testeViewController()
    
    @IBOutlet weak var btRg: UIButton!
    @IBOutlet weak var btCnh: UIButton!
    @IBOutlet weak var btRne: UIButton!
    @IBOutlet weak var ivCliente: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // bordas bt
        btRg.layer.cornerRadius = 6
        btCnh.layer.cornerRadius = 6
        btRne.layer.cornerRadius = 6
        btRg.layer.borderWidth = 0.1
        btCnh.layer.borderWidth = 0.1
        btRne.layer.borderWidth = 0.1
        
        // Do any additional setup after loading the view.
    }
   
    let myColor : UIColor = UIColor(red:1.00, green:0.28, blue:0.00, alpha:1.0) /* #ffcc00 */
    let yourColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    @IBAction func btRg(_ sender: Any) {
        btRg.layer.backgroundColor = myColor.cgColor
        btRg.setTitleColor(.white, for: .normal)
    
    }
    
    @IBAction func btCnh(_ sender: Any) {
         btCnh.layer.backgroundColor = myColor.cgColor
        btCnh.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func btRne(_ sender: Any) {
         btCnh.layer.backgroundColor = myColor.cgColor
        btRne.setTitleColor(.white, for: .normal)
    }
    
    func selectPicture(source: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = source
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func btFoto(_ sender: Any) {
        
        let alert = UIAlertController(title: "Selecionar uma Foto", message: "De onde você quer escolher?", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Câmera", style: .default) { (_) in
            self.selectPicture(source: .camera)
        }
        alert.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default) { (_) in
            self.selectPicture(source: .photoLibrary)
            
        }
        alert.addAction(libraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in
            
        }
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "testeID") as! testeViewController
        // myVC.stringPassed = myLabel.text!
        navigationController?.pushViewController(myVC, animated: true)
        
    }

    
  
}

extension FotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
        teste.ivCliente.image = image
        //self.foto.isHidden = false
           
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
