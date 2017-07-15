//
//  User.swift
//  ImmiMeet
//
//  Created by Victor Zhong on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import Foundation

class User {
    var id: Int
    var userName: String
    var profileImage: String
    var blurb: String
    var location: String
    var origin: String
    var recommendations: [String]
    
    init(
        id: Int,
        userName: String,
        profileImage: String,
        blurb: String,
        location: String,
        origin: String,
        recommendations: [String]
        ) {
        self.id = id
        self.userName = userName
        self.profileImage = profileImage
        self.blurb = blurb
        self.location = location
        self.origin = origin
        self.recommendations = recommendations
    }
    
    convenience init() {
        self.init(
            id: 0,
            userName: "",
            profileImage: "",
            blurb: "",
            location: "",
            origin: "",
            recommendations: []
        )
    }
}
