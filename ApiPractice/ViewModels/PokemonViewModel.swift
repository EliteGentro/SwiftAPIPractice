//
//  PhotoViewModel.swift
//  Foto
//
//  Created by Humberto Genaro Cisneros Salinas on 01/10/25.
//

import Foundation

@MainActor
@Observable
class PokemonViewModel{
    var arrCharacters = [Pokemon]()
    
    func getCharactersPokemon() async throws{
        for i in 1 ... 20{
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(i)")
            else{
                print("Invalid URL")
                return
            }
            do{
                //Request
                let urlRequest = URLRequest(url: url)
                
                //Llamar HTTP
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    print("Error: Invalid response from server")
                    return
                }
                
                let results = try JSONDecoder().decode(Pokemon.self, from:data)
                
                self.arrCharacters.append(results)
            }catch{
                print("An unexpected error occurred: \(error)")
            }
        }
    }
}
