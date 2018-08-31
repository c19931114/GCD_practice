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
    
    typealias CompletionHandler = (String?, Error?) -> Void
    
    func getName(completionHandler completion: @escaping CompletionHandler) {
        
        let nameURL: URL = URL(string: "https://stations-98a59.firebaseio.com/name.json")!
        
        Alamofire.request(nameURL, method: .get).validate().responseData { response in
            
            guard response.result.isSuccess else {
                let error = response.result.error
                completion(nil, error)
                return
            }
            guard let data = response.result.value else {
                let error = response.error //
                completion(nil, error)
                return
            }
            
            guard let utf8Text = String(data: data, encoding: .utf8) else { return }
            completion(utf8Text, nil)
        }
    }
    
    func getAddress(completionHandler completion: @escaping CompletionHandler) {
        
        let nameURL: URL = URL(string: "https://stations-98a59.firebaseio.com/address.json")!
        
        Alamofire.request(nameURL, method: .get).validate().responseData { response in
            
            guard response.result.isSuccess else {
                let error = response.result.error
                completion(nil, error)
                return
            }
            guard let data = response.result.value else {
                let error = response.error //
                completion(nil, error)
                return
            }
            
            guard let utf8Text = String(data: data, encoding: .utf8) else { return }
            completion(utf8Text, nil)
            
        }
        
    }
    
    func getHead(completionHandler completion: @escaping CompletionHandler) {
        
        let nameURL: URL = URL(string: "https://stations-98a59.firebaseio.com/head.json")!
        
        Alamofire.request(nameURL, method: .get).validate().responseData { response in
            
            guard response.result.isSuccess else {
                let error = response.result.error
                completion(nil, error)
                return
            }
            guard let data = response.result.value else {
                let error = response.error //
                completion(nil, error)
                return
            }
            
            guard let utf8Text = String(data: data, encoding: .utf8) else { return }
            completion(utf8Text, nil)
            
        }
        
    }

}
