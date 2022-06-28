//
//  PostArrayObject.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import Foundation

class PostArrayObject: ObservableObject{
    
    @Published var dataArray = [PostModel]()
    
    init() {
        print("FETCH FROM DATABASE HERE")
        let post1 = PostModel(postID: "", userID: "", username: "Ochan", caption: "キャプションです", dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postID: "", userID: "", username: "miki", caption: nil, dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "kaho", caption: "キャプションです長いねーーーーーーーーーーーーーー", dateCreate: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postID: "", userID: "", username: "sumire", caption: nil, dateCreate: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    
    /// USE FOR SINGLE POST SELECTION
    init(post: PostModel){
        self.dataArray.append(post)
    }
    
    
}
