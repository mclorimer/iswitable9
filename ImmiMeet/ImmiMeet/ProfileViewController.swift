//
//  ProfileViewController.swift
//  ImmiMeet
//
//  Created by Marty Avedon on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var recs = [String]()
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userOrigin: UILabel!
    @IBOutlet weak var userLanguage: UILabel!
    @IBOutlet weak var userBlurb: UILabel!
    
    @IBOutlet weak var upVotes: UILabel!
    @IBOutlet weak var downVotes: UILabel!
    
    @IBOutlet weak var recTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // grab the correct user pic, name, origin, language, blurb, up/down votes from user object
        
        recTable.dataSource = self
        recTable.delegate = self
        recTable.register(UITableViewCell.self, forCellReuseIdentifier: "Rec")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // style user pic once we grab it
        
        userPic.layer.borderWidth = 2
        userPic.layer.borderColor = UIColor.black.cgColor
        userPic.layer.cornerRadius = 64
        userPic.clipsToBounds = true
    }

    // add a tableview datasource and delegate (extension?)
    
}

extension ProfileViewController: UITableViewDelegate {

}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
