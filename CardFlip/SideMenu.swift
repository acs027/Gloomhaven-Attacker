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
    @State private var showingCredits = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Spacer()
                Image("applogo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: getRect().width - 100)
                    .padding([.horizontal], 15)
            Spacer()
            Group{
                Button{
                    deck.deckReset()
                } label: {
                    Text("Reset Decks")
                }
                
                Button{
                    deck.undo()
                } label: {
                    Text("Undo")
                }
                Button{
                    deck.shuffleUndrawn()
                } label: {
                    Text("Shuffle Undrawn")
                }
            }
            .foregroundColor(Color(red: 75 / 255, green: 6 / 255, blue: 14 / 255))
            .font(.title2)
            .bold()
            .padding(.leading, 20)
            .padding(.vertical, 5)
            
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
                        Image("blessP").perkIconMod()
                        Text("(\(String(deck.blessCount)))")
                    }
                }
                Button{
                    deck.addCurse()
                } label: {
                    HStack{
                        Text("Add Curse")
                        Image("curseP").perkIconMod()
                        Text("(\(String(deck.curseCount)))")
                    }
                }
                Button{
                    deck.addMinusOne()
                } label: {
                    HStack{
                        Text("Add")
                        minusOne()
                        Text("(\(String(deck.minusoneCount)))")
                    }
                }
            }
            .foregroundColor(Color(red: 24 / 255, green: 45 / 255, blue: 78 / 255))
            .font(.title2)
            .bold()
            .padding(.leading, 20)
            .padding(.vertical, 5)
            
            Divider()
                .frame(height: 2)
                .overlay(.gray)
                .padding()
            
            Group{
                HStack{
                    Button{
                        showingSheet.toggle()
                    } label: {
                        if decks.decks.count < 4 {
                            Text("Add new character")
                        }
                    }
                    .disabled(decks.decks.count > 3)
                    
                    Spacer()
                    
                    EditButton()
                }
                .foregroundColor(.black)
                .font(.title2)
                .padding(.bottom)
                
                if !decks.decks.isEmpty{
                    List {
                        ForEach(decks.decks, id: \.id) { deste in
                            NavigationLink (destination: PerkView(deck: deste).environmentObject(decks)){
                                HStack{
                                    Image(deste.characterClass.lowercased())
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.primary)
                                        .scaledToFill()
                                        .frame(width: getRect().width / 20)
                                        .padding(.trailing)
                                    Text(deste.characterName)
                                        .font(.title3)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .frame(height: UIScreen.screenHeight * 0.3)
                } else {
                    Rectangle()
                        .foregroundColor(Color.clear)
                        .frame(height: UIScreen.screenHeight * 0.3)
                }
            }.padding(.horizontal, 20)
            
            HStack{
                NavigationLink(destination: CreditsView()) {
                    Text("Credits")
                        .font(.title3)
                        .foregroundColor(.black)
                }.padding(.leading, 20)
            }
            Spacer()
        }
        .background(
            Image("sidemenubg")
                .resizable()
                .ignoresSafeArea()
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(height: UIScreen.screenHeight)
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
