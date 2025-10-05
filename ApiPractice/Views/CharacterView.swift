//
//  PhotoView.swift
//  Foto
//
//  Created by Humberto Genaro Cisneros Salinas on 01/10/25.
//

import SwiftUI
import Network

struct CharacterView: View {
    @State var charactersVM = PokemonViewModel()
    @State private var showAlert = false
    let monitor = NWPathMonitor()
    
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
                        showAlert = true
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error Getting Data"),
                        message: Text("There was an error geting Pokemon Data Ensure you are connected to the Internet")
                    )
                }
                
            }
            
        }
    }
}


#Preview {
    CharacterView()
}
