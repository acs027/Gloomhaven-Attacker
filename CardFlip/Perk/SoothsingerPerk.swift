//
//  SoothsingerPerk.swift
//  CardFlip
//
//  Created by ali cihan on 3.04.2023.
//

import SwiftUI

struct SoothsingerPerk: View {
    
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack {
            Image("soothsinger")
                .renderingMode(.template)
                .foregroundColor(.primary)
                .opacity(0.2)
            ScrollView {
            VStack {
                Text(String(deck.cards.count))
                Group {
                    HStack{
                        //Remove two -1 cards --2
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
                        // Remove one -2 card --1
                        Text("Replace one")
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
                    
                    HStack {
                        // Replace two +1 cards with one +4 card --2
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace two")
                                plusOne()
                                Text("cards with one")
                                plusFour()
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
                        // Replace one +0 card with one +1 immobilize card --1
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusOne()
                                Text("IMMOBILIZE")
                                Image("immobilize").perkIconMod()
                                Text("card")
                            }
                            .padding(.horizontal)
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
                    
                    HStack {
                        // Replace one +0 card with one +1 Disarm card --1
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusOne()
                                Text("DISARM")
                                Image("disarm").perkIconMod()
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
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
                        // Replace one +0 card with one +2 wound card --1
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusTwo()
                                Text("WOUND")
                                Image("wound").perkIconMod()
                                Text("card")
                            }
                            .padding(.horizontal)
                        }
                        
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
                        // Replace one +0 card with one +2 poison card --1
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Replace one")
                                plusZero()
                                Text("card with one")
                            }
                            HStack {
                                plusTwo()
                                Text("POISON")
                                Image("poison").perkIconMod()
                                Text("card")
                            }
                            .padding(.horizontal)
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
                    
                    HStack {
                        // Replace one +0 card with one +2 curse card --1
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
                        // Replace one +0 card with one +3 muddle card --1
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
                            // Replace one -1 card with one +0 stun card --1
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("Replace one")
                                    minusOne()
                                    Text("card with one")
                                }
                                HStack {
                                    plusZero()
                                    Text("STUN")
                                    Image("stun").perkIconMod()
                                    Text("card")
                                }
                                .padding(.horizontal)
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
                        
                        HStack {
                            // add three rolling +1 cards --1
                            Text("Add three")
                            Image("rolling").perkIconMod()
                            plusOne()
                            Text("cards")
                            
                            Spacer()
                            
                            Button{
                                deck.buttonArray[12].toggle()
                                rowEleven(condition: deck.buttonArray[12])
                            } label: {
                                let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                                Image(systemName: img)
                            }
                        }
                        HStack {
                            // Add two rolling curse cards --2
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
        }
        .padding(.horizontal)
    }
    //Remove two -1 cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusOne", count: 2)
    }
    // Remove one -2 card --1
    func rowTwo(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "minusTwo")
    }
    
    // Replace two +1 cards with one +4 card --2
    func rowThree(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SoothsingerplusFour", countA: 1, cardNameB: "plusOne", countB: 2)
    }
    
    // Replace one +0 card with one +1 immobilize card --1
    func rowFour(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SoothsingerImmob", cardNameB: "zero")
    }
    
    // Replace one +0 card with one +1 Disarm card --1
    func rowFive(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SoothsingerDisarm", cardNameB: "zero")
    }
    
    // Replace one +0 card with one +2 wound card --1
    func rowSix(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SoothsingerWound", cardNameB: "zero")
    }
    
    // Replace one +0 card with one +2 poison card --1
    func rowSeven(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SoothsingerPoison", cardNameB: "zero")
    }
    
    // Replace one +0 card with one +2 curse card --1
    func rowEight(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SoothsingerCurse", cardNameB: "zero")
    }
    
    // Replace one +0 card with one +3 muddle card --1
    func rowNine(condition :Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SoothsingerMuddle", cardNameB: "zero")
    }
    
    // Replace one -1 card with one +0 stun card --1
    func rowTen(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SoothsingerStun", cardNameB: "minusOne")
    }
    
    // add three rolling +1 cards --1
    func rowEleven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SoothsingerRollingplusOne", count: 3)
    }
    
    // Add two rolling curse cards --2
    func rowTwelve(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SoothsingerRollingCurse", count: 2)
    }
}

struct SoothsingerPerk_Previews: PreviewProvider {
    static var previews: some View {
        SoothsingerPerk(deck: Deck())
    }
}
