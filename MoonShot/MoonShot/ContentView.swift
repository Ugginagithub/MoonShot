//
//  ContentView.swift
//  MoonShot
//
//  Created by Tarun on 17/06/26.
//

import SwiftUI

struct CustomText: View {
    
    let text: String
    
    var body: some View{
        Text(text)
    }
    
    init(text: String){
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        
        //MARK: Resizing images
//        Image(.example) // give your image name in lowercase, which is present inside the assets
//            .resizable() //exactly fits into our frame, resizes automatically.
//            .scaledToFit()
//            .containerRelativeFrame(.horizontal) { size, axis in
//                size * 0.8
//            } //does leave gaps and fills all the frame exactly, even if it is scaledTofit().
        
        
        //MARK: Scrollview, using CustomViews. LazyVstack vs Vstack
        ScrollView{
            VStack{
                ForEach(0..<100) {
                    CustomText(text:"Item \($0)")
                        .font(.title)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ContentView()
}
