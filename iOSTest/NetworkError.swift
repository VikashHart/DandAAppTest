//
//  NetworkError.swift
//  iOSTest
//
//  Created by C4Q on 10/28/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case networkError
    case clientError
    case serverError
    case unknownError
}
