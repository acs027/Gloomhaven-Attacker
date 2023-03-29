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
                    Text("Remove two -1 cards")
                    Spacer()
                    Button{
                        let minusOne = className + Deck.CardNames.minusOne.rawValue
                        let deneme = Deck.CardNames.minusOne.rawValue
                        if deck.buttonArray[0] {
                            deck.addCard(deneme)
                            deck.addCard(deneme)
                        } else {
                            deck.removeCard(deneme)
                            deck.removeCard(deneme)
                        }
                        
                        deck.buttonArray[0].toggle()
                    } label: {
                        let img = deck.buttonArray[0] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                }.padding(.horizontal)
                HStack{
                    Text("Replace one -1 card with one +1 card")
                    Spacer()
                    Button{
                        let minusOne = className + Deck.CardNames.minusOne.rawValue
                        let plusOne = className + Deck.CardNames.plusOne.rawValue
                        let deneme = Deck.CardNames.minusOne.rawValue
                        let denemee = Deck.CardNames.plusOne.rawValue
                        if deck.buttonArray[1] {
                            deck.addCard(deneme)
                            deck.removeCard(denemee)
                        } else {
                            deck.addCard(denemee)
                            deck.removeCard(deneme)
                        }
                        
                        deck.buttonArray[1].toggle()
                    } label: {
                        let img = deck.buttonArray[1] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                } .padding(.horizontal)
                HStack{
                    Text("Add two +1 cards")
                    Spacer()
                    Button{
                        let minusOne = className + Deck.CardNames.plusOne.rawValue
                        let deneme = Deck.CardNames.plusOne.rawValue
                        if deck.buttonArray[2] {
                            deck.removeCard(deneme)
                            deck.removeCard(deneme)
                        } else {
                            deck.addCard(deneme)
                            deck.addCard(deneme)
                        }
                        
                        deck.buttonArray[2].toggle()
                    } label: {
                        let img = deck.buttonArray[2] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                    Button{
                        deck.buttonArray[3].toggle()
                    } label: {
                        let img = deck.buttonArray[3] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                } .padding(.horizontal)
                HStack{
                    Text("Add one +3 card")
                    Spacer()
                    Button{
                        deck.buttonArray[4].toggle()
                    } label: {
                        let img = deck.buttonArray[4] ? "checkmark.square" : "square"
                        Image(systemName: img)
                    }
                } .padding(.horizontal)
                HStack{
                    Text("Add three eklemeli PUSH 1 cards")
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
                Text("Add two PIERCE 3 cards")
                Spacer()
                Button{
                    deck.buttonArray[7].toggle()
                } label: {
                    let img = deck.buttonArray[7] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
            HStack{
                Text("Add one STUN card")
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
                Text("Add one DISARM card and one MUDDLE card")
                Spacer()
                Button{
                    deck.buttonArray[10].toggle()
                } label: {
                    let img = deck.buttonArray[10] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
            HStack{
                Text("Add one ADD TARGET card")
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
                Text("Add one +1 Shield 1 Self card")
                Spacer()
                Button{
                    deck.buttonArray[13].toggle()
                } label: {
                    let img = deck.buttonArray[13] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
            HStack{
                Text("Ignore negative item effects and add one +1 card")
                Spacer()
                Button{
                    deck.buttonArray[14].toggle()
                } label: {
                    let img = deck.buttonArray[14] ? "checkmark.square" : "square"
                    Image(systemName: img)
                }
            } .padding(.horizontal)
        }
    }
}

struct BrutePerk_Previews: PreviewProvider {
    static var previews: some View {
        BrutePerk(deck: Deck())
    }
}
