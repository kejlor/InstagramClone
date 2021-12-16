//
//  ProfileModel.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 16/12/2021.
//

import Foundation

struct ProfileModel: Identifiable {
    let id = UUID()
    let profileName: String
    let accountName: String
    let postsCount: Int
    let followersCount: Int
    let followingCount: Int
    let avatar: String
    let description: String
    let photos: [String]
}
