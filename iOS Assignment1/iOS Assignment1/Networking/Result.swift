//
//  Result.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
