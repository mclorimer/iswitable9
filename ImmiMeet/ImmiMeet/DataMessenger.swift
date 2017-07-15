//
//  DataMessenger.swift
//  ImmiMeet
//
//  Created by C4Q on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import Foundation

struct DataMessenger {
    private static let apiManager = APIRequestManager.manager
    static var userReceiver: UserReceiver!
    
    static func getUsers () {
        let file = Bundle.main.url(forResource: "data", withExtension: "json")!
        
        do {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let arrayOfDictionaries = json as! [[String: AnyObject]]
            let users = arrayOfDictionaries.map{ ProxyUser(withDictionary: $0)! }
            
            self.userReceiver.send(users: users)
            
        } catch {
            print("yall fucked up the json")
        }
    }
}

protocol UserReceiver {
    func send(users: [ProxyUser])
}
