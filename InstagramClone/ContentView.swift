//
//  ContentView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 08/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
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
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                        
                        GeometryReader { geo in
                            Image("ben")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geo.size.width, height: geo.size.height)
                        }
                        .frame(height: 500)
                        
                        HStack {
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "heart")
                            }.foregroundColor(.secondary)

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
                                
                            } label: {
                                Image(systemName: "bookmark")
                            }
                            
                            
                        }
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
            .preferredColorScheme(.light)
    }
}
