//
//  PlagueHeraldPerk.swift
//  CardFlip
//
//  Created by ali cihan on 3.04.2023.
//

import SwiftUI

struct PlagueHeraldPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("Plagueherald")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack {
                Text(String(deck.cards.count))
                Group {
                    HStack{
                        // Replace one -2 card with one +0 card --1
                        Text("Replace one")
                        minusTwo()
                        Text("card with one")
                        plusZero()
                        Text("card")
                        
                        Spacer()
                        Button{
                            deck.buttonArray[0].toggle()
                            rowOne(condition: deck.buttonArray[0])
                        } label: {
                            let img = deck.buttonArray[0] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one -1 card with one +1 card --2
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                minusOne()
                                Text("card with one")
                                plusOne()
                            }
                            HStack {
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
                        
                        
                        Spacer()
                        Button{
                            deck.buttonArray[1].toggle()
                            rowTwo(condition: deck.buttonArray[1])
                        } label: {
                            let img = deck.buttonArray[1] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[2].toggle()
                            rowTwo(condition: deck.buttonArray[2])
                        } label: {
                            let img = deck.buttonArray[2] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one +0 card with one +2 card --2
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                                plusTwo()
                            }
                            HStack {
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[3].toggle()
                            rowThree(condition: deck.buttonArray[3])
                        } label: {
                            let img = deck.buttonArray[3] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[4].toggle()
                            rowThree(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add two +1 cards --1
                        Text("Add two")
                        plusOne()
                        Text("cards")
                        
                        Spacer()
                        
                       
                        Button{
                            deck.buttonArray[5].toggle()
                            rowFour(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one +1 wind card --3
                        Text("Add one")
                        plusOne()
                        Image("wind").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[6].toggle()
                            rowFive(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[7].toggle()
                            rowFive(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[8].toggle()
                            rowFive(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add three rolling poison cards --1
                        Text("Add three")
                        Image("rolling").perkIconMod()
                        Text("POISON")
                        Image("poison").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[9].toggle()
                            rowSix(condition: deck.buttonArray[9])
                        } label: {
                            let img = deck.buttonArray[9] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add two rolling curse cards --1
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("CURSE")
                        Image("curseP").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[10].toggle()
                            rowSeven(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add two rolling immobilize cards --1
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("IMMOBILIZE")
                        Image("immobilize").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[11].toggle()
                            rowEight(condition: deck.buttonArray[11])
                        } label: {
                            let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one rolling stun card --2
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        Text("STUN")
                        Image("stun").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[12].toggle()
                            rowNine(condition: deck.buttonArray[12])
                        } label: {
                            let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[13].toggle()
                            rowNine(condition: deck.buttonArray[13])
                        } label: {
                            let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Ignore negative scenario effects and add one +1 card --1
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Ignore negative scenario effects and")
                            }
                            HStack {
                                Text("add one")
                                plusOne()
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[14].toggle()
                            rowTen(condition: deck.buttonArray[14])
                        } label: {
                            let img = deck.buttonArray[14] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    // Replace one -2 card with one +0 card --1
    func rowOne(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "Plagueheraldzero", cardNameB: "minusTwo")
    }
    // Replace one -1 card with one +1 card --2
    func rowTwo(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "PlagueheraldplusOne", cardNameB: "minusOne")
    }
    
    // Replace one +0 card with one +2 card --2
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "PlagueheraldplusTwo", cardNameB: "zero")
    }
    
    // Add two +1 cards --1
    func rowFour(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "PlagueheraldplusOne", count: 2)
    }
    
    // Add one +1 wind card --3
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "PlagueheraldWind")
    }
    
    // Add three rolling poison cards --1
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "PlagueheraldPoison", count: 3)
    }
    
    // Add two rolling curse cards --1
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "PlagueheraldCurse", count: 2)
    }
    
    // Add two rolling immobilize cards --1
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "PlagueheraldImmob", count: 2)
    }
    
    // Add one rolling stun card --2
    func rowNine(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "PlagueheraldStun")
    }
    
    // Ignore negative scenario effects and add one +1 card --1
    func rowTen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "PlagueheraldplusOne")
    }
}

struct PlagueHeraldPerk_Previews: PreviewProvider {
    static var previews: some View {
        PlagueHeraldPerk(deck: Deck())
    }
}
