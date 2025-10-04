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
        NavigationStack{
            VStack{
                Text("PokeDex")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                List{
                    ForEach(charactersVM.arrCharacters){pokemon in
                        NavigationLink{
                            CharacterDetailView(pokemon: pokemon)
                        } label:{
                            CharacterRow(pokemon: pokemon)
                        }
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
}


#Preview {
    CharacterView()
}
