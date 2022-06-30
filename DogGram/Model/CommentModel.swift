//
//  CommentModel.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String // ID for the comment in the Database
    var userID: String // ID for the user in the Database
    var username: String // username for the user in the Database
    var content: String
    var dateCreate: Date
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
