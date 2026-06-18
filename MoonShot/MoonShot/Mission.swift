//
//  Mission.swift
//  MoonShot
//
//  Created by Tarun on 18/06/26.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable{
        let name: String
        let role : String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String{
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    var formattedDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
