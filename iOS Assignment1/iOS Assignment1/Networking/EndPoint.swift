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
        urlrequest.httpMethod = Constants.httpGet
        urlrequest.addValue(Constants.plainText, forHTTPHeaderField: Constants.httpContentType)
        urlrequest.addValue(Constants.plainText, forHTTPHeaderField: Constants.httpContentAccept)
        
        return urlrequest
    }
    var base : String {
        return Constants.baseUrl
    }
    
}

