//
//  ViewController.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ListViewModel()
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
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.estimatedRowHeight = 60
        let stringFile = Bundle.main.path(forResource: "Test", ofType: "doc")
        do {
            let data = try Data.init(contentsOf: URL(fileURLWithPath: stringFile!))
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                
            } catch {
                print("error")
                
            }
            
        }
        catch {
            print("error")
        }
        mainView.tableView.rowHeight = UITableViewAutomaticDimension
        let session = URLSession(configuration: config)
        let task =   session.dataTask(with: URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts")!) { (data, response, error) in
            if let datas = data {
//                do {
//
//                    let genericModel = try JSONDecoder().decode(List.self, from: datas)
//
//
//                } catch {
//
//
//                }
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: datas, options: .mutableContainers)
                    
                    
                } catch {
                    print("error")
                    
                }
            } else {
//                completion(nil, .invalidData)
            }
        }
        task.resume()
//        viewModel.fetchData(listFeed: .listFeed) { (results) in
//
//        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewId", for: indexPath) as! TableViewListCell
        cell.descriptionLabel.text = "tttttttttssdgasdgasdgasdg32428342093402834-283-408234-82345-23845823-52-35230582358238528=35283=58=28=358=8=238=58=2358=asdasdasdasdadsasddsdadsdadadsass22222"
        cell.titleLabel.text = "dvaksdfdfsfasdfsdfsdfasdf"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

