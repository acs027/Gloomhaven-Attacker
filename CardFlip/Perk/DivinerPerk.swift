//
//  DivinerPerk.swift
//  CardFlip
//
//  Created by Furkan Eken on 8.04.2023.
//

import SwiftUI

struct DivinerPerk: View {
    @ObservedObject var deck: Deck
    let className = "Diviner"
    
    
    var body: some View {
        ZStack {
            Image("Diviner")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            VStack{
                Text(String(deck.cards.count))
                Group{
                    HStack{
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
                    HStack{
                        // remove one -2 card
                        Text("Remove one")
                        minusTwo()
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
                    
                    HStack{
                        // Replace two (+1) cards with one (+3) Shield 1, Self card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace two")
                                plusOne()
                                Text("cards with one")
                            }
                            HStack {
                                plusThree()
                                Text("Shield")
                                Image("shield").perkIconMod()
                                Text("1, Self card")
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
                        Button{
                            deck.buttonArray[4].toggle()
                            rowThree(condition: deck.buttonArray[4])
                        } label: {
                            let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack{
                        // Replace one (+0) card with one (+1) Shield 1, Affect any ally card
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("cards with one")
                            }
                            HStack {
                                plusOne()
                                Text("Shield")
                                Image("shield").perkIconMod()
                                Text("1, Affect any ally card")
                            }
                        }
                        
                        Spacer()
                        
                        Button{
                            deck.buttonArray[5].toggle()
                            rowFour(condition: deck.buttonArray[5])
                        } label: {
                            let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                            Image(systemName: img)
                        }
                    }
                    
                    HStack{
                        // Replace one (+0) card with one (+2) DARK card
                        Text("Replace one")
                        plusZero()
                        Text("card with one")
                        plusTwo()
                        Image("dark").perkIconMod()
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
                }
                HStack{
                    // Replace one (+0) card with one (+2) SUN card
                    Text("Replace one")
                    plusZero()
                    Text("card with one")
                    plusTwo()
                    Image("sun").perkIconMod()
                    Text("card")
                    
                    Spacer()
                    
                    Button{
                        deck.buttonArray[7].toggle()
                        rowSix(condition: deck.buttonArray[7])
                    } label: {
                        let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                }
                
                HStack{
                    // Replace one (+0) card with one (+3) MUDDLE card
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("Replace one")
                            plusZero()
                            Text("card with one")
                        }
                        HStack {
                            plusThree()
                            Text("MUDDLE")
                            Image("muddle").perkIconMod()
                            Text("card")
                        }
                    }
                    
                    Spacer()
                    
                    Button{
                        deck.buttonArray[8].toggle()
                        rowSeven(condition: deck.buttonArray[8])
                    } label: {
                        let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                }
                
                HStack{
                    // Replace one (+0) card with one (+2) CURSE card
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("Replace one")
                            plusZero()
                            Text("card with one")
                        }
                        HStack {
                            plusTwo()
                            Text("CURSE")
                            Image("curseP").perkIconMod()
                            Text("card")
                        }
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
                
                HStack{
                    // Replace one (+0) card with one (+2) REGENERATE card
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("Replace one")
                            plusZero()
                            Text("card with one")
                        }
                        HStack {
                            plusTwo()
                            Text("REGENERATE")
                            Image("regenerate").perkIconMod()
                            Text(", Self card")
                        }
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
                
                HStack{
                    // Replace one (-1) card with one (+1) HEAL 2 affect any ally card
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("Replace one")
                            minusOne()
                            Text("card with one")
                        }
                        HStack {
                            plusOne()
                            Text("HEAL")
                            Image("heal").perkIconMod()
                            Text("2, Affect any ally card")
                        }
                    }
                    
                    Spacer()
                    
                    Button{
                        deck.buttonArray[11].toggle()
                        rowTen(condition: deck.buttonArray[11])
                    } label: {
                        let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                }
                
                HStack{
                    // Add two rolling HEAL 1, Self cards
                    Text("Add two")
                    Image("rolling").perkIconMod()
                    Text("HEAL")
                    Image("heal").perkIconMod()
                    Text("1, Self cards")
                    
                    Spacer()
                    
                    Button{
                        deck.buttonArray[12].toggle()
                        rowEleven(condition: deck.buttonArray[12])
                    } label: {
                        let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                }
                
                HStack{
                    // Add two rolling CURSE cards
                    Text("Add two")
                    Image("rolling").perkIconMod()
                    Text("CURSE")
                    Image("curseP").perkIconMod()
                    Text("cards")
                    
                    Spacer()
                    
                    Button{
                        deck.buttonArray[13].toggle()
                        rowTwelve(condition: deck.buttonArray[13])
                    } label: {
                        let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                }
                
                HStack{
                    //Text("Ignore negative scenario effects and add two +1 card")
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Ignore negative scenario effects and add two")
                        HStack {
                            plusOne()
                            Text("card")
                        }
                    }
                    
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
            .padding(.horizontal)
        }
    }
    
    // Remove two -1 cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    
    // remove one -2 card
    func rowTwo(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusTwo")
    }
    
    // Replace two (+1) cards with one (+3) Shield 1, Self card
    func rowThree(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "plusOne", count: 2)
        deck.autoCard(condition: condition, cardName: "DivinerShield")
    }
    
    // Replace one (+0) card with one (+1) Shield 1, Affect any ally card
    func rowFour(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "DivinerShieldAlly", cardNameB: "zero")
    }
    
    // Replace one (+0) card with one (+2) DARK card
    func rowFive(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "DivinerDark", cardNameB: "zero")
    }
    
    // Replace one (+0) card with one (+2) SUN card
    func rowSix(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "DivinerSun", cardNameB: "zero")
    }
    
    // Replace one (+0) card with one (+3) MUDDLE card
    func rowSeven(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "DivinerMuddle", cardNameB: "zero")
    }
    
    // Replace one (+0) card with one (+2) CURSE card
    func rowEight(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "DivinerCurse", cardNameB: "zero")
    }
    
    // Replace one (+0) card with one (+2) REGENERATE card
    func rowNine(condition :Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "DivinerRegen", cardNameB: "zero")
    }
    
    // Replace one (-1) card with one (+1) HEAL 2 affect any ally card
    func rowTen(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "DivinerHeal", cardNameB: "minusOne")
    }
    
    // Add two rolling HEAL 1, Self cards
    func rowEleven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DivinerHealSelf", count: 2)
    }
    
    // Add two rolling CURSE cards
    func rowTwelve(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DivinerRollingCurse", count: 2)
    }
    
    // Ignore negative scenario effects and add two +1 card
    func rowThirteen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "DivinerplusOne", count: 2)
    }
}

struct DivinerPerk_Previews: PreviewProvider {
    static var previews: some View {
        DivinerPerk(deck: Deck())
    }
}
