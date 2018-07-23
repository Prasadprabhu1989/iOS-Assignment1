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
    init(session : URLSession = .shared) {
        self.session = session
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    //api method
    func getList(list : ListFeed, completion : @escaping (Result<List? , APIError>) -> Void){
     let mthod = list
        let  request = mthod.request
        fetch(with: request, decode: { json -> List? in
            guard let listResult = json as? List else { return  nil }
            return listResult
        }, completion: completion)
        
    }
    
    
}
class URLSessionDataTaskMock : URLSessionDataTask{
    private let closure: () -> Void
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
  
    var data: Data?
    var error: Error?
    var lastUrl : URL?
    override func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
        ) -> URLSessionDataTask {
        let data = self.data
        let error = self.error
        lastUrl = url
        return URLSessionDataTaskMock {
            completionHandler(data, nil, error)
        }
    }
}
