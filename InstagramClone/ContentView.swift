//
//  ContentView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    let storyEntries = [ StoryEntry(nickName: "best_left_wingback", avatar: "ben"),
                         StoryEntry(nickName: "lisa", avatar: "lisa1"),
                         StoryEntry(nickName: "fake_lisa", avatar: "lisa2"),
                         StoryEntry(nickName: "best_left_wingback", avatar: "ben"),
                         StoryEntry(nickName: "lisa", avatar: "lisa1"),
                         StoryEntry(nickName: "fake_lisa", avatar: "lisa2")]
    let completePosts = [CompletePost(nickName: "best_left_wingback", avatar: "ben", postedImages:                                      ["ben", "lisa1", "lisa2"]),
                         CompletePost(nickName: "best_left_wingback", avatar: "ben", postedImages: ["ben"]),
                         CompletePost(nickName: "lalisa", avatar: "lisa1", postedImages: ["lisa1"]),
                         CompletePost(nickName: "lalisa", avatar: "lisa1", postedImages: ["lisa2"])]
    
    var body: some View {
        Section(header: headerLayer) {
            ScrollView {
                storyLayer
                contentLayer
            }
        }
    }
    
    var headerLayer: some View {
        HStack {
            HeaderElements()
        }
    }
    
    var storyLayer: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(storyEntries, id: \.id) { storyEntry in
                    storyEntry
                }
            }
        }
    }
    
    var contentLayer: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(completePosts, id: \.id) { completePost in
                    completePost
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
