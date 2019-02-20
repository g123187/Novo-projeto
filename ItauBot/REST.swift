//
//  REST.swift
//  ItauBot
//
//  Created by Gilmar on 14/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import Foundation

class REST{
    var msg : Message!
    
    private static let basePath = "https://damp-atoll-69989.herokuapp.com/api/session"
    
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
        var msg : Message
        
        // Seta a URL
        let url = URL(string: basePath)!
        // faz a requisição retornando data, response, error
        let task = URLSession.shared.dataTask(with: url){(data, response, error) in
            //checa se tem erro
            guard error == nil else {
                // Exibe o erro
                print(error?.localizedDescription ?? "")
                // encerra e não executa o restante do código
                return
            }
            // Remove do optional
            guard let data = data else {return}
                // pega o conteudo do JSON converte para string
           guard  let contents = String(data: data, encoding: String.Encoding.utf8) else{return}
                // Printa o JSON como String
            print(contents)
            
        }
        // Encerra a requisição
        task.resume()

    }
    
    class func loadPost(msg:Message,onComplete: @escaping (Bool)->Void ){
         guard let url = URL(string: basePath)else {
            onComplete(false)

            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let json = try?  JSONEncoder().encode(msg) else {
            onComplete(false)
            return
        }
        request.httpBody = json // corpo
        
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil{
                guard let response = response as? HTTPURLResponse,let _ = data else{
                    onComplete(false)
                    return
                }
                onComplete(true)
                print("passou ")
            }else {
                onComplete(false)
            }
        }
        dataTask.resume()
    }
}
