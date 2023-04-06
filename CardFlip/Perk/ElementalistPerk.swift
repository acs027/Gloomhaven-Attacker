//
//  ElementalistPerk.swift
//  CardFlip
//
//  Created by ali cihan on 3.04.2023.
//

import SwiftUI

struct ElementalistPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("Elementalist")
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
                        // Replace one -1 card with one +1 card
                        Text("Replace one")
                        minusOne()
                        Text("card with one")
                        plusOne()
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
                        // Add three +0 fire cards
                        Text("Add three")
                        plusZero()
                        Image("fire").perkIconMod()
                        Text("cards")
                        
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
                        // Add three +0 frost cards
                        Text("Add three")
                        plusZero()
                        Image("frost").perkIconMod()
                        Text("cards")
                        
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
                        // Add three +0 wind cards
                        Text("Add three")
                        plusZero()
                        Image("wind").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[7].toggle()
                            rowSix(condition: deck.buttonArray[7])
                        } label: {
                            let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add three +0 earth cards
                        Text("Add three")
                        plusZero()
                        Image("earth").perkIconMod()
                        Text("cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[8].toggle()
                            rowSeven(condition: deck.buttonArray[8])
                        } label: {
                            let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace two +0 cards with one +0 fire and one +0 earth card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace two")
                                plusZero()
                                Text("cards with one")
                                plusZero()
                            }
                            HStack {
                                Image("fire").perkIconMod()
                                Text("and one")
                                plusZero()
                                Image("earth").perkIconMod()
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[9].toggle()
                            rowEight(condition: deck.buttonArray[9])
                        } label: {
                            let img = deck.buttonArray[9] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Replace two +0 cards with one +0 frost and one +0 wind card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace two")
                                plusZero()
                                Text("cards with one")
                                plusZero()
                            }
                            HStack {
                                Image("frost").perkIconMod()
                                Text("and one")
                                plusZero()
                                Image("wind").perkIconMod()
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[10].toggle()
                            rowNine(condition: deck.buttonArray[10])
                        } label: {
                            let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    Group {
                        HStack {
                            // Add two +1 push 1 cards
                            Text("Add two")
                            plusOne()
                            Text("PUSH")
                            Image("push").perkIconMod()
                            Text("1 cards")
                            
                            Spacer()
                            
                            Button{
                                deck.buttonArray[11].toggle()
                                rowTen(condition: deck.buttonArray[11])
                            } label: {
                                let img = deck.buttonArray[11] ? "checkmark.square" : "square"
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
                                deck.buttonArray[12].toggle()
                                rowEleven(condition: deck.buttonArray[12])
                            } label: {
                                let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                                Image(systemName: img)
                            }
                        }
                        Group {
                            HStack {
                                // Add one +0 stun card
                                Text("Add one")
                                plusZero()
                                Text("STUN")
                                Image("stun").perkIconMod()
                                Text("card")
                                
                                Spacer()
                                
                                Button{
                                    deck.buttonArray[13].toggle()
                                    rowTwelve(condition: deck.buttonArray[13])
                                } label: {
                                    let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                                    Image(systemName: img)
                                }
                            }
                            
                            HStack {
                                // Add one +0 Add_target card
                                Text("Add one")
                                plusZero()
                                Text("ADD TARGET")
                                Image("add_target").perkIconMod()
                                Text("card")
                                
                                Spacer()
                                
                                Button{
                                    deck.buttonArray[14].toggle()
                                    rowThirteen(condition: deck.buttonArray[14])
                                } label: {
                                    let img = deck.buttonArray[14] ? "checkmark.square" : "square"
                                    Image(systemName: img)
                                }
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
    // Replace one -1 card with one +1 card
    func rowTwo(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "ElementalistplusOne", cardNameB: "minusOne")
    }
    
    // Replace one +0 card with one +2 card
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "ElementalistplusTwo", cardNameB: "zero")
    }
    
    // Add three +0 fire cards
    func rowFour(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ElementalistFire", count: 3)
    }
    
    // Add three +0 frost cards
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ElementalistFrost", count: 3)
    }
    
    // Add three +0 wind cards
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ElementalistWind", count: 3)
    }
    
    // Add three +0 earth cards
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ElementalistEarth", count: 3)
    }
    
    // Replace two +0 cards with one +0 fire and one +0 earth card
    func rowEight(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "ElementalistFire", cardNameB: "zero")
        deck.autoRepCard(condition: condition, cardNameA: "ElementalistEarth", cardNameB: "zero")
    }
    
    // Replace two +0 cards with one +0 frost and one +0 wind card
    func rowNine(condition :Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "ElementalistFrost", cardNameB: "zero")
        deck.autoRepCard(condition: condition, cardNameA: "ElementalistWind", cardNameB: "zero")
    }
    
    // Add two +1 push 1 cards
    func rowTen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ElementalistPush", count: 2)
    }
    
    // Add one +1 wound card
    func rowEleven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ElementalistWound")
    }
    
    // Add one +0 stun card
    func rowTwelve(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ElementalistStun")
    }
    
    // Add one +0 Add_target card
    func rowThirteen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "ElementalistAddTarget")
    }


}

struct ElementalistPerk_Previews: PreviewProvider {
    static var previews: some View {
        ElementalistPerk(deck: Deck())
    }
}
