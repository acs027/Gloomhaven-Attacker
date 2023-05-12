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
                        if decks.decks.count < 4 {
                            Text("Add new character")
                        }
                    }
                    .disabled(decks.decks.count > 3)
                    Spacer()
                    
                    EditButton()
                }
                .foregroundColor(.black)
                .font(.title3)
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
                                        .frame(width: getRect().width / 40)
                                        .padding(.trailing)
                                    Text(deste.characterName)
                                        .font(.title2)
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
            
            Spacer()
            
            HStack{
                NavigationLink(destination: CreditsView()) {
                    Text("Credits")
                        .font(.title2)
                        .foregroundColor(.black)
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
            }.padding(.bottom, 20)
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

