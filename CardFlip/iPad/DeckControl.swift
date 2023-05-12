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
            VStack{
                HStack(){
                    Button{
                        deck.addBless()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 4)
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(red: 242 / 255, green: 194 / 255, blue: 161 / 255))
                            HStack{
                                Text("Add Bless")
                                Text("(\(String(deck.blessCount)))")
                            }
                        }
                    }
                    .frame(width: width / 2.1 , height: width / 8)
                    Button{
                        deck.deckReset()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 4)
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(red: 242 / 255, green: 194 / 255, blue: 161 / 255))
                            Text("Reset Deck")
                        }
                    }
                    .frame(width: width / 2.1 , height: width / 8)
                    
                }
                HStack{
                    Button{
                        deck.addMinusOne()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 4)
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(red: 242 / 255, green: 194 / 255, blue: 161 / 255))
                            HStack{
                                Text("Add -1")
                                Text("(\(String(deck.minusoneCount)))")
                            }
                        }
                    }
                    .frame(width: width / 2.1, height: width / 8)
                    Button{
                        deck.shuffleUndrawn()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 4)
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(red: 242 / 255, green: 194 / 255, blue: 161 / 255))
                            Text("Shuffle Undrawn")
                        }
                        
                    }
                    .frame(width: width / 2.1, height: width / 8)
                }
                HStack{
                    Button{
                        deck.addCurse()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 4)
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(red: 242 / 255, green: 194 / 255, blue: 161 / 255))
                            HStack{
                                Text("Add Curse")
                                Text("(\(String(deck.curseCount)))")
                            }
                        }
                    }
                    .frame(width: width / 2.1, height: width / 8)
                    Button{
                        deck.undo()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 4)
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(red: 242 / 255, green: 194 / 255, blue: 161 / 255))
                            Text("Undo")
                        }
                    }
                    .frame(width: width / 2.1, height: width / 8)
                }
            }.foregroundColor(.black)
        }
    }
}
