//
//  CommentsView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import SwiftUI

struct CommentsView: View {
    
    @State var submissionText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                Text("プレイスホルダー")
                Text("プレイスホルダー")
                Text("プレイスホルダー")
                Text("プレイスホルダー")
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
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
