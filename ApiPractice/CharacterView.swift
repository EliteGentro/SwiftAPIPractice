//
//  PhotoView.swift
//  Foto
//
//  Created by Humberto Genaro Cisneros Salinas on 01/10/25.
//

import SwiftUI

struct CharacterView: View {
    @State var charactersVM = PokemonViewModel()
    
    var body: some View {
        VStack{
            List{
                ForEach(charactersVM.arrCharacters){pokemon in
                    Text(pokemon.name)
                    AsyncImage(url: URL(string : (pokemon.sprites.front_shiny)))
                        .scaledToFit()
                        .frame( height: 50)
                        .padding()
                }
            }
            .task {
                do{
                    try await charactersVM.getCharactersPokemon()
                } catch{
                    print("error")
                }
            }
            
        }
            
    }
}


#Preview {
    CharacterView()
}
