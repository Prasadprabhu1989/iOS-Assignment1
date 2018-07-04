//
//  EndPoint.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation

protocol EndPoint {
    var base : String { get}

}
enum ListFeed {
    case listFeed
}
extension ListFeed : EndPoint {
   
    var urlComponents : URLComponents {
        let components = URLComponents(string: base)!

        return components
    }

    var request : URLRequest {
        let url = urlComponents.url!
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = "GET"
        
        return urlrequest
    }
    var base : String {
        return "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    }
    
}

