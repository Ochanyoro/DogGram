//
//  Browse.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import SwiftUI

struct BrowseView: View {
    
    var posts = PostArrayObject()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            CarouselView()
            ImageGridView(posts: posts)
        })
        .navigationTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            BrowseView()
        }
    }
}
