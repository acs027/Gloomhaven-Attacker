//
//  MindthiefPerk.swift
//  CardFlip
//
//  Created by ali cihan on 2.04.2023.
//

import SwiftUI

struct MindthiefPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("mindthief")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack {
                Text(String(deck.cards.count))
                Group {
                    HStack{
                        // MARK: Remove two -1 cards
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
                        //MARK: Remove four +0 cards
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
                        //MARK: Replace two +1 cards with two +2 cards
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace two")
                                plusOne()
                                Text("cards with two")
                                plusTwo()
                            }
                            HStack {
                                Text(" cards")
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
                        //MARK: replace one -2 card with one +0 card
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
                            deck.buttonArray[4].toggle()
                            rowFour(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        //MARK: add one +2 frost card
                        Text("Add one")
                        plusTwo()
                        Image("frost").perkIconMod()
                        Text("card")
                        
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
                        //MARK: add two rolling +1 cards
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
                        //MARK: add three rolling pull 1 cards
                        Text("Add three")
                        Image("rolling").perkIconMod()
                        Text("PULL")
                        Image("push").perkIconMod().rotationEffect(.degrees(-180))
                        Text("1 cards")
                        
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
                        //MARK: add three rolling muddle cards
                        Text("Add three")
                        Image("rolling").perkIconMod()
                        Text("MUDDLE")
                        Image("muddle").perkIconMod()
                        Text("cards")
                        
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
                        //MARK: add two rolling immobilize cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Text("IMMOBILIZE")
                        Image("immobilize").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[11].toggle()
                            rowNine(condition: deck.buttonArray[11])
                        } label: {
                            let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    Group {
                        HStack {
                            //MARK: Add one rolling stun card
                            Text("Add one")
                            Image("rolling").perkIconMod()
                            Text("STUN")
                            Image("stun").perkIconMod()
                            Text("card")
                            
                            Spacer()
                            
                            Button{
                                deck.buttonArray[12].toggle()
                                rowTen(condition: deck.buttonArray[12])
                            } label: {
                                let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                                Image(systemName: img)
                            }
                        }
                        
                        HStack {
                            //MARK: Add one rolling disarm and one rolling muddle card
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("Add one")
                                    Image("rolling").perkIconMod()
                                    Text("DISARM")
                                    Image("disarm").perkIconMod()
                                    Text("and one")
                                }
                                HStack {
                                    Text(" ")
                                    Image("rolling").perkIconMod()
                                    Text("MUDDLE")
                                    Image("muddle").perkIconMod()
                                    Text("card")
                                }
                            }
                            
                            Spacer()
                            
                            Button{
                                deck.buttonArray[13].toggle()
                                rowEleven(condition: deck.buttonArray[13])
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
                                rowTwelve(condition: deck.buttonArray[14])
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
    
    // Replace two +1 cards with two +2 cards
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "MindthiefplusTwo", countA: 2, cardNameB: "plusOne", countB: 2)
    }
    
    // replace one -2 card with one +0 card
    func rowFour(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "Mindthiefzero", cardNameB: "minusTwo")
    }
    
    // add one +2 frost card
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "MindthiefFrost")
    }
    
    // add two rolling +1 cards
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "MindthiefRollingplusOne", count: 2)
    }
    
    // add three rolling pull 1 cards
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "MindthiefPush", count: 3)
    }
    
    // add three rolling muddle cards
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "MindthiefMuddle", count: 3)
    }
    
    // add two rolling immobilize cards
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "MindthiefImmob", count: 2)
    }
    
    // Add one rolling stun card
    func rowTen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "MindthiefStun")
    }
    
    // Add one rolling disarm and one rolling muddle card
    func rowEleven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "MindthiefDisarm")
        deck.autoCard(condition: condition, cardName: "MindthiefMuddle")
    }
    
    // Ignore negative scenario effects
    func rowTwelve(condition: Bool) {
        deck.refresh()
    }


}

struct MindthiefPerk_Previews: PreviewProvider {
    static var previews: some View {
        MindthiefPerk(deck: Deck())
    }
}
