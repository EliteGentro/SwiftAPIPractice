//
//  Photo.swift
//  Foto
//
//  Created by Humberto Genaro Cisneros Salinas on 01/10/25.
//

import Foundation

struct Pokemon : Identifiable, Decodable{
    var id : Int
    var height : Int
    var name : String
    var weight : Int
    var sprites : Sprites
    
    enum CodingKeys: String, CodingKey {
        case id, height, name, weight, sprites
    }
}


