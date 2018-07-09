//
//  FirstView.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit
protocol viewProtocol {
      func refreshTableView()
}
class FirstView: UIView {
    weak var delegate : viewProtocol?
    var loadingIndicator : UIActivityIndicatorView
    var tableView : UITableView
    
    //instantiate refresh control
    lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.black
        return refreshControl
    }()

    override init(frame: CGRect) {
        tableView = UITableView()
        loadingIndicator = UIActivityIndicatorView()
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
        tableView.addSubview(refreshControl)

        loadingIndicator.color = UIColor.black
        addSubview(loadingIndicator)
       
        let loadingIndicatorMargin = self.layoutMarginsGuide
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: loadingIndicatorMargin.centerXAnchor, constant: 0).isActive = true
        
        loadingIndicator.centerYAnchor.constraint(equalTo: loadingIndicatorMargin.centerYAnchor, constant: 0).isActive = true

        
    }
    // Pull to refresh
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
         refreshControl.beginRefreshing()
        delegate?.refreshTableView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //show tableview
    func showView()  {
        tableView.isHidden = false
    }
    //show loading indicator
    func showLoadingIndicator()
    
    {
        tableView.isHidden = true
        loadingIndicator.startAnimating()

        
    }
     //hide loading indicator
    func hideLoadingIndicator() {
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.stopAnimating()
        showView()
    }
}

