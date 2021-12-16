//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 16/12/2021.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profilesArray: [ProfileModel] = []
    
    init() {
        getProfilesArray()
    }
    
    func getProfilesArray() {
        self.profilesArray.append(contentsOf: [
            
            ProfileModel(profileName: "ben", accountName: "Ben Chilwell", postsCount: 1, followersCount: 1_399_444, followingCount: 100, avatar: "ben", description: "I'm the best left wingback in the world", photos: ["ben"]),
            ProfileModel(profileName: "lisa", accountName: "Lisa from blackpink", postsCount: 3, followersCount: 1_000_000, followingCount: 5, avatar: "lisa1", description: "I'm Lisa from blackpink", photos: ["lisa1", "lisa2"])
        ])
    }
}
