//
//  NetworkChecker.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 05/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
import Reachability

class NetworkChecker {
   static let sharedManager = NetworkChecker()
     var reachability = Reachability()
    func checkInternet()  {
    
         NotificationCenter.default.addObserver(self, selector:#selector(checkNetwork(_note:)) , name: .reachabilityChanged, object: reachability)
    
        do {
             try? reachability?.startNotifier()
        }
       
    }
    
    @objc func checkNetwork(_note : Notification)  {
        let reachabilityStatus = _note.object as! Reachability
        if reachabilityStatus.connection == .none {
             NotificationCenter.default.post(name: .networkNotification, object: nil)
        }   
    }
}
