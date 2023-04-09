//
//  HatchetPerk.swift
//  CardFlip
//
//  Created by Furkan Eken on 9.04.2023.
//

import SwiftUI

struct HatchetPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("hatchet")
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
                        // Replace one (+0) card with one (+2) MUDDLE card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusTwo()
                                Text("MUDDLE")
                                Image("muddle").perkIconMod()
                                Text("card")
                            }
                        }
                        
                        Spacer()

                        Button{
                            deck.buttonArray[6].toggle()
                            rowTwo(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one (+0) card with one (+1) POISON card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusOne()
                                Text("POISON")
                                Image("poison").perkIconMod()
                                Text("card")
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
                    }
                    
                    HStack {
                        // Replace one (+0) card with one (+1) WOUND card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusOne()
                                Text("WOUND")
                                Image("wound").perkIconMod()
                                Text("card")
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
                    }
                    
                    HStack {
                        // Replace one (+0) card with one (+1) IMMOB card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusOne()
                                Text("IMMOBILIZE")
                                Image("immobilize").perkIconMod()
                                Text("card")
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
                    }
                    
                    HStack {
                        // Replace one (+0) card with one (+1) PUSH card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusOne()
                                Text("PUSH")
                                Image("push").perkIconMod()
                                Text("card")
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[5].toggle()
                            rowSix(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one (+0) card with one (+0) STUN card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusZero()
                                Text("STUN")
                                Image("stun").perkIconMod()
                                Text("card")
                            }
                        }
                        
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
                        // Replace one (+1) card with one (+1) STUN card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusOne()
                                Text("card with one")
                            }
                            HStack {
                                plusOne()
                                Text("STUN")
                                Image("stun").perkIconMod()
                                Text("card")
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[10].toggle()
                            rowEight(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one (+2) WIND card
                        Text("Add one")
                        plusTwo()
                        Image("wind").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[11].toggle()
                            rowNine(condition: deck.buttonArray[11])
                        } label: {
                            let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[12].toggle()
                            rowNine(condition: deck.buttonArray[12])
                        } label: {
                            let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[8].toggle()
                            rowNine(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one (+1) card with one (+3) card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusOne()
                                Text("card with one")
                                plusThree()
                                Text("card")
                            }
                            HStack {
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[14].toggle()
                            rowTen(condition: deck.buttonArray[14])
                        } label: {
                            let img = deck.buttonArray[14] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[13].toggle()
                            rowTen(condition: deck.buttonArray[13])
                        } label: {
                            let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[7].toggle()
                            rowTen(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    // Remove four +0 cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    
    // Replace one (+0) card with one (+2) MUDDLE card
    func rowTwo(condition: Bool) {
        deck.replaceCard(addCardName: "HatchetMuddle", remCardName: "zero")
    }
    
    // Replace one (+0) card with one (+1) POISON card
    func rowThree(condition: Bool) {
        deck.replaceCard(addCardName: "HatchetPoison", remCardName: "zero")
    }
    
    // Replace one (+0) card with one (+1) WOUND card
    func rowFour(condition: Bool) {
        deck.replaceCard(addCardName: "HatchetWound", remCardName: "zero")
    }
    
    // Replace one (+0) card with one (+1) IMMOB card
    func rowFive(condition: Bool) {
        deck.replaceCard(addCardName: "HatchetImmob", remCardName: "zero")
    }
    
    // Replace one (+0) card with one (+1) PUSH card
    func rowSix(condition: Bool) {
        deck.replaceCard(addCardName: "HatchetPush", remCardName: "zero")
    }
    
    // Replace one (+0) card with one (+0) STUN card
    func rowSeven(condition: Bool) {
        deck.replaceCard(addCardName: "HatchetZeroStun", remCardName: "zero")
    }
    
    // Replace one (+1) card with one (+1) STUN card
    func rowEight(condition: Bool) {
        deck.replaceCard(addCardName: "HatchetplusOneStun", remCardName: "plusOne")
    }
    
    // Add one (+2) WIND card
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "HatchetWind")
    }
    
    // Replace one (+1) card with one (+3) card
    func rowTen(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "HatchetplusThree", cardNameB: "plusOne")
    }
}

struct HatchetPerk_Previews: PreviewProvider {
    static var previews: some View {
        HatchetPerk(deck: Deck())
    }
}

