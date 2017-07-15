//
//  DiscoveryViewController.swift
//  ImmiMeet
//
//  Created by C4Q on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController, UserReceiver {

    var users = [ProxyUser]()
    
    @IBOutlet weak var discoveryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        discoveryTableView.dataSource = self
        discoveryTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func send(users: [ProxyUser]) {
        self.users = users
    }

}

extension DiscoveryViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        
        let currentUser = self.users[indexPath.row]
        
        cell.set(user: currentUser)
//        cell.imageView?.image = UIImage(named: "\(arc4random_uniform(10))")
//        cell.imageView?.contentMode = .scaleAspectFit
        
        cell.profileImageView.image = UIImage(named: "\(currentUser.id % 10)")
        cell.profileImageView.contentMode = .scaleAspectFit
        
        return cell
    }
}
