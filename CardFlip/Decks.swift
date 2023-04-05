//
//  Decks.swift
//  CardFlip
//
//  Created by ali cihan on 27.03.2023.
//

import SwiftUI

@MainActor class Decks: ObservableObject {
    @Published private(set) var decks: [Deck]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            decks = try JSONDecoder().decode([Deck].self, from: data)
        } catch {
            decks = []
            let deck = Deck()
            decks.append(deck)
        }
        
        if decks.count < 1 {
            let deck = Deck()
            decks.append(deck)
        }
    }
    
    func addDeck(deck: Deck) {
        decks.append(deck)
        save()
    }
    
    func removeDeck(deck: Deck) {
        decks.removeAll(where: {$0.id == deck.id})
        save()
    }
    
    func removeDeck(at offsets: IndexSet) {
        decks.remove(atOffsets: offsets)
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(decks)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
}
