//
//  APIManager.swift
//  Translate
//
//  Created by Local User on 6/1/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    class func getLanguages()
    {
        DispatchQueue.global(qos: .userInitiated).async {
            Alamofire.request("\(Constants.API_URL)languages", method: .get, parameters: nil, encoding: URLEncoding.default, headers: [Constants.API_HEADER_KEY: Constants.API_KEY]).responseJSON{ (response) in
                switch response.result
                {
                case .success:
                    if let dictionary = response.result.value as? [String:AnyObject]
                    {
                        createLanguagesAvailableAnswer(dictionary: dictionary[Constants.LANGUAGE_KEY] as! [String : AnyObject])
                    }
                    break
                case .failure(let error):
                    print("Error\(error)")
                    sendErrorNotification()
                    break
                }
            }
        }
    }
    
    class func createLanguagesAvailableAnswer(dictionary: [String:AnyObject])
    {
        var languagesArray = [[String: String]]()
        for (key,value) in dictionary {
            if let value = value as? String
            {
                let dictionaryWithNewFormat = [Constants.DIRS_KEY: key, Constants.LANGUAGE_KEY: value]
                languagesArray.append(dictionaryWithNewFormat)
            }
            else
            {
                sendErrorNotification()
                return
            }
        }
        languagesArray = languagesArray.sorted { $0[Constants.LANGUAGE_KEY]! < $1[Constants.LANGUAGE_KEY]! }
        let result = [Constants.LANGUAGE_KEY: languagesArray]
        DispatchQueue.main.async {
            NotificationCenter.default.post(name : Notification.Name(Constants.GET_LANGUAGES_NOTIFICATION), object: nil, userInfo: result)
        }
    }
    
    class func sendErrorNotification()
    {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
        }
    }
    
    class func createTranslate(originLanguage: String, destinationLanguage: String, textToTranslate: String, completion: @escaping(_ textTranslated: String?) -> Void )
    {
        DispatchQueue.global(qos: .userInitiated).async {
            let urlString = generateURLToTranslate(originLanguage: originLanguage, destinationLanguage: destinationLanguage, textToTranslate: textToTranslate)
            Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: [Constants.API_HEADER_KEY : Constants.API_KEY]).responseJSON{(response) in
                switch response.result{
                case .success:
                    if let dictionary = response.result.value as? [String: AnyObject], let textTranslatedArray = dictionary[Constants.TEXT_TRANSLATED_KEY] as? [String], let textTranslated = textTranslatedArray.first
                    {
                        completion(textTranslated)
                    }
                    else
                    {
                        completion(nil)
                    }
                    break
                case .failure:
                    completion(nil)
                }
            }
        }
    }
    
    class func generateURLToTranslate(originLanguage: String, destinationLanguage: String, textToTranslate: String) -> String
    {
        let urlString = "\(Constants.API_URL)translate/\(originLanguage)/\(destinationLanguage)/\(textToTranslate)"
        return  urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)!
    }
}
