//
//  ImageGridView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import SwiftUI

struct ImageGridView: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ],
            alignment: .center,
            spacing: nil,
            pinnedViews: [],
            content: {
                ForEach(posts.dataArray, id: \.self){post in
                    NavigationLink(destination: FeedView(posts: PostArrayObject(post: post),title: "Post"), label: {
                        PostView(post: post, showHeaderAndFooter: false)
                    })
                }
            })
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(posts: PostArrayObject())
            .previewLayout(.sizeThatFits)
    }
}