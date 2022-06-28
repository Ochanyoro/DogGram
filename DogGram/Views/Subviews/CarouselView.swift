//
//  CarouselView.swift
//  DogGram
//
//  Created by 大和田一裕 on 2022/06/28.
//

import SwiftUI

struct CarouselView: View {
    
    @State var selection: Int = 0
    @State var timerAdded: Bool = false

    let maxCount: Int = 8
    
    var body: some View {
        TabView(selection: $selection, content: {
            ForEach(1..<maxCount){ count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .tag(count)
                
            }
        })
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
        .animation(.default)
        .onAppear(perform: {
            if !timerAdded {
                addTimer()
            }
        })
    }
    
    //MARK: FUNCTIONS
    func addTimer(){
        
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ (timer) in
            if selection == (maxCount - 1) {
                selection = 1
            } else {
                selection += 1
            }
        }
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
