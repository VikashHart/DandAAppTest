//
//  EndpointBuilder.swift
//  iOSTest
//
//  Created by C4Q on 10/28/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

enum EndpointType: String {
    case chat = "chat_log.php"
    case login = "login.php"
}

struct EndpointBuilder {
    static private let baseUrl = "http://dev.datechnologies.co/Tests/scripts/"
    
    static func buildChatEndpoint() -> URL {
        return URL(string: baseUrl + EndpointType.chat.rawValue)!
    }
    
    static func buildLoginEndpoint(with email: String, password: String) -> URL {
        let url = baseUrl + EndpointType.login.rawValue
        let components = URLComponents(string: url)!
        
        return components.url!
    }
}
