//
//  APIRequestManager.swift
//  ImmiMeet
//
//  Created by Victor Zhong on 7/15/17.
//  Copyright © 2017 ImmiMeet118118. All rights reserved.
//

import Foundation

class APIRequestManager {
    
    static let manager = APIRequestManager()
    private init() {}
    
    func getData(endPoint: String, callback: @escaping (Data?) -> Void) {
        guard let myURL = URL(string: endPoint) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: myURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error during session: \(error)")
            }
            guard let validData = data else { return }
            callback(validData)
            }.resume()
    }
    
    // https://translation.googleapis.com/language/translate/v2?key=AIzaSyC7z1krJr3uHoqLoshDxKVD67SvXHiTHF8
    
    //    func translateThis(stringToTranslate: String, language: String, authorID: Int, id: Int) {
    func translateThis(_ comment: Comment) -> Comment {
        let translateURL = URL(string: "https://translation.googleapis.com/language/translate/v2?key=AIzaSyC7z1krJr3uHoqLoshDxKVD67SvXHiTHF8")!
        
        var placeholderComment: Comment?
        var request = URLRequest(url: translateURL)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        guard let languageCode = LanguageCode.languageInput[comment.targetLanguage] else {
            return comment
        }
        
        let bodyDict: [String : String] = [
            "q" : comment.originalString,
            "target" : languageCode,
            ]
        
        do {
            let bodyData: Data = try JSONSerialization.data(withJSONObject: bodyDict, options: [])
            
            request.httpBody = bodyData
        }
        catch {
            print("Error converting to data: \(error)")
        }
        
        let session: URLSession = URLSession(configuration: .default)
        session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print(error!)
            }
            
            if data != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                    
                    guard let data = json!["data"] as? [String : Any],
                        let translations = data["translations"] as? [String : Any],
                        let translatedText = translations["translatedText"] as? String else { return }
                    
                    placeholderComment = Comment(id: comment.id, translated: true, originalString: comment.originalString, translatedString: translatedText, originaLanguage: comment.originalString, targetLanguage: comment.targetLanguage, authorID: comment.authorID)
                    print(placeholderComment ?? "Nope!")
                }
                    
                catch {
                    print("Error serializing: \(error)")
                }
            }
            }.resume()
        
        return placeholderComment ?? comment
    }
}
