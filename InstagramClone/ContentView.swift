//
//  ContentView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    
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
            HeaderElementsView()
        }
    }
    
    var storyLayer: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(spacing: 20) {
                StoryEntryView()
            }
        }
    }
    
    var contentLayer: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                CompletePostView()
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
