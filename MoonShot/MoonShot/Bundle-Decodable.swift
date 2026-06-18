//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Tarun on 18/06/26.
//

import Foundation

extension Bundle{
//    func decode(_ file : String) -> [String: Astronauts]{
    func decode<T: Codable>(_ file : String) -> T { //MARK: generic functions
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
//        guard let loaded = try? decoder.decode([String: Astronauts].self, from: data) else{
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//        
//        return loaded
        //MARK: Date formating
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do{
//            return try decoder.decode([String: Astronauts].self, from: data)
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError("failed to load \(file) from the missing bundle , due to missing key \(key.stringValue), context is \(context)")
        }catch{
            fatalError("Failed to load \(file) from the bundle. from \(error.localizedDescription)")
        }
        
    }
}
