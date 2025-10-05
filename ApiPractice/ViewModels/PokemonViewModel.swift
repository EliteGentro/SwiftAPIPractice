//
//  PokemonViewModel.swift
//  ApiPractice
//
//  Created by Humberto Genaro Cisneros Salinas on 01/10/25.
//

import Foundation
import Combine

@MainActor
@Observable
class PokemonViewModel{
    var arrCharacters = [Pokemon]()
    var isLoading = false
    var errorDetail = ""
    
    func getCharactersPokemon() async throws{
        isLoading = true
        defer { isLoading = false } //Whenever the function ends (even if not successfully)
        for i in 1 ... 20{
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(i)")
            else{
                errorDetail = "Invalid URL"
                print(errorDetail)
                return
            }
            do{
                //Convert to request
                let urlRequest = URLRequest(url: url)
                
                //HTTP call for specific pokemon
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
                //Check for success code
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    errorDetail = "Invalid response from server"
                    print(errorDetail)
                    return
                }
                
                //Decode based on pokemon object
                let results = try JSONDecoder().decode(Pokemon.self, from:data)
                
                //Append pokemon to characters
                self.arrCharacters.append(results)
            }catch{
                errorDetail = "No Internet Conexion"
                throw error
            }
        }
    }
    
}
