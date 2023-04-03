//
//  QuartermasterPerk.swift
//  CardFlip
//
//  Created by ali cihan on 3.04.2023.
//

import SwiftUI

struct QuartermasterPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("quartermaster")
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
                        // Replace one +0 card with one +2 card
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
                        // Add two rolling +1 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
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
                        Button{
                            deck.buttonArray[6].toggle()
                            rowFour(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add three rolling muddle  cards
                        Text("Add three")
                        Image("rolling").perkIconMod()
                        Text("MUDDLE")
                        Image("muddle").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[7].toggle()
                            rowFive(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add two rolling pierce 3 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("PIERCE")
                        Image("pierce").perkIconMod()
                        Text("3 cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[8].toggle()
                            rowSix(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
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
                            deck.buttonArray[9].toggle()
                            rowSeven(condition: deck.buttonArray[9])
                        } label: {
                            let img = deck.buttonArray[9] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one rolling add_target card
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        Text("ADD TARGET")
                        Image("add_target").perkIconMod()
                        Text("card")
                        
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
                        //add one +0 Refresh and item card
                        Text("Add one")
                        plusZero()
                        Text("Refresh and item card")
                        
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
                            deck.buttonArray[13].toggle()
                            rowNine(condition: deck.buttonArray[13])
                        } label: {
                            let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //ignore negative item effects and add two +1 cards
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
        
        if condition {
            deck.removeCard("minusOne")
            deck.removeCard("minusOne")
        } else {
            deck.addCard("minusOne")
            deck.addCard("minusOne")
        }
    }
    // Remove four +0 cards
    func rowTwo(condition: Bool) {
        
        if condition {
            for _ in 1...4 {
                deck.removeCard("zero")
            }
        } else {
            for _ in 1...4 {
                deck.addCard("zero")
            }
        }
    }
    
    // Replace one +0 card with one +2 card
    func rowThree(condition: Bool) {
        
        if condition {
            deck.addCard("plusOne")
            deck.removeCard("minusOne")
        } else {
            deck.removeCard("plusOne")
            deck.addCard("minusOne")
        }
    }
    
    // Add two rolling +1 cards
    func rowFour(condition: Bool) {
        
        
    }
    
    //add three rolling muddle  cards
    func rowFive(condition: Bool) {
        
    }
    
    //add two rolling pierce 3 cards
    func rowSix(condition: Bool) {
        
    }
    
    //add one rolling stun card
    func rowSeven(condition: Bool) {
        
    }
    
    //add one rolling add_target card
    func rowEight(condition: Bool) {
        
    }
    
    //add one +0 Refresh and item card
    func rowNine(condition :Bool) {
        
    }
    
    //ignore negative item effects and add two +1 cards
    func rowTen(condition: Bool) {
        
    }
}

struct QuartermasterPerk_Previews: PreviewProvider {
    static var previews: some View {
        QuartermasterPerk(deck: Deck())
    }
}
