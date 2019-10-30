//
//  MessageModel.swift
//  iOSTest
//
//  Created by C4Q on 10/28/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

struct MessagesModel: Codable {
    let data: [MessageModel]
}

struct MessageModel: Codable {
    let user_id: String
    let name: String
    let avatar_url: String
    let message: String
}
