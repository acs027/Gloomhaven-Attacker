//
//  Voidwarden.swift
//  CardFlip
//
//  Created by Furkan Eken on 9.04.2023.
//

import SwiftUI

struct VoidwardenPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("Voidwarden")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack {
                Text(String(deck.cards.count))
                Group {
                    HStack{
                        // Remove two (-1) cards
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
                        // Remove one (-2) cards
                        Text("Remove one")
                        minusTwo()
                        Text("card")
                        
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
                        // Replace one (+0) card with one (+1) DARK card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                                plusOne()
                                Image("dark").perkIconMod()
                                Text("card")
                            }
                            HStack {
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
                            deck.buttonArray[6].toggle()
                            rowThree(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one (+0) card with one (+1) FROST card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                                plusOne()
                                Image("frost").perkIconMod()
                                Text("card")
                            }
                            HStack {
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[3].toggle()
                            rowFour(condition: deck.buttonArray[3])
                        } label: {
                            let img = deck.buttonArray[3] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[8].toggle()
                            rowFour(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one (-1) card with one (+0) HEAL 1 (Ally) card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                minusOne()
                                Text("card with one")
                            }
                            HStack {
                                plusZero()
                                Text("Heal")
                                Image("heal").perkIconMod()
                                Text("1 (Ally) card")
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[4].toggle()
                            rowFive(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[5].toggle()
                            rowFive(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one (+1) HEAL 1 (Ally) card
                        Text("Add one")
                        plusOne()
                        Text("Heal")
                        Image("heal").perkIconMod()
                        Text("1 (Ally) card")
                        
                        Spacer()
                        
                        
                        Button{
                            deck.buttonArray[7].toggle()
                            rowSix(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[10].toggle()
                            rowSix(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[12].toggle()
                            rowSix(condition: deck.buttonArray[12])
                        } label: {
                            let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one (+1) POISON card
                        Text("Add one")
                        plusOne()
                        Text("POISON")
                        Image("poison").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[9].toggle()
                            rowSeven(condition: deck.buttonArray[9])
                        } label: {
                            let img = deck.buttonArray[9] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one (+3) card
                        Text("Add one")
                        plusThree()
                        Text("card")
                        
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
                        // Add one (+1) CURSE card
                        Text("Add one")
                        plusOne()
                        Text("CURSE")
                        Image("curseP").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[14].toggle()
                            rowNine(condition: deck.buttonArray[14])
                        } label: {
                            let img = deck.buttonArray[14] ? "checkmark.square" : "square"
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
                }
            }
        }
        .padding(.horizontal)
    }
    // Remove two (-1) cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    
    // Remove one (-2) cards
    func rowTwo(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusTwo")
    }
    
    // Replace one (+0) card with one (+1) DARK card
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "VoidwardenDark", cardNameB: "zero")
    }
    
    // Replace one (+0) card with one (+1) FROST card
    func rowFour(condition: Bool) {
        deck.replaceCard(addCardName: "VoidwardenFrost", remCardName: "zero")
    }
    
    // Replace one (-1) card with one (+0) HEAL 1 (Ally) card
    func rowFive(condition: Bool) {
        deck.replaceCard(addCardName: "VoidwardenzeroHeal", remCardName: "minusOne")
    }
    
    // Add one (+1) HEAL 1 (Ally) card
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "VoidwardenplusOneHeal")
    }
    
    // Add one (+1) POISON card
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "VoidwardenPoison")
    }
    
    // Add one (+3) card
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "VoidwardenplusThree")
    }
    
    // Add one (+1) CURSE card
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "VoidwardenCurse")
    }
}

struct VoidwardenPerk_Previews: PreviewProvider {
    static var previews: some View {
        VoidwardenPerk(deck: Deck())
    }
}


