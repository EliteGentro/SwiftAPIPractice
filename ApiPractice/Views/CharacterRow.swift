//
//  CharacterRow.swift
//  ApiPractice
//
//  Created by Humberto Genaro Cisneros Salinas on 03/10/25.
//
import SwiftUI

//Row view of each of the pokemon in the list with name, height and weight
struct CharacterRow: View {
    let pokemon:Pokemon
    var body: some View {
        HStack{
            AsyncImage(url: URL(string : (pokemon.sprites.front_shiny!)))
                .scaledToFit()
                .frame(  width: 50, height: 50)
                .padding()
            VStack(alignment: .leading){
                HStack{
                    Text("Name:")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(pokemon.name.capitalized)
                }
                HStack{
                    Text("Height:")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("\(pokemon.height)")
                }
                HStack{
                    Text("Weight:")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("\(pokemon.weight)")
                }
                
            }
        }
    }
}

#Preview {
    CharacterRow(pokemon: Pokemon.mock)
}
