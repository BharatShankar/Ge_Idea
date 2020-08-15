//
//  Httpconstant.swift
//  D911 Agency
//
//  Created by Bharat Shankar on 05/02/20.
//  Copyright © 2020 Bharat Shankar. All rights reserved.
//

import Foundation

struct Api {
    static let baseURL = "https://rss.itunes.apple.com/api/"
 
    struct itemData {
        static let explicit = "v1/sa/ios-apps/top-free/all/100/explicit.json"
    }
    
   
}

struct HttpError{
    static let noInternet = "Please check your internet connection"
    static let apiConnection = "Check api Method, network connetion , this error from app side only"
    static let serverError = "Api server Error , Check with backend Geeks"
    static let somthingWentWrong = "SomeThing Went Wrong"
}


extension Int{
    func isResponseOK() -> Bool{
        return (200...299).contains(self)
    }
}
