//
//  BrutePerk.swift
//  denemetahtası
//
//  Created by Furkan Eken on 21.03.2023.
//

import SwiftUI

struct BrutePerk: View {
    @ObservedObject var deck: Deck
    let className = "Brute"
    
    var body: some View {
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
                }.padding(.horizontal)
                HStack{
                    //Text("Replace one -1 card with one +1 card")
                    Text("Replace one")
                    minusOne()
                    Text("card with one")
                    plusOne()
                    Text("card")
                    Spacer()
                    Button{
                        deck.buttonArray[1].toggle()
                        rowTwo(condition: deck.buttonArray[1])
                        
                    } label: {
                        let img = deck.buttonArray[1] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                } .padding(.horizontal)
                HStack{
                    //Text("Add two +1 cards")
                    Text("Add two")
                    plusOne()
                    Text("cards")
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
                } .padding(.horizontal)
                HStack{
                    //Text("Add one +3 card")
                    Text("Add one")
                    plusThree()
                    Text("card")
                    Spacer()
                    Button{
                        deck.buttonArray[4].toggle()
                    } label: {
                        let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                } .padding(.horizontal)
                HStack{
                    //Text("Add three eklemeli PUSH 1 cards")
                    Text("Add three")
                    Image("rolling").perkIconMod()
                    Text("PUSH")
                    Image("push").perkIconMod()
                    Text("cards")
                    Spacer()
                    Button{
                        deck.buttonArray[5].toggle()
                    } label: {
                        let img = deck.buttonArray[5] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                    Button{
                        deck.buttonArray[6].toggle()
                    } label: {
                        let img = deck.buttonArray[6] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                } .padding(.horizontal)
            }
            HStack{
                //Text("Add two PIERCE 3 cards")
                Text("Add two")
                Image("rolling").perkIconMod()
                Text("PIERCE")
                Image("pierce").perkIconMod()
                Text("3 cards")
                Spacer()
                Button{
                    deck.buttonArray[7].toggle()
                } label: {
                    let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
            
            HStack{
                //Text("Add one STUN card)")
                Text("Add one")
                Image("rolling").perkIconMod()
                Text("STUN")
                Image("stun").perkIconMod()
                Text("card")
                Spacer()
                
                Button{
                    deck.buttonArray[8].toggle()
                } label: {
                    let img = deck.buttonArray[8] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
                
                Button{
                    deck.buttonArray[9].toggle()
                } label: {
                    let img = deck.buttonArray[9] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
            
            HStack{
                //Text("Add one DISARM \(Image("disarm")) card  and one MUDDLE card")
                
                Group {
                        Text("Add one")
                        Image("rolling").perkIconMod()
                        Text("DISARM")
                        Image("disarm").perkIconMod()
                        Text("card and one")
                        Image("rolling").perkIconMod()
                        Text("MUDDLE")
                        Image("muddle").perkIconMod()
                        Text("card")
                   
                }
//                .lineLimit(1)
//                .fixedSize(horizontal: false, vertical: true)
                Spacer()
                
                Button{
                    deck.buttonArray[10].toggle()
                } label: {
                    let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
            
            HStack{
                //Text("Add one ADD TARGET card")
                Text("Add one")
                Image("rolling").perkIconMod()
                Text("ADD TARGET")
                Image("add_target").perkIconMod()
                Text("card")
                Spacer()
                
                Button{
                    deck.buttonArray[11].toggle()
                } label: {
                    let img = deck.buttonArray[11] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
                Button{
                    deck.buttonArray[12].toggle()
                } label: {
                    let img = deck.buttonArray[12] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
            
            HStack{
                //Text("Add one +1 Shield \(Image(systemName: "shield.fill"))1, self card")
                Text("Add one")
                plusOne()
                Text("Shield")
                Image("shield").perkIconMod()
                Text("1, Self card")
                Spacer()
                
                Button{
                    deck.buttonArray[13].toggle()
                } label: {
                    let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
            
            HStack{
                //Text("Ignore negative item effects and add one +1 card")
                Text("Ignore negative item effects and add one")
                plusOne()
                Text("card")
                
                Spacer()
                Button{
                    deck.buttonArray[14].toggle()
                } label: {
                    let img = deck.buttonArray[14] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
        }
        .minimumScaleFactor(0.1)
        .lineLimit(1)
    }
    
    // Remove two -1 cards
    func rowOne(condition: Bool) {
        
        if condition {
            deck.removeCard("minusOne")
            deck.removeCard("minusOne")
        } else {
            deck.addCard("minusOne")
            deck.addCard("minusOne")
        }
    }
    
    // Replace one -1 card with one +1 card
    func rowTwo(condition: Bool) {
        
        if condition {
            deck.removeCard("minusOne")
            deck.addCard("plusOne")
        } else {
            deck.removeCard("plusOne")
            deck.addCard("minusOne")
        }
    }
    
    // Add two +1 cards
    func rowThree(condition: Bool) {
        
        if condition {
            deck.addCard("plusOne")
            deck.addCard("plusOne")
        } else {
            deck.removeCard("plusOne")
            deck.removeCard("plusOne")
        }
    }
    
    // Add one +3 card
    func rowFour(condition: Bool) {
        
    }
    
    // Add three Push 1 cards
    func rowFive(condition: Bool) {
        
    }
    
    // Add two Pierce 3 cards
    func rowSix(condition: Bool) {
        
    }
    
    // Add one Stun card
    func rowSeven(condition: Bool) {
        
    }
    
    // Add one Disarm card and Muddle card
    func rowEight(condition: Bool) {
        
    }
    
    // Add one Add Target card
    func rowNine(condition :Bool) {
        
    }
    
    // Add one +1 Shield 1 Self card
    func rowTen(condition: Bool) {
        
    }
    
    // Ignore negative item effects and add one +1 card
    func rowEleven(condition: Bool) {
        
    }
}

struct BrutePerk_Previews: PreviewProvider {
    static var previews: some View {
        BrutePerk(deck: Deck())
    }
}
