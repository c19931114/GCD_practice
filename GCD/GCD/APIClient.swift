//
//  APIClient.swift
//  GCD
//
//  Created by Crystal on 2018/8/31.
//  Copyright © 2018年 Crystal. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    let decoder = JSONDecoder()
    typealias CompletionHandler = (String?, Error?) -> Void
    
    func getName(completionHandler completion: @escaping CompletionHandler) {
        
        let nameURL: URL = URL(string: "https://stations-98a59.firebaseio.com/name.json")!
        
        
        
    }

}
