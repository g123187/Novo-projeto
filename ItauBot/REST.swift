//
//  REST.swift
//  ItauBot
//
//  Created by Gilmar on 14/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import Foundation

class REST{
    private static let basePath = "http://35.239.5.7:8080/conversations/"
    
    private static let configuration: URLSessionConfiguration = {
        let config  = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-type":"application.json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost  =  5
        
        return config
    }()
    private static let session =  URLSession(configuration: configuration)
    
    class func loadGET(){
        print("aquio")
        guard let url = URL(string: basePath)else {return}
       let dataTask =  session.dataTask(with: url) { (data :Data?  , response : URLResponse? ,error: Error?) in
        if error == nil{
            guard let response = response as? HTTPURLResponse else {return}
            
           if response.statusCode == 200{
                guard let data = data else{return}
                do{
                let msg = try JSONDecoder().decode(Message.self, from: data)
                 print(msg.text)
                }catch{
                    print(error.localizedDescription, "erro no DO CATCH" ,data )
                }
           }else {
                print("Erro com status" , response.statusCode)
            }
        }else {
            print("Erro no App ")
        }
        }
        print("Rodou")
        dataTask.resume()
    }
    var t: Message!
    class func loadPost(t:Message,onComplete: @escaping (Bool)->Void ){
         guard let url = URL(string: basePath)else {
            onComplete(false)
            print("Passou aqui ")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let json = try?  JSONEncoder().encode(t) else {
            onComplete(false)
            return
        }
        request.httpBody = json // corpo
        
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil{
                guard let response  = response as? HTTPURLResponse,let _ = data else{
                    onComplete(false)
                    print("Passoi aqui ")
                    return
                }
                onComplete(true)
                //msg.text = "oi"
                print("teste com ",t.text.data(using: <#T##String.Encoding#>)  )
            }else {
                onComplete(false)
            }
        }
        dataTask.resume()
    }
}
