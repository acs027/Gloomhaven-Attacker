//
//  DeckControl.swift
//  CardFlip
//
//  Created by Furkan Eken on 21.04.2023.
//

import SwiftUI

struct DeckControl: View {
    var width: CGFloat
    @ObservedObject var deck: Deck
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
            VStack{
                HStack(){
                    Button{
                        deck.addBless()
                    } label: {
                        HStack{
                            Text("Add Bless")
                            Text("(\(String(deck.blessCount)))")
                        }
                    }
                    .frame(width: width / 2, height: width / 8)
                    Button{
                        deck.deckReset()
                    } label: {
                        Text("Reset Deck")
                    }
                    .frame(width: width / 2, height: width / 8)
                    
                }
                HStack{
                    Button{
                        deck.addMinusOne()
                    } label: {
                        HStack{
                            Text("Add -1")
                            Text("(\(String(deck.minusoneCount)))")
                        }
                    }
                    .frame(width: width / 2, height: width / 8)
                    Button{
                        deck.shuffleUndrawn()
                    } label: {
                        Text("Shuffle Undrawn")
                    }
                    .frame(width: width / 2, height: width / 8)
                }
                HStack{
                    Button{
                        deck.addCurse()
                    } label: {
                        HStack{
                            Text("Add Curse")
                            Text("(\(String(deck.curseCount)))")
                        }
                    }
                    .frame(width: width / 2, height: width / 8)
                    Button{
                        deck.undo()
                    } label: {
                        Text("Undo")
                    }
                    .frame(width: width / 2, height: width / 8)
                }
            }
        }
    }
}
