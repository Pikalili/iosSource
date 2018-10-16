//
//  Post.swift
//  UserFeed
//
//  Created by 杨墨犁 on 15/10/18.
//  Copyright © 2018 Moli Yang. All rights reserved.
//

import UIKit

class Post
{
    var postId: Int
    var createdBy: User
    var timeAgo: String
    var image: UIImage
    var numberOfLikes: Int
    var comments: [Comment] = []
    
    init(postId: Int, createdBy: User, timeAgo: String, image: UIImage, numberOfLikes: Int) {
        self.postId = postId
        self.createdBy = createdBy
        self.timeAgo = timeAgo
        self.image = image
        self.numberOfLikes = numberOfLikes
    }
    
    func addLike() {
        //fake
        numberOfLikes += 1
    }
    
    static func retrievePosts() -> [Post]
    {
        
        var posts = [Post]()
        
        let zeo = User(username: "Zeo Li", profileImage: UIImage(named: "egg")!)
        let post1 = Post(postId: 0, createdBy: zeo, timeAgo: "1 hr", image: UIImage(named: "1")!, numberOfLikes: 12)
        let post2 = Post(postId: 1, createdBy: zeo, timeAgo: "3 hrs", image: UIImage(named: "2")!, numberOfLikes: 8)
        let post3 = Post(postId: 2, createdBy: zeo, timeAgo: "5 hrs", image: UIImage(named: "3")!, numberOfLikes: 8)
        let penny = User(username: "Penny Peng", profileImage: UIImage(named: "egg")!)
        let post4 = Post(postId: 3, createdBy: penny, timeAgo: "2 hrs", image: UIImage(named: "4")!, numberOfLikes: 94)
        let post5 = Post(postId: 4, createdBy: penny, timeAgo: "8 hrs", image: UIImage(named: "5")!, numberOfLikes: 99)
        let post6 = Post(postId: 5, createdBy: penny, timeAgo: "Yesterday", image: UIImage(named: "6")!, numberOfLikes: 9)
        
        posts.append(post1)
        posts.append(post4)
        posts.append(post2)
        posts.append(post5)
        posts.append(post3)
        posts.append(post6)
        
        return posts
    }
}
