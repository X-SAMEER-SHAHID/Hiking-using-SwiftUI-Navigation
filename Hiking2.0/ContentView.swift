//
//  ContentView.swift
//  Hiking2.0
//
//  Created by Sameer,s Macbook on 1/21/25.
//

import SwiftUI

struct ContentView: View {
    @State private var zoomed : Bool = false
    
    let hikes = [
        Hike(name: "Torres del Paine", imageURL: "sal", miles: 10.0),
        Hike(name: "El Chalten", imageURL: "tom", miles: 15.0),
        Hike(name: "Perito Moreno Glacier", imageURL: "tam", miles: 20.0)
       
    ]
    var body: some View {
        NavigationStack{
            
            
            List(hikes) { hike in
                NavigationLink(value: hike){
                    // we made the struck hike  hashable so that label has the vales
                    Hikecellview(hike:hike)
                }
            }
            .navigationTitle("Hikes")
            // navigation destination has to parameter type of navigation and destination
            // in this case we are passing hike as navigation destination
            // this will create a new screen with hike details
            // this navigationDestination is of type Hike and it takes hike as parameter

            // we can also create a new view file and simply call that in destination
            .navigationDestination(for: Hike.self) { hike in
                VStack {
                    Text(hike.name)
                        .font(.title)
                        .padding(.top)
                    Image(hike.imageURL)
                        .resizable()
                    // this is the way of writing if else in swift
                        .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    // for adding zoom anaimation we need a state var that has type bool and change the aspect ratio  to fit and fill on tooglr response
                    
                        .onTapGesture {
                            zoomed.toggle()
                        }
                        .frame(height: 300)
                    Text("\(hike.miles.formatted()) miles")
                        .font(.subheadline)
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    ContentView()

}

// extrated the subview from the main
struct Hikecellview: View {
    let hike : Hike
    var body: some View {
        HStack(alignment: .top) {
            Image(hike.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(hike.name)
                Text("\(hike.miles.formatted()) miles")
                
            }
        }
    }
}
