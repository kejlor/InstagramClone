//
//  ContentView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLiked: Bool = false
    @State private var isBookmarked: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<10) { index in
                    VStack(spacing: 0) {
                        HStack {
                            Image("ben")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            Text("best_left_winger")
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
                            Image("ben")
                                .resizable()
                                .scaledToFill()
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
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
