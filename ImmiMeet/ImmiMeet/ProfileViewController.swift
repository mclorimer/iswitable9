//
//  ProfileViewController.swift
//  ImmiMeet
//
//  Created by Marty Avedon on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var recs = ["Guy is the best guy.", "I love his hair!", "He's very friendly ;)"]
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userOrigin: UILabel!
    @IBOutlet weak var userLanguage: UILabel!
    @IBOutlet weak var userBlurb: UILabel!
    
    @IBOutlet weak var upVotes: UILabel!
    @IBOutlet weak var downVotes: UILabel!
    
    @IBOutlet weak var recTable: UITableView!
    
    var initWithUserMIA: (user: User, isMIA: Bool)? = nil
    
    func initWith(user: User, isMIA: Bool) {
    }
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let initWith = initWithUserMIA {
            self.recs = initWith.user.recommendations
            userPic.image = initWith.user.profileImage
            userName.text = initWith.user.user.username
            userLanguage.text = initWith.isMIA ? "Tamil" : "English"
            userBlurb.text = initWith.user.blurb
            self.recTable.reloadData()
            
            let doneButton = UIButton(type: .system)
            doneButton.setTitle("Done", for: .normal)
            self.view.addSubview(doneButton)
            
            doneButton.translatesAutoresizingMaskIntoConstraints = false
            doneButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16).isActive = true
            doneButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
            doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        }
    }

    // add a tableview datasource and delegate (extension?)
    func doneButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: UITableViewDelegate {

}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Rec", for: indexPath)
        let thisText = recs[indexPath.row]
        
        cell.textLabel?.text = "\"" + thisText + "\""

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recommendations"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = .blue
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightLight)
    }
}
