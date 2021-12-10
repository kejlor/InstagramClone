//
//  StoryScreen.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 10/12/2021.
//

import SwiftUI

struct StoryScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var nickName: String
    @Binding var avatar: String
    
    var body: some View {
        ZStack {
            Image(systemName: "ben")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
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



struct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen()
    }
}
