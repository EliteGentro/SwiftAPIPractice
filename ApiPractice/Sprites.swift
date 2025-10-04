//
//  Characters.swift
//  ApiPractice
//
//  Created by Humberto Genaro Cisneros Salinas on 03/10/25.
//

import Foundation

struct Sprites : Decodable{
    var front_shiny : String
    
    enum CodingKeys: String, CodingKey {
        case front_shiny
    }
}
