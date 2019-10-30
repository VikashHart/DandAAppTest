//
//  HTTPUrlResponseError.swift
//  iOSTest
//
//  Created by C4Q on 10/28/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

enum HTTPStatus {
    case ok
    case redirect
    case error(NetworkError)
}

extension HTTPURLResponse {
    var apiError: NetworkError? {
        switch statusCode {
        case 100...199:
            return .networkError
        case 200...299:
            return nil
        case 300...399:
            return nil
        case 400...499:
            return .clientError
        case 500...599:
            return .serverError
        default:
            return nil
        }
    }
}
