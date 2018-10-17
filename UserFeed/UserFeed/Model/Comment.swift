//
//  Comment.swift
//  UserFeed
//
//  Created by 杨墨犁 on 16/10/18.
//  Copyright © 2018 Moli Yang. All rights reserved.
//

import Foundation

class Comment {
    var username: String
    var time: Date
    var body: String
    
    init(username: String, body: String) {
        self.username = username
        time = Date()
        self.body = body
    }
}
