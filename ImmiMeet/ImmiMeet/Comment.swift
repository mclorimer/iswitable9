//
//  Comment.swift
//  ImmiMeet
//
//  Created by Victor Zhong on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import Foundation

class Comment {
    var id: Int
    var translated: Bool
    var originalString: String
    var translatedString: String
    var originaLanguage: String
    var targetLanguage: String
    var authorID: Int
    
    init(
        id: Int,
        translated: Bool,
        originalString: String,
        translatedString: String,
        originaLanguage: String,
        targetLanguage: String,
        authorID: Int
        ) {
        self.id = id
        self.translated = translated
        self.originalString = originalString
        self.translatedString = translatedString
        self.originaLanguage = originaLanguage
        self.targetLanguage = targetLanguage
        self.authorID = authorID
    }
    
    convenience init() {
        self.init(
            id: 0,
            translated: false,
            originalString: "",
            translatedString: "",
            originaLanguage: "",
            targetLanguage: "",
            authorID: 0
        )
    }
}
