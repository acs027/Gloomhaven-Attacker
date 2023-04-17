//
//  DemolitionistPerk.swift
//  CardFlip
//
//  Created by Furkan Eken on 9.04.2023.
//

import SwiftUI

struct DemolitionistPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("Demolitionist")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack {
                Group {
                    HStack{
                        // Remove four (+0) cards
                        Text("Remove four")
                        plusZero()
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
                        // Remove two (-1) cards
                        Text("Remove two")
                        minusOne()
                        Text("cards")
                        
                        Spacer()

                        Button{
                            deck.buttonArray[1].toggle()
                            rowTwo(condition: deck.buttonArray[1])
                        } label: {
                            let img = deck.buttonArray[1] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[6].toggle()
                            rowTwo(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Remove one (-2) card and one (+1) card
                        Text("Remove one")
                        minusTwo()
                        Text("card and one")
                        plusOne()
                        Text("card")
                        
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
                        // Replace one (-1) card with one (+0) POISON card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                minusOne()
                                Text("card with one")
                            }
                            HStack {
                                plusZero()
                                Text("POISON")
                                Image("poison").perkIconMod()
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
                        // Add one (+2) card
                        Text("Add one")
                        plusTwo()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[5].toggle()
                            rowSix(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[7].toggle()
                            rowSix(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one (+1) card with one (+2) EARTH card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusOne()
                                Text("card with one")
                                plusTwo()
                                Image("earth").perkIconMod()
                                Text("card")
                            }
                            HStack {
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
                        Button{
                            deck.buttonArray[10].toggle()
                            rowSeven(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace one (+1) card with one (+2) FIRE card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Replace one")
                                plusOne()
                                Text("card with one")
                                plusTwo()
                                Image("fire").perkIconMod()
                                Text("card")
                            }
                            HStack {
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[11].toggle()
                            rowEight(condition: deck.buttonArray[11])
                        } label: {
                            let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[12].toggle()
                            rowEight(condition: deck.buttonArray[12])
                        } label: {
                            let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        
                    }
                    
                    HStack {
                        // Add one (+0) All adjacent enemies suffer 1 damage card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack{
                                Text("Add one")
                                plusZero()
                                Text("All adjacent enemies")
                            }
                            HStack {
                                Text(" suffer 1 damage card")
                            }
                        }
                        
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
    // Remove four +0 cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "zero", count: 4)
    }
    
    // Remove two -1 cards
    func rowTwo(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    
    // Remove one (-2) card and one (+1) card
    func rowThree(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusTwo")
        deck.autoCard(condition: !condition, cardName: "plusOne")
    }
    
    // Replace one (+0) card with one (+2) MUDDLE card
    func rowFour(condition: Bool) {
        deck.replaceCard(addCardName: "DemolitionistMuddle", remCardName: "zero")
    }
    
    // Replace one (-1) card with one (+0) POISON card
    func rowFive(condition: Bool) {
        deck.replaceCard(addCardName: "DemolitionistPoison", remCardName: "minusOne")
    }
    
    // Add one (+2) card
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DemolitionistplusTwo")
    }
    
    // Replace one (+1) card with one (+2) EARTH card
    func rowSeven(condition: Bool) {
        deck.replaceCard(addCardName: "DemolitionistEarth", remCardName: "plusOne")
    }
    
    // Replace one (+1) card with one (+2) FIRE card
    func rowEight(condition: Bool) {
        deck.replaceCard(addCardName: "DemolitionistFire", remCardName: "plusOne")
    }
    
    // Add one (+0) All adjacent enemies suffer 1 damage card
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "DemolitionistAdjacentSuffer")
    }
}

struct DemolitionistPerk_Previews: PreviewProvider {
    static var previews: some View {
        DemolitionistPerk(deck: Deck())
    }
}

