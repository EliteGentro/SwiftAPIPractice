//
//  CharacterView.swift
//  ApiPractice
//
//  Created by Humberto Genaro Cisneros Salinas on 03/10/25.
//

import SwiftUI

struct CharacterView: View {
    //Main view model that contains an array of pokemon
    @State var charactersVM = PokemonViewModel()
    //Error handling alert
    @State private var showAlert = false
    
    
    var body: some View {
        NavigationStack{
            if charactersVM.isLoading{ //Loading view
                ProgressView("Loading Pokemon")
            } else{ //View once loaded
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
                    
                    
                }
            }
            
        }
        .task {
            do{
                try await charactersVM.getCharactersPokemon() //20 GET requests of pokemon
            } catch{
                showAlert = true //Error
            }
        }
        .alert(isPresented: $showAlert) { //General error alert that adapts to the errorDetail
            Alert(
                title: Text("Error Getting Data"),
                message: Text("There was an error geting Pokemon Data. ("+charactersVM.errorDetail+")")
            )
        }
    }
}


#Preview {
    CharacterView()
}
