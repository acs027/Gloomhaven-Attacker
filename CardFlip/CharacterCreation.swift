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
    @State private var spoiler = false
    
    var body: some View {
            
            Form{
                
                TextField("Character Name", text: $characterName)
                
                Picker("Class", selection: $characterClass) {
                    ForEach(Classes.allCases, id: \.self){ klass in
                
                        Text(spoiler ? String(describing: klass) : klass.rawValue).tag(String(describing: klass))

                    }
                }.pickerStyle(.wheel)
                
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.red)

                    Button {
                        spoiler.toggle()
                    } label: {
                        Text("Spoiler")
                    }

                    Button("Add") {
                        deck.characterCreation(characterName, characterClass)
                        decks.addDeck(deck: deck)
                        dismiss()
                    }
                    .disabled(decks.decks.count > 3 || characterName == "")
                    .buttonStyle(.borderless)

                }
            }
    }
    
    enum Classes: String, CaseIterable {
        case Brute = "Brute"
        case Spellweaver = "Spellweaver"
        case Mindthief = "Mindthief"
        case Scoundrel = "Scoundrel"
        case Tinkerer = "Tinkerer"
        case Cragheart = "Cragheart"
        case BeastTyrant = "Two Minis"
        case Berserker = "Lightning Bolt"
        case Doomstalker = "Angry Face"
        case Elementalist = "Triforce"
        case Nightshroud = "Eclipse"
        case Plagueherald = "Cthulhu"
        case Quartermaster = "Three Spears"
        case Sawbones = "Saw"
        case Soothsinger = "Music Note"
        case Summoner = "Circles"
        case Sunkeeper = "Sun"
        
        case Diviner = "Diviner"
        
        case RedGuard = "Red Guard"
        case Hatchet = "Hatchet"
        case Demolitionist = "Demolitionist"
        case Voidwarden = "Voidwarden"

    }
}
