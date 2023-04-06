//
//  SummonerPerk.swift
//  CardFlip
//
//  Created by Furkan Eken on 3.04.2023.
//

import SwiftUI

struct SummonerPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("Summoner")
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
                        
                    }
                    
                    HStack {
                        // Replace one (-2) card with one (+0) card
                        Text("Replace one")
                        minusTwo()
                        Text("card with one")
                        plusZero()
                        Text(" card")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[1].toggle()
                            rowTwo(condition: deck.buttonArray[1])
                        } label: {
                            let img = deck.buttonArray[1] ? "checkmark.square" : "square"
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
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                        
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
                        Button{
                            deck.buttonArray[4].toggle()
                            rowThree(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one (+2) card
                        HStack {
                            Text("Add one")
                            plusTwo()
                            Text("card")
                        }
                        
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
                        //Add two rolling WOUND cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("wound").perkIconMod()
                        Text("WOUND cards")
                        
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
                        //Add two rolling POISON cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("poison").perkIconMod()
                        Text("POISON cards")
                        
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
                        //Add two rolling HEAL 1 cards
                        Text("Add two")
                        Image("rolling").perkIconMod()
                        Image("heal").perkIconMod()
                        Text("1 cards")
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[9].toggle()
                            rowSeven(condition: deck.buttonArray[9])
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
                        Button{
                            deck.buttonArray[11].toggle()
                            rowSeven(condition: deck.buttonArray[11])
                        } label: {
                            let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack {
                        // Add one rolling FIRE and one rolling WIND card
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        Image("fire").perkIconMod()
                        Text("and one")
                        Image("rolling").perkIconMod()
                        Image("wind").perkIconMod()
                        Text("card")
                        
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
                        // Add one rolling DARK and one rolling EARTH card
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        Image("dark").perkIconMod()
                        Text("and one")
                        Image("rolling").perkIconMod()
                        Image("earth").perkIconMod()
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
                        //Ignore negative scenario effects and add two +1 cards
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Ignore negative scenario effects and")
                            }
                            HStack {
                                Text(" add two")
                                plusOne()
                                Text("cards")
                            }
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
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    
    // Replace one (-2) card with one (+0) card
    func rowTwo(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "Summonerzero", cardNameB: "minusTwo")
    }
    
    //Replace one -1 card with one +1 card
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SummonerplusOne", cardNameB: "minusOne")
    }
    
    // Add one (+2) card
    func rowFour(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SummonerplusTwo")
    }
    
    //Add two rolling WOUND cards
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SummonerWound", count: 2)
    }
    
    //Add two rolling POISON cards
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SummonerPoison", count: 2)
    }
    
    //Add two rolling HEAL 1 cards
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SummonerHeal", count: 2)
    }
    
    // Add one rolling FIRE and one rolling WIND card
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SummonerFire")
        deck.autoCard(condition: condition, cardName: "SummonerWind")
    }
    
    // Add one rolling DARK and one rolling EARTH card
    func rowNine(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SummonerDark")
        deck.autoCard(condition: condition, cardName: "SummonerEarth")
    }
    
    //Ignore negative scenario effects and add two +1 cards
    func rowTen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SummonerplusOne", count: 2)
    }
}

struct SummonerPerk_Previews: PreviewProvider {
    static var previews: some View {
        SummonerPerk(deck: Deck())
    }
}


