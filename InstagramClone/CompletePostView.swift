//
//  CompletePostView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 12/12/2021.
//

import SwiftUI

struct CompletePostView: View {
    
    @State private var isLiked = false
    @State private var isBookmarked = false
    @State private var isTapped = false
    @State private var animationAmount: CGFloat = 1
    @State private var showActionSheet = false
    @State private var actionSheetOptions: ActionSheetOptions = .isOtherPost
    let nickName: String
    let avatar: String
    let postedImages: [String]
    var id = UUID()
    
    enum ActionSheetOptions {
        case isMyPost, isOtherPost
    }
    
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
                    actionSheetOptions = .isOtherPost
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis").rotationEffect(.degrees(-90))
                }
                .foregroundColor(Color.primary)
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            
            GeometryReader { geo in
                ZStack {
                    TabView {
                        ForEach(0..<postedImages.count,
                                id: \.self) { image in
                            Image(postedImages[image])
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
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
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
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    
    func getActionSheet() -> ActionSheet {
        
        let linkButton: ActionSheet.Button = .default(Text("Link")) {
            // add code to link post
        }
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            // add code to share post
        }
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            // add code to report post
        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            // add code to delete post
        }
        let whyAreYouSeeingThisButton: ActionSheet.Button = .default(Text("Why you're seeing this post")) {
            // add code
        }
        let unfollowButton: ActionSheet.Button = .default(Text("Unfollow")) {
            // add code to unfollow
        }
        let cancelButton: ActionSheet.Button = .cancel()
        
        let title = Text("What would you like to do?")
        
        switch actionSheetOptions {
        case .isMyPost:
            return createActionSheetButtons(title: title, buttons: [linkButton, shareButton, reportButton, deleteButton, cancelButton])
        case .isOtherPost:
            return createActionSheetButtons(title: title, buttons: [linkButton, shareButton, reportButton, whyAreYouSeeingThisButton , unfollowButton, cancelButton])
        }
    }
    func createActionSheetButtons(title: Text, buttons : [ActionSheet.Button]) -> ActionSheet {
        return ActionSheet(
            title: title,
            message: nil,
            buttons: buttons)
    }
}

struct CompletePostView_Previews: PreviewProvider {
    static var previews: some View {
        CompletePostView(nickName: "lisa", avatar: "lisa1", postedImages: ["ben", "lisa1", "lisa2"])
    }
}
