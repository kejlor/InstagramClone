//
//  StoryEntry.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 12/12/2021.
//

import SwiftUI

struct StoryEntry: View {
    
    @State private var showSheet = false
    @State private var nickName = ""
    @State private var avatar = ""
    var id = UUID()
    
    init( nickName: String, avatar: String) {
        _nickName = State(wrappedValue: nickName)
        _avatar = State(wrappedValue: avatar)
    }
    
    var body: some View {
        Button {
            showSheet.toggle()
        } label : {
            VStack {
                ZStack(alignment: .center) {
                    Image(avatar)
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
                
                Text(nickName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .frame(maxWidth: 90)
            }
            .frame(maxWidth: 90)
            .padding(5)
        }.fullScreenCover(isPresented: $showSheet, content: {
            StoryScreen(nickName: $nickName, avatar: $avatar)
        })
    }
}

struct StoryEntry_Previews: PreviewProvider {
    static var previews: some View {
        StoryEntry(nickName: "ben", avatar: "ben")
    }
}
