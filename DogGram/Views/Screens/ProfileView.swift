//
//  ProfileView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/29.
//

import SwiftUI

struct ProfileView: View {
    
    var isMyProfile: Bool
    @State var profileDisplayName: String
    var profileUserID: String
    
    var posts = PostArrayObject()
    
    @State var showSettings: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            Divider()
            ImageGridView(posts: posts)
        })
        .navigationBarTitle("プロフィール")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    showSettings.toggle()
                                }, label: {
                                Image(systemName: "line.horizontal.3")
                                })
                                .accentColor(Color.MyTheme.purpleColor)
                                .opacity(isMyProfile ? 1.0 : 0.0)
        )
        .sheet(isPresented: $showSettings, content: {
            SettingsView()
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProfileView(isMyProfile: true, profileDisplayName: "Oaan", profileUserID: "")
        }
    }
}
