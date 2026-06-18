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

//heirarchial codable data
struct User: Codable{
    let name: String
    let address: Address
}

struct Address: Codable{
    let street: String
    let city: String
}

struct ContentView: View {
    
    //grid varaibles
    let layout = [
        GridItem(.adaptive(minimum: 80,maximum: 120)) //this will adapt according to screen, grid will form accroding to screen size and with 80 pixels size.
    ]
    
    //actual app's variables
//    let astronauts = Bundle.main.decode("Astronauts.json")
    let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json") //for generic functions we are mentioning the type, chekc the Bundle-Decodable.swift file, so that we can using same functionality for different data types
    
    let missions: [Mission] = Bundle.main.decode("missions.json") //used generic function, wow..
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    var body: some View {
        
        //MARK: Resizing images
//        Image(.example) // give your image name in lowercase, which is present inside the assets
//            .resizable() //exactly fits into our frame, resizes automatically.
//            .scaledToFit()
//            .containerRelativeFrame(.horizontal) { size, axis in
//                size * 0.8
//            } //does leave gaps and fills all the frame exactly, even if it is scaledTofit().
        
        
        //MARK: Scrollview, using CustomViews. LazyVstack vs Vstack
//        ScrollView{
//            VStack{
//                ForEach(0..<100) {
//                    CustomText(text:"Item \($0)")
//                        .font(.title)
//                }
//                .frame(maxWidth: .infinity)
//            }
//        }
        
        //MARK: NavigationLink
//        NavigationStack{
//            NavigationLink("Tap me"){
//                Text("Detail view")
//            }
//            .navigationTitle("SwiftUI")
//        }
        
//        NavigationStack{
//            List(0..<100) { row in
//                NavigationLink("Row \(row)"){
//                    Text("Details \(row)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
        
        //MARK: heirarchial codable data
//        Button("Decode Json"){
//            let input = """
//                {
//                    "name": "Tarun Pavan",
//                    "address" : {
//                        "street" : "888, Tarun Avenue",
//                        "city" : "Eluru"
//                    }
//                }
//                """
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
        
        
        
        //MARK: Scrolling grid
//        ScrollView{
//            LazyVGrid(columns: layout){
//                ForEach(0..<100){
//                    Text("item \($0)")
//                }
//            }
//        }
        
        //MARK: Actual project starts
        // Imported astronauts.json and missions.json files and images also.
        //Created astronauts.swift and Bundle-decodable files
        //Credted mission.swift
        
//        Text(String(astronauts.count ))
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions) { mission in
                        NavigationLink{
//                            Text("Detail view")
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100, height: 100)
                                    .padding()
                                
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
        }
    }
}

#Preview {
    ContentView()
}
