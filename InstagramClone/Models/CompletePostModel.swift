//
//  CompletePostModel.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 15/12/2021.
//

import Foundation

struct CompletePostModel {
    let id: UUID
    let nickName: String
    let avatar: String
    let postedImages: [String]
    let isLiked: Bool
    let isBookmarked: Bool
    
    init(id: UUID = UUID(), nickName: String, avatar: String, postedImages: [String], isLiked: Bool = false, isBookmarked: Bool = false) {
        self.id = id
        self.nickName = nickName
        self.avatar = avatar
        self.postedImages = postedImages
        self.isLiked = isLiked
        self.isBookmarked = isBookmarked
    }
    
    func updateLike() -> CompletePostModel {
        return CompletePostModel(id: id, nickName: nickName, avatar: avatar, postedImages: postedImages, isLiked: !isLiked, isBookmarked: isBookmarked)
    }
    
    func updateBookmarked() -> CompletePostModel {
        return CompletePostModel(id: id, nickName: nickName, avatar: avatar, postedImages: postedImages, isLiked: isLiked, isBookmarked: !isBookmarked)
    }
}
