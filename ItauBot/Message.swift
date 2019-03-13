//
//  Message.swift
//  ItauBot
//
//  Created by Gilmar on 14/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import Foundation



struct MessageId:Codable {
    var session_id:String
    
    init(session_id:String){
    self.session_id = session_id
        
    }
}

class Message:Codable{
    
    var session_id:String
    var message: String
    
    init(session_id:String, message:String){
        self.session_id = session_id
        self.message = message
    }
}
