//
//  CompletePostViewModel.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 15/12/2021.
//

import Foundation

class CompletePostViewModel: ObservableObject {
    @Published var completePostsArray: [CompletePostModel] = []
    
    init() {
        getCompletePosts()
    }
    
    func getCompletePosts() {
        self.completePostsArray.append(contentsOf: [
            CompletePostModel(nickName: "best_left_wingback", avatar: "ben", postedImages: ["ben", "lisa1", "lisa2"]),
            CompletePostModel(nickName: "best_left_wingback", avatar: "ben", postedImages: ["ben"]),
            CompletePostModel(nickName: "lalisa", avatar: "lisa1", postedImages: ["lisa1"]),
            CompletePostModel(nickName: "lalisa", avatar: "lisa1", postedImages: ["lisa2", "lisa1"])])
    }
    
    func changeIsLiked(completePostModel: CompletePostModel) {
        if let index = completePostsArray.firstIndex(where: { $0.id == completePostModel.id}) {
            completePostsArray[index] = completePostModel.updateLike()
        }
    }
    
    func changeIsBookmarked(completePostModel: CompletePostModel) {
        if let index = completePostsArray.firstIndex(where: { $0.id == completePostModel.id}) {
            completePostsArray[index] = completePostModel.updateBookmarked()
        }
    }
}
