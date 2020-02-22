//
//  MainVC.swift
//  mdbMidway
//
//  Created by Colin Zhou on 2020-02-22.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit
import Firebase

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupArrayOfPosts()
        // Do any additional setup after loading the view.
    }
    
    var arrayOfPosts: [Post]!
    
    func setupArrayOfPosts() {
        
        let db = Database.database().reference()
        let usersNode = db.child("posts")
        postsNode.observeSingleEvent(of: .value) { (snapshot) in
            guard let postsDict = snapshot.value as? [String: [String: String]] else {
                print("friends error")
                return
            }
            for( userId, _) in postDict {
                guard let userInfoDict = userDict[userId] else {
                    print("friends error 2")
                    return
                }
                self.friendsList.append(userInfoDict["name"]!)
                
            }
            self.tableView.reloadData()
        }
        
        arrayOfPosts = []
        let imageUrl : [String] = db.images
        let names : [String] = db.names
        let captions : [Date] = db.captions
        for i in 0 ..< imageNames.count {
            let si = Post(name: name[i], caption: captions[i], image: UIImage(named: imageNames[i])!)
            arrayOfPosts.append(si)
        }
    }

}
