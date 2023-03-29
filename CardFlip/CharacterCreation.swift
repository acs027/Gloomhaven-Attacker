//
//  CharacterCreation.swift
//  CardFlip
//
//  Created by Furkan Eken on 27.03.2023.
//

import SwiftUI

struct CharacterCreation: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var decks: Decks
    @State private var deck = Deck()
    @State private var characterName = ""
    @State private var characterClass = "Brute"
    
    var body: some View {
            
            Form{
                TextField("Character Name" ,text: $characterName)
                
                Picker("Class", selection: $characterClass) {
                    ForEach(Classes.allCases, id: \.self){ klass in
                        Text(klass.rawValue).tag(klass.rawValue)
                    }
                }.pickerStyle(.wheel)
                
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.red)

                    Spacer()

                    Button("Add") {
                        deck.characterCreation(characterName, characterClass)
                        decks.addDeck(deck: deck)
                        dismiss()
                    }
                    .disabled(decks.decks.count > 3)
                    .buttonStyle(.borderless)

                }
            }
    }
    
    enum Classes: String, CaseIterable {
        case Brute
        case Spellweaver
        case Mindthief
        case Scoundrel
        case Tinkerer
        case Cragheart
        case BeastTyrant
        case Berserker
        case Doomstalker
        case Elementalist
        case Nightshroud
        case Plagueherald
        case Quartermaster
        case Sawbones
        case Soothsinger
        case Summoner
        case Sunkeeper
        
        case Diviner
        
        case RedGuard
        case Hatchet
        case Demolitionist
        case Voidwarden

    }
}

