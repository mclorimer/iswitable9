//
//  ProfileViewController.swift
//  ImmiMeet
//
//  Created by Marty Avedon on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userOrigin: UILabel!
    @IBOutlet weak var userLanguage: UILabel!
    @IBOutlet weak var userBlurb: UILabel!
    
    @IBOutlet weak var upVotes: UILabel!
    @IBOutlet weak var downVotes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
