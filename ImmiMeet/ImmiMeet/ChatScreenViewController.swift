//
//  ChatScreenViewController.swift
//  ImmiMeet
//
//  Created by Ana Ma on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import UIKit


class ChatScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var msgData = [PMessage]()
    
    @IBOutlet weak var chatScreenTableView: UITableView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.msgData = PubNubManager.shared.msgData

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.msgData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.msgData[indexPath.row].status == "received" {
            let receiveMessageCell = tableView.dequeueReusableCell(withIdentifier: "receiveMessageCellID") as! ReceiveTableViewCell
            return receiveMessageCell
        } else{
            let sentMessageCell = tableView.dequeueReusableCell(withIdentifier: "sentMessageCellID") as! SentMessageTableViewCell
            return sentMessageCell
        }
    }
    
    func updateMessages() {
        self.chatScreenTableView.reloadData()
    }
    
    @IBAction func sendTapped(_ sender: UIButton) {
        guard let validText = self.messageTextField.text else { return }
        PubNubManager.shared.write(validText)
    }
    
}
