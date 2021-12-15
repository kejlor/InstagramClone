//
//  StoryEntryModel.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 15/12/2021.
//

import Foundation

struct StoryEntryModel: Identifiable {
    let id = UUID()
    let nickName: String
    let avatar: String
}
