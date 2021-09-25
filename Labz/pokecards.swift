//
//  pokecards.swift
//  Labz
//
//  Created by user203110 on 9/25/21.
//

import Foundation

struct Pokecard: Codable {
let data : [Pokedata]
    
}

struct Pokedata: Codable{
let id: String
let name : String
let supertype: String
let images : PokeImages
let ids=UUID()

}

struct PokeImages: Codable{
    let small : String
    let large : String
}
