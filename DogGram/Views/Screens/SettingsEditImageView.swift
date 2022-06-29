//
//  SettingsEditImageView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/29.
//

import SwiftUI

struct SettingsEditImageView: View {
    
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage
    @State var sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
    
    @State var showImagePicker: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack{
                Text(description)
                Spacer(minLength: 0)
            }
            
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200, alignment: .center)
                .clipped()
                .cornerRadius(12)
            
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                Text("Import".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            })
            .accentColor(Color.MyTheme.purpleColor)
            .sheet(isPresented: $showImagePicker, content: {
                ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
            })

            
            Button(action: {
                showImagePicker.toggle()
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

struct SettingsEditImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingsEditImageView(title: "title", description: "description", selectedImage: UIImage(named: "dog1")!)
        }
    }
}
