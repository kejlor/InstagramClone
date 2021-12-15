//
//  StoryEntryViewModel.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 15/12/2021.
//

import Foundation

class StoryEntryViewModel: ObservableObject {
    @Published var storyEntriesArray: [StoryEntryModel] = []
    
    init() {
        getStoryEntries()
    }
    
    func getStoryEntries() {
        self.storyEntriesArray.append(contentsOf: [
            StoryEntryModel(nickName: "best_left_wingback", avatar: "ben"),
            StoryEntryModel(nickName: "lisa", avatar: "lisa1"),
            StoryEntryModel(nickName: "fake_lisa", avatar: "lisa2"),
            StoryEntryModel(nickName: "best_left_wingback", avatar: "ben"),
            StoryEntryModel(nickName: "lisa", avatar: "lisa1"),
            StoryEntryModel(nickName: "fake_lisa", avatar: "lisa2")])
    }
}
