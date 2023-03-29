//
//  DeckBuilder.swift
//  CardFlip
//
//  Created by ali cihan saraç on 28.02.2023.
//

import SwiftUI

struct DeckBuilder: View {
    @State private var character = ""
    let characters = ["Inox Brute", "Quatryl Tinkerer", "Orchid Spellweaver", "Human Scoundrel", "Savvas Cragheart", "Vermling Mindthief", "Valrath Sunkeeper", "Valrath Quartermaster", "Aesther Summoner", "Aesther Nightshroud", "Harrower Plagueherald", "Inox Berserker", "Quatryl Soothsinger", "Orchid Doomstalker", "Human Sawbones", "Savvas Elementalist", "Vermling Beast Tyrant", "Aesther Diviner"]
    var body: some View {
        Picker("Character", selection: $character) {
            ForEach(characters.sorted(), id: \.self) { character in
                Text(character)
            }
        }
    }
}

struct DeckBuilder_Previews: PreviewProvider {
    static var previews: some View {
        DeckBuilder()
    }
}
