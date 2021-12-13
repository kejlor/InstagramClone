//
//  StoryEntryView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 12/12/2021.
//

import SwiftUI

struct StoryEntry {
    let id = UUID()
    let nickName: String
    let avatar: String
}

class StoryEntryViewModel: ObservableObject {
    @Published var storyEntriesArray: [StoryEntry] = []
    
    init() {
        getStoryEntries()
    }
    
    func getStoryEntries() {
        self.storyEntriesArray.append(contentsOf: [
            StoryEntry(nickName: "best_left_wingback", avatar: "ben"),
            StoryEntry(nickName: "lisa", avatar: "lisa1"),
            StoryEntry(nickName: "fake_lisa", avatar: "lisa2"),
            StoryEntry(nickName: "best_left_wingback", avatar: "ben"),
            StoryEntry(nickName: "lisa", avatar: "lisa1"),
            StoryEntry(nickName: "fake_lisa", avatar: "lisa2")])
    }
}

struct StoryEntryView: View {
    
    @State private var showSheet = false
    @StateObject var storyEntryViewModel = StoryEntryViewModel()
    
    var body: some View {
        
        ForEach(storyEntryViewModel.storyEntriesArray, id: \.id) { storyEntry in
            Button {
                showSheet.toggle()
            } label : {
                VStack {
                    ZStack(alignment: .center) {
                        Image(storyEntry.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Circle()
                            .stroke(
                                AngularGradient(
                                    gradient: .init(colors: [Color.orange, Color.pink]),
                                    center: .center))
                            .frame(width: 85, height: 85)
                    }
                    
                    Text(storyEntry.nickName)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .frame(maxWidth: 90)
                }
                .frame(maxWidth: 90)
                .padding(5)
            }.fullScreenCover(isPresented: $showSheet, content: {
                StoryScreenView()
            })
        }
    }
}

struct StoryEntryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryEntryView()
    }
}
