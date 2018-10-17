//
//  Post.swift
//  UserFeed
//
//  Created by 杨墨犁 on 15/10/18.
//  Copyright © 2018 Moli Yang. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyJSON

class Post
{
    var postId: Int
    var createdBy: User
    var timeAgo: String
    var imageUrl: URL
    var numberOfLikes: Int
    var comments: [Comment] = []
    
    init(postId: Int, createdBy: User, timeAgo: String, imageUrl: String, numberOfLikes: Int) {
        self.postId = postId
        self.createdBy = createdBy
        self.timeAgo = timeAgo
        self.imageUrl = URL(string: imageUrl)!
        self.numberOfLikes = numberOfLikes
    }
    
//    init(json : JSON) {
//        
//    }
    
    func addLike() {
        //fake
        numberOfLikes += 1
    }
    
    static func retrievePosts() -> [Post]
    {
        
        
        var posts = [Post]()
        
//        let url = URL(string: "url_of_your_image")
//        var imageView = UIImage()
//        imageView.kf.setImage(with: url)
        
        let imageUrlString = "https://upload.wikimedia.org/wikipedia/commons/5/58/Sunset_2007-1.jpg"
        
        let zeo = User(username: "Zeo Li")
        let post1 = Post(postId: 0, createdBy: zeo, timeAgo: "1 hr", imageUrl: imageUrlString, numberOfLikes: 12)
        let post2 = Post(postId: 1, createdBy: zeo, timeAgo: "3 hrs", imageUrl: imageUrlString, numberOfLikes: 8)
        let post3 = Post(postId: 2, createdBy: zeo, timeAgo: "5 hrs", imageUrl: imageUrlString, numberOfLikes: 8)
        let penny = User(username: "Penny Peng")
        let post4 = Post(postId: 3, createdBy: penny, timeAgo: "2 hrs", imageUrl: imageUrlString, numberOfLikes: 94)
        let post5 = Post(postId: 4, createdBy: penny, timeAgo: "8 hrs", imageUrl: imageUrlString, numberOfLikes: 99)
        let post6 = Post(postId: 5, createdBy: penny, timeAgo: "Yesterday", imageUrl: imageUrlString, numberOfLikes: 9)
        
        posts.append(post1)
        posts.append(post4)
        posts.append(post2)
        posts.append(post5)
        posts.append(post3)
        posts.append(post6)
        
        return posts
    }
}
