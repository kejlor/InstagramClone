//
//  HeaderElementsView.swift
//  InstagramClone
//
//  Created by Bartosz Wojtkowiak on 12/12/2021.
//

import SwiftUI

struct HeaderElementsView: View {
    var body: some View {
        Text("Instagram")
            .frame(alignment: .leading)
            .padding()
        
        Spacer()
        
        HStack {
            Image(systemName: "plus.app")
            Image(systemName: "heart")
            Image(systemName: "paperplane")
        }
        .padding(3)
    }
}

struct HeaderElementsView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderElementsView()
    }
}
