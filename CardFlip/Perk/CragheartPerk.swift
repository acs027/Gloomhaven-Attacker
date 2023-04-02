//
//  cragheartPerk.swift
//  CardFlip
//
//  Created by ali cihan saraç on 1.04.2023.
//

import SwiftUI

struct CragheartPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("cragheart")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack {
                Text(String(deck.cards.count))
                Group {
                    HStack{
                        //Remove four +0 cards
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
                            deck.buttonArray[1].toggle()
                            rowTwo(condition: deck.buttonArray[1])
                        } label: {
                            let img = deck.buttonArray[1] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
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
                        //Add one -2 card and two +2 cards
                        HStack {
                            Text("Add one")
                            minusTwo()
                            Text("card and two")
                            plusTwo()
                            Text("cards")
                        }
                        Spacer()
                        
                        Button{
                            deck.buttonArray[4].toggle()
                            rowFour(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one +1 immobilize card
                        Text("Add one")
                        plusOne()
                        Text("IMMOBILIZE")
                        Image("immobilize").perkIconMod()
                        Text("card")
                        
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
                            rowFive(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one +1 muddle card
                        Text("Add one")
                        plusOne()
                        Text("MUDDLE")
                        Image("muddle").perkIconMod()
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
                            rowSix(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add two rolling push 2 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("PUSH")
                        Image("push").perkIconMod()
                        Text("2 cards")
                        
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
                        //add two rolling earth card
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("earth").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[10].toggle()
                            rowSeven(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[11].toggle()
                            rowEight(condition: deck.buttonArray[11])
                        } label: {
                            let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add two rolling wind cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("wind").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[12].toggle()
                            rowNine(condition: deck.buttonArray[12])
                        } label: {
                            let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //ignore negative item effects
                        Text("Ignore negative item effects")
                        
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
                        //ignore scenario item effects
                        Text("Ignore scenario item effects")
                        
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
    // Remove four +0 cards
    func rowOne(condition: Bool) {
        
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
    // Replace one -1 card with one +1 card
    func rowTwo(condition: Bool) {
        
        if condition {
            deck.addCard("plusOne")
            deck.removeCard("minusOne")
        } else {
            deck.removeCard("plusOne")
            deck.addCard("minusOne")
        }
    }
    
    // Add one -2 card and two +2 cards
    func rowThree(condition: Bool) {
        
        if condition {
            deck.addCard("plusOne")
            deck.removeCard("minusOne")
        } else {
            deck.removeCard("plusOne")
            deck.addCard("minusOne")
        }
    }
    
    // Replace one -1 card with one +1 card
    func rowFour(condition: Bool) {
        
        if condition {
            deck.addCard("plusOne")
            deck.removeCard("minusOne")
        } else {
            deck.removeCard("plusOne")
            deck.addCard("minusOne")
        }
    }
    
    // Add two rolling wound cards
    func rowFive(condition: Bool) {
        
    }
    
    // Add one rolling stun card
    func rowSix(condition: Bool) {
        
    }
    
    // Add one rolling +1 disarm card
    func rowSeven(condition: Bool) {
        
    }
    
    // Add two rolling heal 1 cards
    func rowEight(condition: Bool) {
        
    }
    
    // Add one +2 fire card
    func rowNine(condition :Bool) {
        
    }
    
    // Ignore negative item effects
    func rowTen(condition: Bool) {
        
    }
}

struct CragheartPerk_Previews: PreviewProvider {
    static var previews: some View {
        CragheartPerk(deck: Deck())
    }
}
