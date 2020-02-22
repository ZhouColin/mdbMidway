//
//  Post.swift
//  mdbMidway
//
//  Created by Colin Zhou on 2020-02-22.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

class Post {
    
    var image: UIImage
    var name: String
    var caption: String
    
    init(name: String, caption: String, image: UIImage) {
        self.image = image
        self.name = name
        self.caption = caption
    }

}
