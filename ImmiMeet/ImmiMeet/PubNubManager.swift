//
//  PubNubManager.swift
//  ImmiMeet
//
//  Created by Ana Ma on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import Foundation
import PubNub

class PubNubManager {
    
    let chatScreenVC = ChatScreenViewController()
    static let shared = PubNubManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var msgData : [PMessage] = [PMessage]()
    
    private init(){}
    
    func write(_ message: String) {
        guard let validClient = appDelegate.client else { return }
        let targetChannel = validClient.channels().last!
        validClient.publish(message, toChannel: targetChannel, compressed: false) { (publishStatus) in
            if !publishStatus.isError {
                self.msgData.append(PMessage(status: "sent", message: message))
                self.chatScreenVC.updateMessages()
                // Message successfully published to specified channel.
            }
            else {
                /**
                 Handle message publish error. Check 'category' property to find out
                 possible reason because of which request did fail.
                 Review 'errorData' property (which has PNErrorData data type) of status
                 object to get additional information about issue.
                 
                 Request can be resent using: publishStatus.retry()
                 */
            }
        }
    }
    
    func receive(_ message: String) {
        let pMsg = PMessage(status: "received", message: message)
        self.msgData.append(pMsg)
        
        chatScreenVC.updateMessages()
    }
    
}
