//
//  DoomstalkerPerk.swift
//  CardFlip
//
//  Created by ali cihan on 3.04.2023.
//

import SwiftUI

struct DoomstalkerPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("Doomstalker")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack {
                Text(String(deck.cards.count))
                Group {
                    HStack{
                        //Remove two -1 cards
                        Text("Remove two")
                        minusOne()
                        Text("cards")
                        
                        Spacer()
                        Button{
                            deck.buttonArray[0].toggle()
                            rowOne(condition: deck.buttonArray[0])
                        } label: {
                            let img = deck.buttonArray[0] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[1].toggle()
                            rowOne(condition: deck.buttonArray[1])
                        } label: {
                            let img = deck.buttonArray[1] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace two +0 card with two +1 cards
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace two")
                                plusZero()
                                Text("card with two")
                            }
                            HStack {
                                plusOne()
                                Text("cards")
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        Button{
                            deck.buttonArray[2].toggle()
                            rowTwo(condition: deck.buttonArray[2])
                        } label: {
                            let img = deck.buttonArray[2] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[3].toggle()
                            rowTwo(condition: deck.buttonArray[3])
                        } label: {
                            let img = deck.buttonArray[3] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[4].toggle()
                            rowTwo(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add two rolling +1 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        plusOne()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[5].toggle()
                            rowThree(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[6].toggle()
                            rowThree(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one +2 muddle card
                        Text("Add one")
                        plusTwo()
                        Text("MUDDLE")
                        Image("muddle").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[7].toggle()
                            rowFour(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one +1 poison card
                        Text("Add one")
                        plusOne()
                        Text("POISON")
                        Image("poison").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[8].toggle()
                            rowFive(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one +1 wound card
                        Text("Add one")
                        plusOne()
                        Text("WOUND")
                        Image("wound").perkIconMod()
                        Text("card")
                        
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
                        // Add one +1 immobilize card
                        Text("Add one")
                        plusOne()
                        Text("IMMOBILIZE")
                        Image("immobilize").perkIconMod()
                        Text("card")
                        
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
                        // Add one +0 stun card
                        Text("Add one")
                        plusZero()
                        Text("STUN")
                        Image("stun").perkIconMod()
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
                        // Add one rolling add_target card
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        Text("ADD TARGET")
                        Image("add_target").perkIconMod()
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
                        //ignore negative scenario effects
                        Text("Ignore negative scenario effects")
                        
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
    // Remove two -1 cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    // Replace two +0 card with two +1 cards
    func rowTwo(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "DoomstalkerplusOne", countA: 2, cardNameB: "zero", countB: 2)
    }
    
    // Add two rolling +1 cards
    func rowThree(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DoomstalkerRollingplusOne", count: 2)
    }
    
    // Add one +2 muddle card
    func rowFour(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DoomstalkerMuddle")
    }
    
    // Add one +1 poison card
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DoomstalkerPoison")
    }
    
    // Add one +1 wound card
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DoomstalkerWound")
    }
    
    // Add one +1 immobilize card
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DoomstalkerImmob")
    }
    
    // Add one +0 stun card
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DoomstalkerStun")
    }
    
    // Add one rolling add_target card
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "DoomstalkerAddTarget")
    }
    
    // Ignore negative scenario effects
    func rowTen(condition: Bool) {
        deck.refresh()
    }
}

struct DoomstalkerPerk_Previews: PreviewProvider {
    static var previews: some View {
        DoomstalkerPerk(deck: Deck())
    }
}
