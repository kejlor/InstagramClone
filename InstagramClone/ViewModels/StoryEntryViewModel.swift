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
            StoryEntryModel(nickname: "best_left_wingback", avatar: "ben"),
            StoryEntryModel(nickname: "lisa", avatar: "lisa1"),
            StoryEntryModel(nickname: "fake_lisa", avatar: "lisa2"),
            StoryEntryModel(nickname: "best_left_wingback", avatar: "ben"),
            StoryEntryModel(nickname: "lisa", avatar: "lisa1"),
            StoryEntryModel(nickname: "fake_lisa", avatar: "lisa2")])
    }
}
