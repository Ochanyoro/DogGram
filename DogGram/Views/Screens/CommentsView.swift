//
//  CommentsView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import SwiftUI

struct CommentsView: View {
    
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack{
                    ForEach(commentArray, id: \.self){ comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("コメントを残す", text: $submissionText)
                
                
                Button(action: { }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(Color.MyTheme.purpleColor)
                   
            }
            .padding(.all, 6)
        }
        .navigationTitle("コメント")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            getComments()
        })
    }
    
    
    // MARK: FUNCTIONS
    func getComments(){
        print("GET COMMENTS FROM DATABASE")
        let comment1 = CommentModel(commentID: "", userID: "", username: "Ochan-", content: "最初のコメント", dateCreated: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "O", content: "二番目コメント", dateCreated: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "Osan", content: "三番目のコメント", dateCreated: Date())
        let comment4 = CommentModel(commentID: "", userID: "", username: "Oo0ooo0", content: "四番目のコメント", dateCreated: Date())
        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
        self.commentArray.append(comment4)
        
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
