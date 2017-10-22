//
//  Article.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import Foundation

class Article {
    var title: String
    var url: String
    var source: String
    var fakeVotes: Int
    var realVotes: Int
    var wiki: String
    var comments: Array<Comment>
    
    init(title: String, url: String, source: String, fakeVotes: Int, realVotes: Int, wiki: String, comments: Array<Comment>) {
        self.title = title
        self.url = url
        self.source = source
        self.fakeVotes = fakeVotes
        self.realVotes = realVotes
        self.wiki = wiki
        self.comments = comments
    }
}
