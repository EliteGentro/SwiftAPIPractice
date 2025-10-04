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
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .fontWeight(.bold)
                    .offset(y:110)
                AsyncImage(url: URL(string:pokemon.sprites.front_shiny!))
                    .scaledToFill()
                    .frame(width: 200, height: 80)
                    .offset(y:200)
                HStack{
                    VStack(alignment: .leading){
                        VStack{
                            HStack {
                                Text("Height:").fontWeight(.bold)
                                Text("\(pokemon.height)")
                            }
                            HStack {
                                Text("Weight:").fontWeight(.bold)
                                Text("\(pokemon.weight)")
                            }
                        }
                        
                        Text("Abilities:")
                            .fontWeight(.bold)
                        
                        ForEach(pokemon.abilities) { ability in
                            Text(ability.ability.name.capitalized)
                        }
                        
                        Text(pokemon.types.count > 1 ? "Types:" : "Type:")
                            .fontWeight(.bold)
                        
                        ForEach(pokemon.types) { type in
                            Text(type.type.name.capitalized)
                        }
                    }
                        .offset(y:300)
                        .padding(.horizontal,30)
                        .font(.caption)
                        
                    Spacer()
                }
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    CharacterDetailView(pokemon: Pokemon.mock)
}
