//
//  Comment.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import Foundation

class Comment {
    var user: String
    var content: String
    
    init(user: String, content: String) {
        self.user = user
        self.content = content
    }
}
