//
//  iPadDeckView.swift
//  CardFlip
//
//  Created by Furkan Eken on 21.04.2023.
//

import SwiftUI

struct iPadDeckView: View {
    @StateObject var deck: Deck
    @EnvironmentObject var decks: Decks
    
    let cardWidth = UIScreen.screenWidth / 4 * 0.75
    let cardHeight = UIScreen.screenWidth / 4 * 0.75 * 0.65
    
    @State private var showControl: Bool = false
    
    var body: some View {
            ZStack{
                Image(deck.characterClass)
                    .renderingMode(.template)
                    .foregroundColor(.primary)
                    .opacity(0.5)
                ScrollView {
                    VStack {
                        HStack {
                            Text(deck.characterName)
                                .frame(maxWidth: .infinity ,alignment: .leading)
                                .padding()
                            Text("\(deck.cards.count - deck.discardCount)")
                                .animation(nil)
                                .frame(maxWidth: .infinity ,alignment: .center)
                            Button {
                                deck.deckShuffle()
                                deck.isShuffle = false
                            } label: {
                                Text("Shuffle")
                            }
                            .disabled(!deck.isShuffle)
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            .padding()
                        }
                        if showControl {
                            DeckControl(width: UIScreen.screenWidth / 4 ,deck: deck)
                                .frame(width: UIScreen.screenWidth / 4)
                        }
                        Button{
                            withAnimation{
                                showControl.toggle()
                            }
                        } label : {
                            Text("Deck Controls")
                        }
                        
                        ZStack {
                            ForEach(deck.cards, id: \.cardID) { card in
                                Image(card.cardImage)
                                    .resizable()
                                    .cornerRadius(15)
                                    .frame(width: cardWidth, height: cardHeight)
                                    .rotation3DEffect(.degrees(card.cardAngle), axis: (x: 1, y: 0, z: 0))
                                    .offset(y: CGFloat(card.cardOffset))
                                    .onTapGesture {
                                        deck.cardAnim(card)
                                        deck.isShuffle = deck.enableShuffle(card)
                                        deck.blessCurseCheck(card)
                                        AppDelegate.decks = decks
                                    }
                                    .allowsHitTesting(card.cardOffset == 0)
                                    .frame(width: cardWidth * 1.33)
                            }
                        }
                        Spacer()
                        ForEach(0..<deck.discardCount, id: \.self) { _ in
                            Rectangle()
                                .frame(width: cardWidth, height: cardHeight + 5)
                                .opacity(0)
                        }
                    }
                }
        }
    }
}


