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
    @State var postImage: UIImage = UIImage(named: "dog1")!
    
    @State var animateLike: Bool = false
    @State var addheartAnimationToView: Bool
    
    @State var showActionSheet: Bool = false
    @State var actionSheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption {
        case general
        case reporting
    }
    
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
                    
                    
                    Button(action: {
                        showActionSheet.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    })
                    .accentColor(.primary)
                    .actionSheet(isPresented: $showActionSheet, content: {
                       getActionSheet()
                    })
                  
                }
                .padding(.all, 6)
            }
           
            
            // MARK: IMAGE
            ZStack {
                Image(uiImage: postImage)
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
                    
                    
                    Button(action: {
                        sharePost()
                    } , label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    })
                    .accentColor(.primary)
                    
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
    
    func getActionSheet() -> ActionSheet {
        
        switch self.actionSheetType {
        case .general:
            return ActionSheet(title: Text("何をしたいのーー？"), message: nil, buttons: [
                .destructive(Text("Report"), action:{
                    self.actionSheetType = .reporting
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showActionSheet.toggle()
                    }
                    
                }),
            
                .default(Text("Learn more..."),action: {
                    print("LEARN MORE PRESSED")
                }),
                
                .cancel()
                    
            ])
            
        case .reporting:
            return ActionSheet(title: Text("Why are you reporting this post?"), message: nil,buttons: [
                
                .destructive(Text("this is inappropriate"), action: {
                    reportPost(reason: "this is inappropriate")
                }),
                
                .destructive(Text("this is spam"), action: {
                    reportPost(reason: "this is spam")
                }),
                .destructive(Text("It made me uncomfortable"), action: {
                    reportPost(reason: "It made me uncomfortable")
                }),
                
                .cancel({
                    self.actionSheetType = .general
                })
            ])
        }
    }
        
    func reportPost(reason: String){
        print("report post now")
    }
    
    func sharePost() {
        
        let message = "Checl out this post on DogGram"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [message,image,link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true)
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
