//
//  cragheartPerk.swift
//  CardFlip
//
//  Created by ali cihan on 1.04.2023.
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
                                
                            }
                            HStack {
                                Text(" ")
                                plusOne()
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
                            rowThree(condition: deck.buttonArray[4])
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
                            rowFour(condition: deck.buttonArray[6])
                        } label: {
                            let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //add one +2 muddle card
                        Text("Add one")
                        plusTwo()
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
                            rowFive(condition: deck.buttonArray[8])
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
                            rowSeven(condition: deck.buttonArray[11])
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
                            rowEight(condition: deck.buttonArray[12])
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
                        //ignore scenario scenario effects
                        Text("Ignore scenario scenario effects")
                        
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
        deck.autoCard(condition: !condition, cardName: "zero", count: 4)
    }
    
    // Replace one -1 card with one +1 card
    func rowTwo(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "CragheartplusOne", cardNameB: "minusOne")
    }
    
    // Add one -2 card and two +2 cards
    func rowThree(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "minusTwo")
        deck.autoCard(condition: condition, cardName: "CragheartplusTwo", count: 2)
    }
    
    //add one +1 immobilize card
    func rowFour(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "CragheartImmob")
    }
    
    //add one +2 muddle card
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "CragheartMuddle")
    }
    
    //add two rolling push 2 cards
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "CragheartPush", count: 2)
    }
    
    //add two rolling earth card
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "CragheartEarth", count: 2)
    }
    
    //add two rolling wind cards
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "CragheartWind", count: 2)
    }
    
    //ignore negative item effects
    func rowNine(condition :Bool) {
        deck.refresh()
    }
    
    //ignore scenario scenario effects
    func rowTen(condition: Bool) {
        deck.refresh()
    }
}

struct CragheartPerk_Previews: PreviewProvider {
    static var previews: some View {
        CragheartPerk(deck: Deck())
    }
}
