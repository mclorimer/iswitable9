//
//  DiscoveryViewController.swift
//  ImmiMeet
//
//  Created by C4Q on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController {

    var users = [User]()
    
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
        
        
        
        return cell
    }
}
