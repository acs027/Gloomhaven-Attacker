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
    
    @State private var pickedClasses = [String]()
    
    var body: some View {
            
            Form{
                
                TextField("Character Name", text: $characterName)
                
                Picker("Class", selection: $characterClass) {
                    ForEach(Classes.allCases, id: \.self){ klass in
                        if !pickedClasses.contains(String(describing: klass)){
                            pickerObj(klass: spoiler ? String(describing: klass) : klass.rawValue, image: String(describing: klass)).tag(String(describing: klass))
                        }
                    }
                }.pickerStyle(.wheel)
                
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.red)

                    Button("Add") {
                        deck.characterCreation(characterName, characterClass)
                        decks.addDeck(deck: deck)
                        dismiss()
                    }
                    .disabled(decks.decks.count > 3 || characterName == "")
                    .buttonStyle(.borderless)
                    
                    Spacer()
                    
                    Button {
                        spoiler.toggle()
                    } label: {
                        Text("Reveal Spoiler")
                    }

                }
            }.onAppear{
                for klass in decks.decks {
                    pickedClasses.append(klass.characterClass)
                }
            }
            .onChange(of: pickedClasses){ _ in
                deck.refresh()
            }
    }
    
    func pickerObj (klass: String, image: String) -> some View {
        HStack{
            Image(image)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.primary)
                .scaledToFit()
            Text(klass)
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
