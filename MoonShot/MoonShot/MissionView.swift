//
//  MissionView.swift
//  MoonShot
//
//  Created by Tarun on 18/06/26.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    //MARK: Merging Codable Structs
    struct CrewMember{
        let role: String
        let astronaut: Astronauts
    }
    let crew : [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axes in
                        width * 0.6 //occupies 60% of the screen.
                    }
//                Divider() //forms a thin line to separate the items
                
                VStack(alignment: .leading){
                    Rectangle() //custom separator
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlight")
                        .font(.title.bold())
                        .padding(.bottom)
                    
                    Text(mission.description)
                    
                    Rectangle() //custom separator
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(crew, id: \.role) { CrewMember in
                            NavigationLink {
//                                Text("Astronaut details")
                                AstronautView(astronaut: CrewMember.astronaut)
                            } label: {
                                HStack {
                                    Image(CrewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 70)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder( .white, lineWidth: 1)
                                        )
                                    VStack(alignment: .leading){
                                        Text(CrewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        Text(CrewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    //Merging 2 structs
    init(mission: Mission, astronauts: [String: Astronauts]){
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts : [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
