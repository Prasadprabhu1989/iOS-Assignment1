//
//  Constant.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 05/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
class Constants {
    static let baseUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    static let tableViewId = "TableViewId"
    static let httpContentType = "Content-Type"
    static let httpContentAccept = "Accept"
    static let plainText = "text/plain"
    static let httpGet = "GET"
    static let placeholderImage = "Placeholder"
    
}
extension Notification.Name {
    static let networkNotification = Notification.Name("Network Notification")
}
