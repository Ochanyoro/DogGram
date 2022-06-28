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
                FeedView(posts: PostArrayObject())
            }
                .tabItem{
                    Image(systemName: "book.fill")
                    Text("Feed")
                }
            
            Text("Screen2")
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            Text("Screen3")
                .tabItem{
                    Image(systemName: "square.amd.arrow.up.fill")
                    Text("Upload")
                }
            
            Text("Screen4")
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
