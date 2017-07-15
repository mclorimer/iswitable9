//
//  ProxyUser.swift
//  ImmiMeet
//
//  Created by C4Q on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import Foundation

class ProxyUser {
    let id: Int
    let name: String
    let username: String
    let email: String
    let immigrant: Bool
    
    init (id: Int, name: String, username: String, email: String, immigrant: Bool) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.immigrant = immigrant
    }
    
    convenience init?(withDictionary dict: [String: AnyObject]) {
        if let id = dict["id"] as? Int,
            let name = dict["name"] as? String,
            let username = dict["username"] as? String,
            let email = dict["email"] as? String,
            let immigrant = dict["is_immigrant"] as? Bool
        {
            self.init(id: id, name: name, username: username, email: email, immigrant: immigrant)
        } else {
            return nil
        }
    }
}
