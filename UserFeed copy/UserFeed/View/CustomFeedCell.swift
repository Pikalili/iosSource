//
//  UserFeedCell.swift
//  UserFeed
//
//  Created by 杨墨犁 on 15/10/18.
//  Copyright © 2018 Moli Yang. All rights reserved.
//

import UIKit

protocol FeedCellDelegate {
    func didAddComment(cell: CustomFeedCell)
    func didViewAllComments(comments: [Comment])
}

class CustomFeedCell: UITableViewCell {
    
    var delegate : FeedCellDelegate?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var latestComment: UILabel!
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI() {
        profileImageView.image = post.createdBy.profileImage
        
        usernameLabel.text = post.createdBy.username
        
        followButton.layer.borderWidth = 1.0
        followButton.layer.cornerRadius = 2.0
        followButton.layer.borderColor = followButton.tintColor.cgColor
        followButton.layer.masksToBounds = true
        
        postImageView.image = post.image
        
        likesLabel.text = "♥ "+"\(post.numberOfLikes)"+" Likes"
        
        latestComment.text = post.comments.last?.body ?? "Be the first to add a comment!"
        
        timeAgoLabel.text = post.timeAgo + " ago"
    }
    
    @IBAction func addCommentButtonPressed(_ sender: UIButton) {
        delegate?.didAddComment(cell: self)
    }
    
    @IBAction func viewAllCommentsPressed(_ sender: UIButton) {
        delegate?.didViewAllComments(comments: post.comments)
    }
    
    @IBAction func addLikeButtonPressed(_ sender: UIButton) {
        post.addLike()
        likesLabel.text = "♥ "+"\(post.numberOfLikes)"+" Likes"
    }
    
}
