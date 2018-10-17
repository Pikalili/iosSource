//
//  User.swift
//  UserFeed
//
//  Created by 杨墨犁 on 15/10/18.
//  Copyright © 2018 Moli Yang. All rights reserved.
//

import UIKit

class User
{
    //var userId: Int
    var username: String
    var profileImageUrl: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/58/Sunset_2007-1.jpg")! //Default image
    
    init(username: String, imageUrl: String) {
        self.username = username
        self.profileImageUrl = URL(string: imageUrl) ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/58/Sunset_2007-1.jpg")!
    }
    
    init(username: String) {
        self.username = username
    }
    
}
