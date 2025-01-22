//
//  Hike.swift
//  hiking
//
//  Created by Sameer,s Macbook on 1/20/25.
//

import Foundation

struct Hike :Identifiable , Hashable {
    let id = UUID()
    let name: String
    let imageURL: String
    let miles: Double
}
