//
//  ViewController.swift
//  UserFeed
//
//  Created by 杨墨犁 on 15/10/18.
//  Copyright © 2018 Moli Yang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UserFeedViewController: UITableViewController {

    var posts: [Post]?
    var comments : [Comment] = []
    
    @IBOutlet var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TODO: Register my FeedCell.xib file here:
        feedTableView.register(UINib(nibName: "CustomFeedCell", bundle: nil), forCellReuseIdentifier: "customFeedCell")
        
        //configurationTableView()
        retrievePosts()
        //feedTableView.reloadData()
    }

    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customFeedCell", for: indexPath) as! CustomFeedCell
        
        cell.post = self.posts?[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = .none
        cell.delegate = self
        print("set delegate!")
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //TODO: Declare configureTableView here:
    func configurationTableView() {
        feedTableView.rowHeight = 600.0
        feedTableView.separatorColor = UIColor.clear
    }
    
    //TODO: retrieve posts here:
    func retrievePosts() {
        posts = Post.retrievePosts()
        configurationTableView()
        feedTableView.reloadData()
    }

    func retievePostData(url: String, parameters: [String: String]) {
        /*Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success! Got the posts data")
                
                let postsJSON : JSON = JSON(response.result.value!)
                self.updatePostsData(json: postsJSON)
                
            } else {
                print("Error \(response.result.error)")
            }
        }*/
    }
    
    //TODO: ParseJSON
    func updatePostsData(json: JSON) {
        for item in json {
            
        }
    }
    
    @IBAction func sortByButtonPressed(_ sender: Any) {
        let sortSheetAlert = UIAlertController(title: "Select sorted by", message: "time or location?", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let time = UIAlertAction(title: "Time", style: .default) { (action) in
            self.retrievePosts()
            print("sorted by time")
        }
        let location = UIAlertAction(title: "Location", style: .default) { (action) in
            self.retrievePosts()
            print("sorted by location")
        }
        
        sortSheetAlert.addAction(time)
        sortSheetAlert.addAction(location)
        sortSheetAlert.addAction(cancel)
        
        self.present(sortSheetAlert, animated: true, completion: nil)
        
    }
    
}

extension UserFeedViewController: FeedCellDelegate {
    
    func didAddComment(cell: CustomFeedCell) {
        print("delegate!")
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Comment", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Comment", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            cell.post.comments.append(Comment(username: "Molin", body: textField.text ?? "new comment"))
            cell.updateUI()
        }
        
        alert.addTextField { (alartTextField) in
            alartTextField.placeholder = "Create new comment"
            textField = alartTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func didViewAllComments(comments: [Comment]) {
        self.comments = comments
        performSegue(withIdentifier: "goToAllComments", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAllComments" {
            let destinationVC = segue.destination as! AllCommentsViewController
            destinationVC.comments = comments
            //print("\(destinationVC.comments)")
        }
    }
}

