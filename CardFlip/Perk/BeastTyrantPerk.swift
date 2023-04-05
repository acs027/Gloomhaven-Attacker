//
//  BeastTyrantPerk.swift
//  CardFlip
//
//  Created by ali cihan on 3.04.2023.
//

import SwiftUI

struct BeastTyrantPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("beasttyrant")
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
                    }
                    
                    HStack {
                        //Replace one -1 card with one +1 card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                minusOne()
                                Text("card with one")
                                
                            }
                            HStack {
                                plusOne()
                                Text(" card")
                            }
                            .padding(.horizontal)
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
                            rowTwo(condition: deck.buttonArray[2])
                        } label: {
                            let img = deck.buttonArray[2] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[3].toggle()
                            rowTwo(condition: deck.buttonArray[3])
                        } label: {
                            let img = deck.buttonArray[3] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //replace one +0 card with one +2 card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                                
                            }
                            HStack {
                                plusTwo()
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[4].toggle()
                            rowThree(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[5].toggle()
                            rowThree(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one +1 wound  card
                        Text("Add one")
                        plusOne()
                        Text("WOUND")
                        Image("wound").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[6].toggle()
                            rowFour(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[7].toggle()
                            rowFour(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one +1 immobilize card
                        Text("Add one")
                        plusOne()
                        Text("IMMONILIZE")
                        Image("immobilize").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[8].toggle()
                            rowFive(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[9].toggle()
                            rowFive(condition: deck.buttonArray[9])
                        } label: {
                            let img = deck.buttonArray[9] ? "checkmark.square" : "square"
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
                            deck.buttonArray[10].toggle()
                            rowSix(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[11].toggle()
                            rowSix(condition: deck.buttonArray[11])
                        } label: {
                            let img = deck.buttonArray[11] ? "checkmark.square" : "square"
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
                        //add two rolling earth cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("earth").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[13].toggle()
                            rowSeven(condition: deck.buttonArray[13])
                        } label: {
                            let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //ignore scenario scenario effects
                        Text("Ignore scenario scenario effects")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[14].toggle()
                            rowEight(condition: deck.buttonArray[14])
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
    
    //Replace one -1 card with one +1 card
    func rowTwo(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "BeastTyrantplusOne", cardNameB: "minusOne")
    }
    
    //replace one +0 card with one +2 card
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "BeastTyrantplusTwo", cardNameB: "zero")
    }
    
    //add one +1 wound  card
    func rowFour(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "BeastTyrantWound")
    }
    
    //add one +1 immobilize card
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "BeastTyrantImmob")
    }
    
    //add two rolling heal 1 cards
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "BeastTyrantHeal", count: 2)
    }
    
    //add two rolling earth cards
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "BeastTyrantEarth", count: 2)
    }
    
    //ignore scenario scenario effects
    func rowEight(condition: Bool) {
        deck.refresh()
    }
}

struct BeastTyrantPerk_Previews: PreviewProvider {
    static var previews: some View {
        BeastTyrantPerk(deck: Deck())
    }
}
