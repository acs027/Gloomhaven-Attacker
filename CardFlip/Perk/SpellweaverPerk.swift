//
//  SpellweaverPerk.swift
//  CardFlip
//
//  Created by Furkan Eken on 2.04.2023.
//

import SwiftUI

struct SpellweaverPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("spellweaver")
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
                    }
                    
                    HStack {
                        //Add two +1 cards
                        HStack {
                            Text("Add two")
                            plusOne()
                            Text("cards")
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
                            rowFour(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one +0 stun card
                        Text("Add one")
                        plusZero()
                        Text("STUN")
                        Image("stun").perkIconMod()
                        Text("card")
                        
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
                        //add one +1 wound card
                        Text("Add one")
                        plusOne()
                        Text("WOUND")
                        Image("wound").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[6].toggle()
                            rowFive(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
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
                            deck.buttonArray[7].toggle()
                            rowFive(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one +1 curse card
                        Text("Add one")
                        plusOne()
                        Text("CURSE")
                        Image("curseP").perkIconMod()
                        Text("card")
                        
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
                        //add one +2 fire card
                        Text("Add one")
                        plusTwo()
                        Image("fire").perkIconMod()
                        Text("card")
                        
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
                            rowSeven(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one +2 frost card
                        Text("Add one")
                        plusTwo()
                        Image("frost").perkIconMod()
                        Text("card")
                        
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
                            rowNine(condition: deck.buttonArray[12])
                        } label: {
                            let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    Group {
                        HStack {
                            //Add one rolling earth and one rolling wind card
                            Text("Add one")
                            Image("rolling").perkIconMod()
                            Image("earth").perkIconMod()
                            Text("and one")
                            Image("rolling").perkIconMod()
                            Image("wind").perkIconMod()
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
                            //Add one rolling sun and one rolling dark card
                            Text("Add one")
                            Image("rolling").perkIconMod()
                            Image("sun").perkIconMod()
                            Text("and one")
                            Image("rolling").perkIconMod()
                            Image("dark").perkIconMod()
                            Text("card")
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
    
    // Add two +1 cards
    func rowThree(condition: Bool) {
        
        if condition {
            deck.addCard("plusOne")
            deck.addCard("plusOne")
        } else {
            deck.removeCard("plusOne")
            deck.removeCard("plusOne")
        }
    }
    
    // Replace one -1 card with one +1 card
    func rowFour(condition: Bool) {
        
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

struct SpellweaverPerk_Previews: PreviewProvider {
    static var previews: some View {
        SpellweaverPerk(deck: Deck())
    }
}
