//
//  CompletePostModel.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 15/12/2021.
//

import Foundation

class CompletePostModel {
    let id = UUID()
    let nickName: String
    let avatar: String
    let postedImages: [String]
    var isLiked = false
    var isBookmarked = false
    
    init(nickName: String, avatar: String, postedImages: [String]) {
        self.nickName = nickName
        self.avatar = avatar
        self.postedImages = postedImages
    }
}
