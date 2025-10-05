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
            Image("Card") //Background pokemon card image goes behind
                .resizable()
                .scaledToFit()
            VStack() {
                Spacer().frame(height: 110) //Spacer for vertical offset
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer().frame(height: 130) //Spacer for vertical offset
                AsyncImage(url: URL(string:pokemon.sprites.front_shiny!))
                    .scaledToFit()
                    .frame(width: 200, height: 80)
                Spacer().frame(height: 50) //Spacer for vertical offset
                VStack(alignment: .leading, spacing: 4) { //Aligned to the left
                    HStack {
                        Text("Height: ").fontWeight(.bold)
                        Text("\(pokemon.height)")
                    }
                    
                    HStack {
                        Text("Weight: ").fontWeight(.bold)
                        Text("\(pokemon.weight)")
                    }
                    //If it has more than one type it will show Abilities
                    Text(pokemon.abilities.count > 1 ? "Abilities:" : "Ability:")
                        .fontWeight(.bold)
                    HStack {
                        ForEach(pokemon.abilities) { ability in
                            Text(ability.ability.name.capitalized)
                        }
                    }
                    //If it has more than one type it will show Types
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
                //Made maxWIDTH infinity to be able to aligh to the left.
                
                
                Spacer() //Bottom Spacer
            }
            
        }
        
    }
}

#Preview {
    CharacterDetailView(pokemon: Pokemon.mock)
}
