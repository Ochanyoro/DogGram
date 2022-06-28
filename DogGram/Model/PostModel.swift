//
//  PostModel.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable{
    
    var id = UUID()
    var postID: String // ID for the post in Database
    var userID: String // ID for the user in Database
    var username: String // Username for user in Database
    var caption: String?
    var dateCreate: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // postID
    // userID
    // user username
    // caption - optional
    // date
    // like count
    // liked by current user
}
