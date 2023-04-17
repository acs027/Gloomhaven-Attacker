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
            Image("Spellweaver")
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
                            rowTwo(condition: deck.buttonArray[2])
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
                            rowThree(condition: deck.buttonArray[4])
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
                            rowSix(condition: deck.buttonArray[7])
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
                            rowSeven(condition: deck.buttonArray[8])
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
                        //add one +2 frost card
                        Text("Add one")
                        plusTwo()
                        Image("frost").perkIconMod()
                        Text("card")
                        
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
                                rowTen(condition: deck.buttonArray[13])
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
    // Remove four +0 cards
    func rowOne(condition: Bool) {
        deck.autoCard(condition: !condition, cardName: "zero", count: 4)
    }
 
    // Replace one -1 card with one +1 card
    func rowTwo(condition: Bool) {
        deck.autoRepCard(condition: condition, cardNameA: "SpellweaverplusOne", cardNameB: "minusOne")
    }

    
    // Add two +1 cards
    func rowThree(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverplusOne", count: 2)
        
    }
    //add one +0 stun card
    func rowFour(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverStun")
    }
    
    //add one +1 wound card
    func rowFive(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverWound")
    }
    
    //add one +1 immobilize card
    func rowSix(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverImmob")
    }
    
    //add one +1 curse card
    func rowSeven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverCurse")
    }
    
    //add one +2 fire card
    func rowEight(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverFire")
    }
    
    //add one +2 frost card
    func rowNine(condition :Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverFrost")
    }
    
    //Add one rolling earth and one rolling wind card
    func rowTen(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverEarth")
        deck.autoCard(condition: condition, cardName: "SpellweaverWind")
    }
    //Add one rolling sun and one rolling dark card
    func rowEleven(condition: Bool) {
        deck.autoCard(condition: condition, cardName: "SpellweaverSun")
        deck.autoCard(condition: condition, cardName: "SpellweaverDark")
    }
}

struct SpellweaverPerk_Previews: PreviewProvider {
    static var previews: some View {
        SpellweaverPerk(deck: Deck())
    }
}
