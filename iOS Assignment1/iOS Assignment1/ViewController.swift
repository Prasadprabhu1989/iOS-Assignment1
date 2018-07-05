//
//  ViewController.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    var viewModel  = ListViewModel()
    let config = URLSessionConfiguration.default
    
//    let session = URLSession()
 private var mainView: FirstView {
    return view as! FirstView
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func loadView() {
        view = FirstView()
        mainView.delegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.estimatedRowHeight = 60
        mainView.tableView.rowHeight = UITableViewAutomaticDimension
        mainView.showLoadingIndicator()
        callList()
       NetworkChecker.sharedManager.checkInternet()
        
        
        
        
    }
    func callList() {
        viewModel.fetchData(listFeed: .listFeed) { [weak self] (results) in
            switch results {
            case .success(let lists):
                self?.viewModel = lists!
                self?.navigationItem.title = self?.viewModel.lists?.title
                self?.mainView.refreshControl.endRefreshing()
                self?.mainView.hideLoadingIndicator()
                self?.mainView.tableView.reloadData()
                break
                
            case .failure(let error):
                self?.showAlert(error: error)
                break
                
                
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showAlert(error : Error) {
        let alertController = UIAlertController(title: "Error", message: error as? String, preferredStyle: .alert)
        self.present(alertController, animated: false, completion: nil)
    }

}
extension ViewController : UITableViewDelegate,UITableViewDataSource,viewProtocol{
    func refreshTableView() {
        callList()
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewId", for: indexPath) as! TableViewListCell
        let row  : Rows = viewModel.getDescription(indexPath: indexPath)
        cell.descriptionLabel.text = row.description
        cell.photoImageView.sd_setImage(with: row.imageHref) { (image, error, cachacr, url) in
            
            cell.setNeedsDisplay()
            
        }
        
        cell.titleLabel.text = row.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rows =  viewModel.lists?.rows {
            return rows.count
        }
       
        
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}


