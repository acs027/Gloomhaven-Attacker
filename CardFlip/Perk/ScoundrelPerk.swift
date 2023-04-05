//
//  ScoundrelPerk.swift
//  CardFlip
//
//  Created by ali cihan on 2.04.2023.
//

import SwiftUI

struct ScoundrelPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("scoundrel")
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
                        // Replace one -2 card with one +0 card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                minusTwo()
                                Text("card with one")
                                plusZero()
                            }
                            HStack {
                                Text(" card")
                            }
                        }
                        
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
                        // replace one -1 card with one +1 card
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
                            deck.buttonArray[4].toggle()
                            rowFour(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // replace one +0 card with one +2 card
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                                plusTwo()
                            }
                            HStack {
                                Text(" card")
                            }
                        }
                        
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
                        //add two rolling +1 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        plusOne()
                        Text("cards")
                        
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
                        // add two rolling pierce 3 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("PIERCE")
                        Image("pierce").perkIconMod()
                        Text("3 cards")
                        
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
                        // add two rolling poison cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("POISON")
                        Image("poison").perkIconMod()
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
                        // add two rolling muddle cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("MUDDLE")
                        Image("muddle").perkIconMod()
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
                    Group {
                        HStack {
                            // add one rolling invisible card
                            Text("Add one")
                            Image("rolling").perkIconMod()
                            Text("INVISIBLE")
                            Image("invisible").perkIconMod()
                            Text("card")
                            
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
                            // Ignore negative scenario effects
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
    //Remove two -1 cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    // Remove four +0 cards
    func rowTwo(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "zero", count: 4)
    }
    
    // Replace one -2 card with one +0 card
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "Scoundrelzero", cardNameB: "minusTwo")
    }
    
    // replace one -1 card with one +1 card
    func rowFour(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "ScoundrelplusOne", cardNameB: "minusOne")
    }
    
    // replace one +0 card with one +2 card
    func rowFive(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "ScoundrelplusTwo", cardNameB: "zero")
    }
    
    // add two rolling +1 cards
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ScoundrelRollingplusOne", count: 2)
    }
    
    // add two rolling pierce 3 cards
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ScoundrelPierce", count: 2)
    }
    
    // add two rolling poison cards
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ScoundrelPoison", count: 2)
    }
    
    // add two rolling muddle cards
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "ScoundrelMuddle", count: 2)
    }
    
    // add one rolling invisible card
    func rowTen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ScoundrelInvis")
    }
    
    // Ignore negative scenario effects
    func rowEleven(condition: Bool) {
        deck.refresh()
    }

}

struct ScoundrelPerk_Previews: PreviewProvider {
    static var previews: some View {
        ScoundrelPerk(deck: Deck())
    }
}
