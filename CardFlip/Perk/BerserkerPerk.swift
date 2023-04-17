//
//  BerserkerPerk.swift
//  CardFlip
//
//  Created by ali cihan on 1.04.2023.
//

import SwiftUI

struct BerserkerPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("Berserker")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack {
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
                    }
                    
                    HStack {
                        //Remove four +0 cards
                        Text("Remove four")
                        plusZero()
                        Text("cards")
                        
                        Spacer()
                        Button{
                            deck.buttonArray[1].toggle()
                            rowTwo(condition: deck.buttonArray[1])
                        } label: {
                            let img = deck.buttonArray[1] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //Replace one -1 card with one +1 card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                minusOne()
                                Text("card with one")
                                plusOne()
                            }
                            HStack {
                                Text(" card")
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[2].toggle()
                            rowThree(condition: deck.buttonArray[2])
                        } label: {
                            let img = deck.buttonArray[2] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[3].toggle()
                            rowThree(condition: deck.buttonArray[3])
                        } label: {
                            let img = deck.buttonArray[3] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //replace one +0 card with one rolling +2 card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                                
                            }
                            HStack {
                                Image("rolling").perkIconMod()
                                plusTwo()
                                Text("card")
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[4].toggle()
                            rowFour(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[5].toggle()
                            rowFour(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add two rolling wound  cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("WOUND")
                        Image("wound").perkIconMod()
                        Text("cards")
                        
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
                    }
                    
                    HStack {
                        //add one rolling stun card
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        Text("STUN")
                        Image("stun").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[8].toggle()
                            rowSix(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[9].toggle()
                            rowSix(condition: deck.buttonArray[9])
                        } label: {
                            let img = deck.buttonArray[9] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one rolling +1 disarm card
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        plusOne()
                        Text("DISARM")
                        Image("disarm").perkIconMod()
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
                        //add two rolling heal 1 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("Heal")
                        Image("heal").perkIconMod()
                        Text("1 cards")
                        
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
                        //add one +2 fire card
                        Text("Add one")
                        plusTwo()
                        Image("fire").perkIconMod()
                        Text("cards")
                        
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
                        //ignore negative item effects
                        Text("Ignore negative item effects")
                        
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
    // Remove four +0 cards
    func rowTwo(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "zero", count: 4)
    }
    
    // Replace one -1 card with one +1 card
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "BerserkerplusOne", cardNameB: "minusOne")
    }
    
    // Replace one +0 card with one rolling +2 card
    func rowFour(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "BerserkerplusTwo", cardNameB: "zero")
    }
    
    // Add two rolling wound cards
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "BerserkerWound", count: 2)
    }
    
    // Add one rolling stun card
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "BerserkerStun")
    }
    
    // Add one rolling +1 disarm card
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "BerserkerDisarm")
    }
    
    // Add two rolling heal 1 cards
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "BerserkerHeal", count: 2)
    }
    
    // Add one +2 fire card
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "BerserkerFire")
    }
    
    // Ignore negative item effects
    func rowTen(condition: Bool) {
        deck.refresh()
    }
}

struct BerserkerPerk_Previews: PreviewProvider {
    static var previews: some View {
        BerserkerPerk(deck: Deck())
    }
}
