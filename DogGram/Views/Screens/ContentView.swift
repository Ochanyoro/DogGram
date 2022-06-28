//
//  ContentView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationView {
                FeedView(posts: PostArrayObject(), title: "Feed")
            }
                .tabItem{
                    Image(systemName: "book.fill")
                    Text("Feed")
                }
            NavigationView{
                BrowseView()
            }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            UploadView()
                .tabItem{
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upload")
                }
            
            NavigationView{
                ProfileView(isMyProfile: true, profileDisplayName: "my profile", profileUserID: "")
            }
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color.MyTheme.purpleColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
