//
//  List.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
struct List : Decodable {
    var title : String?
    var rows : [Rows]?
    enum CodingKeys : String, CodingKey {
        case title = "title"
        case rows = "rows"
       
    }
    
}
struct Rows : Decodable {
    var title : String?
    var description : String?
    var imageHref : URL?
    enum CodingKeys : String, CodingKey {
        case title = "title"
        case description = "description"
        case imageHref = "imageHref"
        
    }
}
