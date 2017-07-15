//
//  Message.swift
//  ImmiMeet
//
//  Created by Ana Ma on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import Foundation

class PMessage {
    var status: String
    var message: String
    
    init(status: String, message: String) {
        self.status = status
        self.message = message
    }
    
    convenience init(withDictionary dict : [String: String]) {
        let status = dict["status"]!
        let message = dict["message"]!
        
        self.init(status: status, message: message)
    }
}
