//
//  FirstView.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit

class FirstView: UIView {
    var tableView : UITableView

    override init(frame: CGRect) {
        tableView = UITableView()
        super.init(frame: frame)
      
        addSubview(tableView)
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(TableViewListCell.self, forCellReuseIdentifier: "TableViewId")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = self.layoutMarginsGuide
        tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension UIImageView {
    func loadFromUrl(url : URL?, completion :@escaping (UIImage?) -> Void)  {
        if let imageUrl = url {
            let task = URLSession.shared.dataTask(with: imageUrl) { (responseData, response, error) in
                if let data = responseData {
                    // execute in UI thread
                    DispatchQueue.main.async {
                        completion(UIImage(data: data))
                    }
//
                }
                else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }
            task.resume()
        }
      
    }
}
