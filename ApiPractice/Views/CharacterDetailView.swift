//
//  CharacterDetailView.swift
//  ApiPractice
//
//  Created by Humberto Genaro Cisneros Salinas on 03/10/25.
//
import SwiftUI

struct CharacterDetailView: View {
    let pokemon : Pokemon
    var body: some View {
        ZStack{
            Image("Card")
                .resizable()
                .scaledToFit()
            VStack() {
                Spacer().frame(height: 110)
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer().frame(height: 130)
                AsyncImage(url: URL(string:pokemon.sprites.front_shiny!))
                    .scaledToFit()
                    .frame(width: 200, height: 80)
                Spacer().frame(height: 50)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Height: ").fontWeight(.bold)
                        Text("\(pokemon.height)")
                    }
                    
                    HStack {
                        Text("Weight: ").fontWeight(.bold)
                        Text("\(pokemon.weight)")
                    }
                    
                    Text("Abilities:")
                        .fontWeight(.bold)
                    HStack {
                        ForEach(pokemon.abilities) { ability in
                            Text(ability.ability.name.capitalized)
                        }
                    }
                    
                    Text(pokemon.types.count > 1 ? "Types:" : "Type:")
                        .fontWeight(.bold)
                    HStack {
                        ForEach(pokemon.types) { type in
                            Text(type.type.name.capitalized)
                        }
                    }
                }
                .padding(.horizontal, 40)
                .frame(maxWidth: .infinity, alignment:.leading)
                

                Spacer()
            }
            
        }
        
    }
}

#Preview {
    CharacterDetailView(pokemon: Pokemon.mock)
}
