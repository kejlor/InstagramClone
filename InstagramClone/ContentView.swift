//
//  ContentView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        contentLayer
    }
    var contentLayer: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                CompletePost(nickName: "best_left_wingback", avatar: "ben", postedImage: "ben")
                CompletePost(nickName: "best_left_wingback", avatar: "ben", postedImage: "ben")
                CompletePost(nickName: "lalisa", avatar: "lisa1", postedImage: "lisa1")
                CompletePost(nickName: "lalisa", avatar: "lisa1", postedImage: "lisa2")
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

struct CompletePost: View {
    
    @State var isLiked: Bool = false
    @State var isBookmarked: Bool = false
    let nickName: String
    let avatar: String
    let postedImage: String
    
    var body: some View {
        
        VStack(spacing: 5) {
            HStack {
                Image(avatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(nickName)
                    .font(.caption)
                    .bold()
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis").rotationEffect(.degrees(-90))
                }
                .foregroundColor(Color.primary)
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            
            GeometryReader { geo in
                Image(postedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(height: 400)
            
            HStack {
                
                Button {
                    self.isLiked.toggle()
                } label: {
                    Image(systemName: self.isLiked == true ? "heart.fill" : "heart")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "message")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
                
                Spacer()
                
                Button {
                    self.isBookmarked.toggle()
                } label: {
                    Image(systemName: self.isBookmarked == true ? "bookmark.fill" : "bookmark")
                }
                
                
            }
            .font(.callout)
            .foregroundColor(Color.primary)
            .padding(.horizontal)
        }
    }
}
