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
    reachability = Reachability(hostname: Constants.baseUrl)
    
        do {
            try? reachability?.startNotifier()
            NotificationCenter.default.addObserver(self, selector:#selector(checkNetwork(_note:)) , name: .reachabilityChanged, object: nil)
       
        }
       
    }
    @objc func checkNetwork(_note : Notification)  {
        let reachabilityStatus = _note.object as! Reachability
        
        reachabilityStatus.whenUnreachable = { _ in
            NotificationCenter.default.post(name: .networkNotification, object: nil)
        }
        
    }
}
