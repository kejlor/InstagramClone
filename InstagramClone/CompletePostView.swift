//
//  CompletePostView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 12/12/2021.
//

import SwiftUI

class CompletePost {
    let id = UUID()
    let nickName: String
    let avatar: String
    let postedImages: [String]
    var isLiked = false
    var isBookmarked = false
    
    init(nickName: String, avatar: String, postedImages: [String]) {
        self.nickName = nickName
        self.avatar = avatar
        self.postedImages = postedImages
    }
}

class CompletePostViewModel: ObservableObject {
    @Published var completePostsArray: [CompletePost] = []
    
    init() {
        getCompletePosts()
    }
    
    func getCompletePosts() {
        self.completePostsArray.append(contentsOf: [
            CompletePost(nickName: "best_left_wingback", avatar: "ben", postedImages: ["ben", "lisa1", "lisa2"]),
            CompletePost(nickName: "best_left_wingback", avatar: "ben", postedImages: ["ben"]),
            CompletePost(nickName: "lalisa", avatar: "lisa1", postedImages: ["lisa1"]),
            CompletePost(nickName: "lalisa", avatar: "lisa1", postedImages: ["lisa2", "lisa1"])])
    }
    
    func changeIsLiked(completePost: CompletePost) {
        completePost.isLiked.toggle()
    }
}

// MARK: COMPONENTS 

struct CompletePostView: View {
    
    //TODO:
    /*
     1) Make states isLiked, isBookmarked, isTapped to object
     */
    
    @State private var isTapped = false
    @State private var animationAmount: CGFloat = 1
    @State private var showActionSheet = false
    @State private var actionSheetOptions: ActionSheetOptions = .isOtherPost
    @StateObject var completePostViewModel = CompletePostViewModel()
    
    enum ActionSheetOptions {
        case isMyPost, isOtherPost
    }
    
    var body: some View {
        LazyVStack {
            ForEach(completePostViewModel.completePostsArray, id: \.id) { completePost in
                VStack(spacing: 5) {
                    postHeaderElements(avatar: completePost.avatar, nickName: completePost.nickName)
                    postBodyElements(completePost: completePost)
                    postFootElements(completePost: completePost)
                }
                .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
                
            }
        }
    }
    
    }

struct CompletePostView_Previews: PreviewProvider {
    static var previews: some View {
        CompletePostView()
    }
}

// MARK: FUNCTIONS

extension CompletePostView {
    func postHeaderElements(avatar: String, nickName: String) -> some View {
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
    }
    
    func postBodyElements(completePost: CompletePost) -> some View {
            GeometryReader { geo in
                ZStack {
                    TabView {
                        ForEach(0..<completePost.postedImages.count,
                                id: \.self) { image in
                            Image(completePost.postedImages[image])
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width, height: geo.size.height)
                                .onTapGesture(count: 2) {
                                    isTapped.toggle()
                                    completePost.isLiked.toggle()
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
                        .opacity(isTapped && completePost.isLiked ? 1.0 : 0.0)
                }
            }
            .frame(height: 400)
    }
    
    func postFootElements(completePost: CompletePost) -> some View {
            HStack {

                Button {
                    completePost.isLiked.toggle()
                } label: {
                    Image(systemName: completePost.isLiked == true ? "heart.fill" : "heart")
                }
                .foregroundColor(completePost.isLiked == true ? Color.red : Color.primary )
                
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
                    completePost.isBookmarked.toggle()
                } label: {
                    Image(systemName: completePost.isBookmarked == true ? "bookmark.fill" : "bookmark")
                }
            }
            .font(.callout)
            .foregroundColor(Color.primary)
            .padding(.horizontal)
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
