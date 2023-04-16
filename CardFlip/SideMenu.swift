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
        VStack(alignment: .leading, spacing: 2) {
            
            Image("ghlogo")
                .resizable()
                .scaledToFit()
                .frame(width: getRect().width - 100)
                .padding(.horizontal, 5)
                
            Group{
                Button{
                    deck.deckReset()
                } label: {
                    Text("Reset Decks")
                        .foregroundColor(.red)
                        .font(.system(size: (getRect().width / 20) + 2))
                        .shadow(color: .primary, radius: 1)
                }
                
                Button{
                    deck.undo()
                } label: {
                    Text("Undo")
                        .foregroundColor(.red)
                        .font(.system(size: (getRect().width / 20) + 2))
                        .shadow(color: .primary, radius: 1)
                }
                Button{
                    deck.shuffleUndrawn()
                } label: {
                    Text("Shuffle Undrawn")
                        .foregroundColor(.red)
                        .font(.system(size: (getRect().width / 20) + 2))
                        .shadow(color: .primary, radius: 1)
                }
            }.padding(.horizontal)
            
            Divider()
                .frame(height: 2)
                .overlay(.gray)
                .padding()
            
            Group{
                Button{
                    deck.addBless()
                
                } label: {
                    HStack{
                        Text("Add Bless")
                            .font(.system(size: (getRect().width / 20) + 2))
                        Image("blessP").perkIconMod()
                        Text("(\(String(deck.blessCount)))")
                            .font(.system(size: (getRect().width / 20) + 2))
                    }
                }
                Button{
                    deck.addCurse()

                } label: {
                    HStack{
                        Text("Add Curse")
                            .font(.system(size: (getRect().width / 20) + 2))
                        Image("curseP").perkIconMod()
                        Text("(\(String(deck.curseCount)))")
                            .font(.system(size: (getRect().width / 20) + 2))
                    }
                }
                Button{
                    deck.addMinusOne()
                 
                } label: {
                    HStack{
                        Text("Add")
                            .font(.system(size: (getRect().width / 20) + 2))
                        minusOne()
                        Text("(\(String(deck.minusoneCount)))")
                            .font(.system(size: (getRect().width / 20) + 2))
                    }
                }
            }.padding(.horizontal)
            
            Divider()
                .frame(height: 2)
                .overlay(.gray)
                .padding()
            
            Group{
                HStack{
                    Button{
                        showingSheet.toggle()
                    } label: {
                        Text("Add new character")
                            .font(.system(size: (getRect().width / 20) + 2))
                    }
                    .disabled(decks.decks.count > 3)
                    
                    Spacer()
                    
                    EditButton()
                }
                .padding(.bottom)
                List {
                    ForEach(decks.decks, id: \.id) { deste in
                        NavigationLink (destination: PerkView(deck: deste).environmentObject(decks)){
                            HStack{
                                Image(deste.characterClass)
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.primary)
                                    .scaledToFill()
                                    .frame(width: getRect().width / 20)
                                    .padding(.trailing)
                                Text(deste.characterName)
                                    .font(.system(size: getRect().width / 20))
                            }
                        }
                    }
                    .onDelete(perform: delete)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .frame(height: UIScreen.screenHeight * 0.3)
            }.padding(.horizontal)
            
            Button{ } label: {
                HStack{
                    Image(systemName: "gearshape")
                    Text("Settings")
                        .font(.system(size: (getRect().width / 20) + 2))
                }
            }.padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(height: UIScreen.screenHeight)
        .background(
            Image("sidemenubg")
                .resizable()
                .frame(width: getRect().width - 90)
                .ignoresSafeArea()
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
