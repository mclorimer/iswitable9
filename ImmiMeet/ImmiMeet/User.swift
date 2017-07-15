//
//  User.swift
//  ImmiMeet
//
//  Created by Victor Zhong on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import Foundation
import UIKit

enum BogusUser {
    case one, two
}

class User {
    var user: ProxyUser
    var profileImage: UIImage
    var blurb: String
    var location: String
    var origin: String
    var recommendations: [String]
    var messageHistory: [PMessage] = []
    
    init(
        user: ProxyUser,
        profileImage: UIImage,
        blurb: String,
        location: String,
        origin: String,
        recommendations: [String]
        ) {
        self.user = user
        self.profileImage = profileImage
        self.blurb = blurb
        self.location = location
        self.origin = origin
        self.recommendations = recommendations
    }
    
    convenience init(with user: ProxyUser, image: UIImage, number: BogusUser) {
        switch number {
        case .one:
            self.init(user: user, profileImage: image, blurb: "i fly like paper get high like planes", location: "London, Arkansas", origin: "Londond England", recommendations: ["Wears wonderful hats", "singer!"])
        case .two:
            self.init(user: user, profileImage: image, blurb: "excuse me while I kiss the sky", location: "New York City, NY", origin: "Seattle, Washington", recommendations: ["Plays guitar", "strong, almost religious zeal for peace and love in humanity"])
        }
    }
    
}
