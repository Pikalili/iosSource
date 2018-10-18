//
//  Post.swift
//  UserFeed
//
//  Created by 杨墨犁 on 15/10/18.
//  Copyright © 2018 Moli Yang. All rights reserved.
//

import UIKit
import Kingfisher
import CoreLocation
import SwiftyJSON

class Post
{
    var id: String
    var createdBy: User
    var time: Date
    var imageUrl: URL
    var capture: String
    var numberOfLikes: Int
    var comments: [Comment] = []
    //var coordinate: [String:String]
    
    init(postId: String, createdBy: User, time: Date, imageUrl: String, numberOfLikes: Int, capture: String) {
        self.id = postId
        self.createdBy = createdBy
        self.time = time
        self.imageUrl = URL(string: imageUrl)!
        self.numberOfLikes = numberOfLikes
        self.capture = capture
        //self.coordinate = ["la":la, "lon":lon]
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
        
        let jsonString = "[{\"_id\" : \"5bc857f45132fb7cd94568cf\", \"label\" : \"this field shows labels, description : this is krisWu, freestyle!\", \"likes\" : 0, \"postBy\" : \"5bc617582d31652f4995dfcb\", \"image\" : \"https://upload.wikimedia.org/wikipedia/commons/5/58/Sunset_2007-1.jpg\", \"comments\" : [ ], \"createdAt\" : \"2018-10-18T09:52:52.757Z\", \"__v\" : 0}]"

        let jsonData = jsonString.data(using: .utf8)!
        let postsJSON : JSON = JSON(jsonData)
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//        let myFormatter = DateFormatter()
//        myFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        for i in 0..<postsJSON.count {
            let id = postsJSON[i]["_id"].stringValue
            let zeo = User(username: "Zeo Li")
            let capture = postsJSON[i]["label"].stringValue
            let numberOfLikes = postsJSON[i]["likes"].int!
            let postBy = postsJSON[i]["postBy"].stringValue
            let imageUrlString = postsJSON[i]["image"].stringValue
            
            print(postsJSON[i]["createdAt"].stringValue)

            let time : Date = isoFormatter.date(from: postsJSON[0]["createdAt"].stringValue)!
            
            var post : Post = Post(postId: id, createdBy: zeo, time: time, imageUrl: imageUrlString, numberOfLikes: numberOfLikes, capture: capture)
            posts.append(post)
        }
        
        return posts
    }
}
