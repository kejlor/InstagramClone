//
//  ContentView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        appContent
    }
    
    var appContent: some View {
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
                StoryEntry(nickName: "best_left_wingback", avatar: "ben")
                StoryEntry(nickName: "lisa", avatar: "lisa1")
                StoryEntry(nickName: "best_left_wingback", avatar: "ben")
                StoryEntry(nickName: "lisa", avatar: "lisa1")
                StoryEntry(nickName: "best_left_wingback", avatar: "ben")
                StoryEntry(nickName: "lisa", avatar: "lisa1")
            }
        }
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
    @State var isTapped: Bool = false
    @State private var animationAmount: CGFloat = 1
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
                ZStack {
                    Image(postedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .onTapGesture(count: 2) {
                            isTapped.toggle()
                            isLiked.toggle()
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
                                isTapped.toggle()
                            }
                        }
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .scaleEffect(animationAmount)
                        .animation(Animation.linear(duration: 0.1).delay(0.4).repeatForever())
                        .onAppear {
                            animationAmount = 1.2
                        }
                        .opacity(isTapped && isLiked ? 1.0 : 0.0)
                }
            }
            .frame(height: 400)
            
            HStack {
                
                Button {
                    self.isLiked.toggle()
                } label: {
                    Image(systemName: self.isLiked == true ? "heart.fill" : "heart")
                }
                .foregroundColor(self.isLiked == true ? Color.red : Color.primary )
                
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

struct StoryEntry: View {
    
    @State var showSheet: Bool = false
    @State var nickName: String = ""
    @State var avatar: String = ""
    
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
            SecondScreen(nickName: $nickName, avatar: $avatar)
        })
    }
}

struct HeaderElements: View {
    var body: some View {
        Text("Instagram")
            .frame(alignment: .leading)
            .padding()
        
        Spacer()
        
        Image(systemName: "plus.app")
            .padding(3)
        Image(systemName: "heart")
            .padding(3)
        Image(systemName: "paperplane")
            .padding(3)
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var nickName: String
    @Binding var avatar: String
    
    var body: some View {
        ZStack {
            Image(systemName: "ben")
//                .resizable()
//                .scaledToFit()
//                .frame(
//                    width: UIScreen.main.bounds.width,
//                    height: UIScreen.main.bounds.height * 0.9)
            
            VStack(alignment: .leading) {
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
                
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        
                        Text("Hello, World!")
                            .background(RoundedRectangle(cornerRadius: 30)
                                            .stroke()
                                            .frame(
                                                width: UIScreen.main.bounds.width * 0.85,
                                                height: 20))
                            .foregroundColor(.primary)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.primary)
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
            }
        }
    }
}

