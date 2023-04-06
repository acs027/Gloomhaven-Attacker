//
//  TinkererPerk.swift
//  CardFlip
//
//  Created by ali cihan on 2.04.2023.
//

import SwiftUI

struct TinkererPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("Tinkerer")
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
                        // Replace one -2 card with one +0 card
                        Text("Replace one")
                        minusTwo()
                        Text("card with one")
                        plusZero()
                        Text("card")
                        
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
                        // Add two +1 cards
                        Text("Add two")
                        plusOne()
                        Text("cards")
                        
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
                        // Add one +3 card
                        Text("Add one")
                        plusThree()
                        Text("card")
                        
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
                        // Add two rolling fire cards
                        
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("fire").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[5].toggle()
                            rowFive(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add three rolling muddle cards
                        Text("Add three")
                        Image("rolling").perkIconMod()
                        Text("MUDDLE")
                        Image("muddle").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[6].toggle()
                            rowSix(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one +1 wound card
                        Text("Add one")
                        plusOne()
                        Text("WOUND")
                        Image("wound").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[7].toggle()
                            rowSeven(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[8].toggle()
                            rowSeven(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // add one +1 immobilize card
                        Text("Add one")
                        plusOne()
                        Text("IMMOBILIZE")
                        Image("immobilize").perkIconMod()
                        Text("card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[9].toggle()
                            rowEight(condition: deck.buttonArray[9])
                        } label: {
                            let img = deck.buttonArray[9] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                        Button{
                            deck.buttonArray[10].toggle()
                            rowEight(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // add one +1 heal 2 card
                        Text("Add one")
                        plusOne()
                        Text("Heal")
                        Image("heal").perkIconMod()
                        Text("2 card")
                        
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
                    }
                    Group {
                        HStack {
                            // add one +0 add target card
                            Text("Add one")
                            plusZero()
                            Text("ADD TARGET")
                            Image("add_target").perkIconMod()
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
    // Replace one -2 card with one +0 card
    func rowTwo(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "Tinkererzero", cardNameB: "minusTwo")
    }
    
    // Add two +1 cards
    func rowThree(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "TinkererplusOne", count: 2)
    }
    
    // Add one +3 card
    func rowFour(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "TinkererplusThree")
    }
    
    // Add two rolling fire cards
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "TinkererFire", count: 2)
    }
    
    // Add three rolling muddle cards
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "TinkererMuddle", count: 3)
    }
    
    // Add one +1 wound card
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "TinkererWound")
    }
    
    // add one +1 immobilize card
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "TinkererImmob")
    }
    
    // add one +1 heal 2 card
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "TinkererHeal")
    }
    
    // add one +0 add target card
    func rowTen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "TinkererAddTarget")
    }
    
    // Ignore negative scenario effects
    func rowEleven(condition: Bool) {
        deck.refresh()
    }

}

struct TinkererPerk_Previews: PreviewProvider {
    static var previews: some View {
        TinkererPerk(deck: Deck())
    }
}
