//
//  SettingsRowView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/29.
//

import SwiftUI

struct SettingsRowView: View {
    
    var leftIcon: String
    var text: String
    var color: Color
    
    var body: some View {
        HStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                
                Image(systemName: leftIcon)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text)
                .foregroundColor(.primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.primary)
            
        }
        .padding(.vertical, 4)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(leftIcon: "heart.fill", text: "Row Title", color: .red)
            .previewLayout(.sizeThatFits)
    }
}
