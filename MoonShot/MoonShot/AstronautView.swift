//
//  AstronautView.swift
//  MoonShot
//
//  Created by Tarun on 18/06/26.
//

import SwiftUI

struct AstronautView: View {
    let astronaut : Astronauts
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronaut: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronaut["aldrin"]!)
        .preferredColorScheme(.dark )
}
