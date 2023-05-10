//
//  NightshroudPerk.swift
//  CardFlip
//
//  Created by ali cihan on 3.04.2023.
//

import SwiftUI

struct NightshroudPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("nightshroud")
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
                        Button{
                            deck.buttonArray[1].toggle()
                            rowOne(condition: deck.buttonArray[1])
                        } label: {
                            let img = deck.buttonArray[1] ? "checkmark.square" : "square"
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
                            deck.buttonArray[2].toggle()
                            rowTwo(condition: deck.buttonArray[2])
                        } label: {
                            let img = deck.buttonArray[2] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one -1 dark card
                        Text("Add one")
                        minusOne()
                        Image("dark").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[3].toggle()
                            rowThree(condition: deck.buttonArray[3])
                        } label: {
                            let img = deck.buttonArray[3] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        .disabled(deck.buttonArray[5])
                        Button{
                            deck.buttonArray[4].toggle()
                            rowThree(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        .disabled(deck.buttonArray[6])
                    }
                    
                    HStack {
                        // Replace one -1 dark card with one +1 dark card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                minusOne()
                                Image("dark").perkIconMod()
                                Text("card with one")
                                
                            }
                            HStack {
                                plusOne()
                                Image("dark").perkIconMod()
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                       
                        Button{
                            deck.buttonArray[5].toggle()
                            rowFour(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        .disabled(!deck.buttonArray[3])
                        Button{
                            deck.buttonArray[6].toggle()
                            rowFour(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        .disabled(!deck.buttonArray[4])
                    }
                    
                    HStack {
                        // Add one +1 invisible card
                        Text("Add one")
                        plusOne()
                        Text("INVISIBLE")
                        Image("invisible").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
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
                        // add three rolling muddle cards
                        Text("Add three")
                        Image("rolling").perkIconMod()
                        Text("MUDDLE")
                        Image("muddle").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[9].toggle()
                            rowSix(condition: deck.buttonArray[9])
                        } label: {
                            let img = deck.buttonArray[9] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[10].toggle()
                            rowSix(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // add two rolling heal 1 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("Heal")
                        Image("heal").perkIconMod()
                        Text("1 card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[11].toggle()
                            rowSeven(condition: deck.buttonArray[11])
                        } label: {
                            let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // add two rolling curse cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("CURSE")
                        Image("curseP").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[12].toggle()
                            rowEight(condition: deck.buttonArray[12])
                        } label: {
                            let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // add one rolling add_target card
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        Text("ADD TARGET")
                        Image("add_target").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[13].toggle()
                            rowNine(condition: deck.buttonArray[13])
                        } label: {
                            let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Ignore negative scenario effects and add two +1 cards
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Ignore negative item effects and add two")
                            }
                            HStack {
                                plusOne()
                                Text("cards")
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
    // Remove two -1 cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    // Remove four +0 cards
    func rowTwo(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "zero", count: 4)
    }
    
    // Add one -1 dark card
    func rowThree(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "NightshroudminusOneDark")
    }
    
    // Replace one -1 dark card with one +1 dark card
    func rowFour(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "NightshroudplusOneDark", cardNameB: "NightshroudminusOneDark")
        
    }
    
    // Add one +1 invisible card
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "NightshroudInvis")
    }
    
    // add three rolling muddle cards
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "NightshroudMuddle", count: 3)
    }
    
    // add two rolling heal 1 cards
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "NightshroudHeal", count: 2)
    }
    
    // add two rolling curse cards
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "NightshroudCurse", count: 2)
    }
    
    // add one rolling add_target card
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "NightshroudAddTarget")
    }
    
    // Ignore negative scenario effects and add two +1 cards
    func rowTen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "NightshroudplusOne", count: 2)
    }
}

struct NightshroudPerk_Previews: PreviewProvider {
    static var previews: some View {
        NightshroudPerk(deck: Deck())
    }
}
