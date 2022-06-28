//
//  Browse.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import SwiftUI

struct Browse: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            CarouselView()
        })
        .navigationTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Browse_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Browse()
        }
    }
}
