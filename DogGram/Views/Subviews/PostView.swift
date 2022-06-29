//
//  PostView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    
    @State var animateLike: Bool = false
    @State var addheartAnimationToView: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            
            // MARK: HEADER
            if showHeaderAndFooter {
                HStack {
                    
                    NavigationLink(destination: ProfileView(isMyProfile: false, profileDisplayName: post.username, profileUserID: post.userID), label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: .center)
                        .cornerRadius(15)
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    })
                    
                    
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                }
                .padding(.all, 6)
            }
           
            
            // MARK: IMAGE
            ZStack {
                Image("dog1")
                    .resizable()
                    .scaledToFit()
                if addheartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
                
            }
            //MARK: FOOTER
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20, content: {
                    Button(action: {
                        if post.likedByUser {
                            unlikePost()
                        } else {
                            likePost()
                        }
                    }, label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                            .font(.title3)
                    })
                    .accentColor(post.likedByUser ? .red : .black)
                    
                    // MARK: COMMENT ICON
                    NavigationLink(destination: CommentsView(), label: {
                        Image(systemName: "bubble.middle.bottom")
                            .font(.title3)
                            .foregroundColor(.primary)
                    })
                    
                    
                    Image(systemName: "paperplane")
                        .font(.title3)
                    
                    Spacer()
                })
                .padding(.all, 6)
                
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.all, 6)
                }
            }
            
        })
    }
    
    //MARK: FUNCTIONS
    func likePost(){
        let updatePost = PostModel(postID: post.postID, userID: post.userID, username: post.username,caption: post.caption, dateCreate: post.dateCreate, likeCount: post.likeCount + 1, likedByUser: true)
        
        self.post = updatePost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
            animateLike = false
        }
    }
    
    func unlikePost() {
        let updatePost = PostModel(postID: post.postID, userID: post.userID, username: post.username,caption: post.caption ,dateCreate: post.dateCreate, likeCount: post.likeCount - 1, likedByUser: false)
        
        self.post = updatePost
    }
}

struct PostView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(
        postID: "", userID: "", username: "Ochan", caption: "これはテストだよ", dateCreate: Date(), likeCount: 0, likedByUser: false
    )
    
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true, addheartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
