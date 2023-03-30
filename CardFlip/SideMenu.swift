//
//  SideMenu.swift
//  denemetahtası
//
//  Created by Furkan Eken on 9.03.2023.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    @EnvironmentObject var decks: Decks
    @ObservedObject var deck: Deck
    @State var Characters = [Character]()
    @State private var showingSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
                .frame(height: 30)
                List{
                    Button{
                        deck.deckReset()
                    } label: {
                        Text("Reset Decks")
                            .foregroundColor(.red)
                    }
                    Button{
                        deck.undo()
                    } label: {
                        Text("Undo")
                            .foregroundColor(.red)
                    }
                    Button{
                        deck.shuffleUndrawn()
                    } label: {
                        Text("Shuffle Undrawn")
                            .foregroundColor(.red)
                    }
                }

                List{
                    Button{
                        deck.addBless()
                    
                    } label: {
                        HStack{
                            Text("Add Bless")
                            Image(systemName: "cross")
                            Text(String(deck.blessCount))
                        }
                    }
                    Button{
                        deck.addCurse()
      
                    } label: {
                        HStack{
                            Text("Add Curse")
                            Image(systemName: "circle")
                            Text(String(deck.curseCount))
                        }
                    }
                    Button{
                        deck.addMinusOne()
                     
                    } label: {
                        HStack{
                            Text("Add -1")
                            Image(systemName: "minus")
                            Text(String(deck.minusoneCount))
                        }
                    }
                }
                List {
                    EditButton()
                    ForEach(decks.decks, id: \.id) { deste in
                        NavigationLink {
                            PerkView(deck: deste)
                        } label: {
                            Text("\(deste.characterName) \(deste.characterClass)")
                        }
                        
        
                    }
                    .onDelete(perform: delete)
                    
                    Button{
                        showingSheet.toggle()
                    } label: {
                        Text("Create a new character")
                    }
                    .disabled(decks.decks.count > 3)
                    
                }
                List{
                    Button{} label: {
                        HStack{
                            Image(systemName: "pencil")
                            Text("Settings")
                        }
                    }
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(height: UIScreen.screenHeight)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .sheet(isPresented: $showingSheet) {
            CharacterCreation()
                .environmentObject(decks)
                .presentationDetents([.medium, .large])
        }
    }
    
    func delete(at offsets: IndexSet) {
        decks.removeDeck(at: offsets)
    }
}


extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
