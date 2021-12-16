//
//  StoryScreenView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 12/12/2021.
//

import SwiftUI

struct StoryScreenView: View {
    
    @State private var messageText = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var storyEntryViewModel = StoryEntryViewModel()
    
    var body: some View {
        ForEach(storyEntryViewModel.storyEntriesArray, id: \.id) { storyEntry in
            VStack {
                ZStack(alignment: .topLeading) {
                    Image("ben")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height * 0.9)
                    
                    HStack {
                        Image(storyEntry.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        
                        Text(storyEntry.nickname)
                            .font(.caption)
                            .bold()
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis").rotationEffect(.degrees(-90))
                        }
                        .foregroundColor(Color.primary)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                }
                
                HStack {
                    Spacer()
                    Button {
                        sendMessage()
                    } label: {
                        
                        TextField("Hello, World!", text: $messageText)
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
    
    func sendMessage() {
        // add code to send messages
        messageText = ""
    }
}

struct StoryScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreenView()
    }
}
