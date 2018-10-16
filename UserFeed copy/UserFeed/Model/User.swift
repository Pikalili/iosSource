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
    var profileImage: UIImage = UIImage(named: "egg")!
    
    init(username: String, profileImage: UIImage) {
        self.username = username
        self.profileImage = profileImage
    }
    
    init(username: String) {
        self.username = username
    }
}
