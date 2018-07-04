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
    let lists = List()
    
    func fetchData(listFeed : ListFeed, completion : @escaping (Result<ListViewModel?, APIError>) -> Void) {
        client.getList(list: listFeed) { [weak self] (results) in
            switch results {
            case .success(let feeds):
                
                break
            
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
