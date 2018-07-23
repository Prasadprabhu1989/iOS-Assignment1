//
//  ListViewModel.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation

class ListViewModel {
    private let client = ListAPIClient()
    var lists : List?
    
    func fetchData(listFeed : ListFeed, completion : @escaping (Result<ListViewModel?, APIError>) -> Void) {
        client.getList(list: listFeed) { [weak self] (results) in
            switch results {
            case .success(let feeds):
                if feeds != nil {
                    self?.lists = feeds
                    self?.removeEmptyList()
                      completion(.success(self))
                }
              
                
                break
            
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func getDescription(indexPath : IndexPath) -> Rows? {
        if let row = lists?.rows?[indexPath.row]{
            return row
        }
        return nil
    }
    func removeEmptyList() {
        let arrayWithNoOptionals = lists?.rows?.filter{ $0.title != nil   }.map {$0 }
        lists?.rows = arrayWithNoOptionals
        
    }
    
    
   
    
}
