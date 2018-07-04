//
//  APIClient.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
class ListAPIClient : APIClient {
    var session: URLSession
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    func getList(list : ListFeed, completion : @escaping (Result<List? , APIError>) -> Void){
     let mthod = list
        let  request = mthod.request
        fetch(with: request, decode: { json -> List? in
            guard let listResult = json as? List else { return  nil }
            return listResult
        }, completion: completion)
        
    }
    
    
}
