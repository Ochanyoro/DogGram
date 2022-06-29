//
//  SettingsEditTextView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/29.
//

import SwiftUI

struct SettingsEditTextView: View {
    
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    var body: some View {
        VStack {
            
            HStack{
                Text(description)
                Spacer(minLength: 0)
            }
            
            TextField(placeholder,text: $submissionText)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.MyTheme.beigeColor)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
            
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
            })
            .accentColor(Color.MyTheme.yellowColor)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditTextView(title: "test title", description: "description", placeholder: "test placeholder")
        }
    }
}
