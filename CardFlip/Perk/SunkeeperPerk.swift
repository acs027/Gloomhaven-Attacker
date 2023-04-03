//
//  SunkeeperPerk.swift
//  CardFlip
//
//  Created by Furkan Eken on 3.04.2023.
//

import SwiftUI

struct SunkeeperPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("sunkeeper")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack {
                Text(String(deck.cards.count))
                Group {
                    HStack{
                        // Remove two -1 cards
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
                        //Replace one -2 card with one +0 card
                        Text("Replace one")
                        minusTwo()
                        Text("card with one")
                        plusZero()
                        Text(" card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[3].toggle()
                            rowThree(condition: deck.buttonArray[3])
                        } label: {
                            let img = deck.buttonArray[3] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //Replace one +0 card with one +2 card
                        Text("Replace one")
                        plusZero()
                        Text("card with one")
                        plusTwo()
                        Text(" card")
                        
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
                        //Add two rolling (+1) cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        plusOne()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[5].toggle()
                            rowFive(condition: deck.buttonArray[5])
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
                        //Add two rolling HEAL 1 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("heal").perkIconMod()
                        Text("1 cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[7].toggle()
                            rowSix(condition: deck.buttonArray[7])
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
                        //Add one rolling STUN card
                        Text("Add one")
                        Image("rolling").perkIconMod()
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
                        //Add two rolling SUN card
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("sun").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        
                        Button{
                            deck.buttonArray[10].toggle()
                            rowEight(condition: deck.buttonArray[10])
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
                        //Add two rolling Shield 1, Self cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("Shield")
                        Image("shield").perkIconMod()
                        Text("1, Self cards")
                        
                        Spacer()
                        
                        
                        Button{
                            deck.buttonArray[12].toggle()
                            rowNine(condition: deck.buttonArray[12])
                        } label: {
                            let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    Group {
                        HStack {
                            //Ignore negative item effects and add two (+1) cards
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("Ignore negative item effects and")
                                }
                                HStack {
                                    Text(" add two")
                                    plusOne()
                                    Text("cards")
                                }
                            }
                            
                            Spacer()
                            
                            Button{
                                deck.buttonArray[13].toggle()
                                rowTen(condition: deck.buttonArray[13])
                            } label: {
                                let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                                Image(systemName: img)
                            }
                        }
                        HStack {
                            //Ignore negative scenario effects
                            Text("Ignore negative scenario effects")
                            Spacer()
                            
                            Button{
                                deck.buttonArray[14].toggle()
                                rowEleven(condition: deck.buttonArray[14])
                            } label: {
                                let img = deck.buttonArray[14] ? "checkmark.square" : "square"
                                Image(systemName: img)
                            }
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
            deck.removeCard("plusOne")
            deck.removeCard("plusOne")
        } else {
            deck.addCard("plusOne")
            deck.addCard("plusOne")
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
    
    //Replace one -2 card with one +0 card
    func rowThree(condition: Bool) {
        
        if condition {
            deck.addCard("zero")
            deck.removeCard("minusTwo")
        } else {
            deck.removeCard("zero")
            deck.addCard("minusTwo")
        }
    }
    
    //Replace one +0 card with one +2 card
    func rowFour(condition: Bool) {
        
        if condition {
            deck.addCard("plusTwo")
            deck.removeCard("zero")
        } else {
            deck.removeCard("plusTwo")
            deck.addCard("zero")
        }
    }
    
    //Add two rolling (+1) cards
    func rowFive(condition: Bool) {
        
    }
    
    //Add two rolling HEAL 1 cards
    func rowSix(condition: Bool) {
        
    }
    
    //Add one rolling STUN card
    func rowSeven(condition: Bool) {
        
    }
    
    //Add two rolling SUN card
    func rowEight(condition: Bool) {
        
    }
    
    //Add two rolling Shield 1, Self cards
    func rowNine(condition :Bool) {
        
    }
    
    //Ignore negative item effects and add two (+1) cards
    func rowTen(condition: Bool) {
        
    }
    //Ignore negative scenario effects
    func rowEleven(condition: Bool) {
        
    }
}

struct SunkeeperPerk_Previews: PreviewProvider {
    static var previews: some View {
        SunkeeperPerk(deck: Deck())
    }
}

