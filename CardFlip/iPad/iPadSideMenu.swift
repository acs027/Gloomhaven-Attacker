//
//  iPadSideMenu.swift
//  CardFlip
//
//  Created by Furkan Eken on 21.04.2023.
//

import SwiftUI

struct iPadSideMenu: View {
    @EnvironmentObject var decks: Decks
    @State var Characters = [Character]()
    @State private var showingSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Spacer()
                Image("applogo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: getRect().width / 3 - 100)
                    .padding([.horizontal], 15)
            Spacer()
            
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
                
                if !decks.decks.isEmpty{
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
                } else {
                    Rectangle()
                        .foregroundColor(Color.clear)
                        .frame(height: UIScreen.screenHeight * 0.3)
                }
            }.padding(.horizontal, 20)
            
            HStack{
                NavigationLink(destination: CreditsView()) {
                    Text("Credits")
                        .font(.system(size: (getRect().width / 20) + 2))
                }.padding(.leading, 20)
                
                Spacer()
                
//                Button{
//                } label: {
//                    HStack{
//                        Image(systemName: "gearshape")
//                        Text("Settings")
//                            .font(.system(size: (getRect().width / 20) + 2))
//                    }
//                }.padding(.horizontal, 15)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: UIScreen.screenHeight)
        .background(
            Image("sidemenubg")
                .resizable()
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

