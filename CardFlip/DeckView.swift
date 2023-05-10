//
//  DeckView.swift
//  CardFlip
//
//  Created by Furkan Eken on 1.03.2023.
//

import SwiftUI

struct DeckView: View {
    @StateObject var deck: Deck
    @EnvironmentObject var decks: Decks
    
    let cardWidth = UIScreen.screenWidth * 0.75
    let cardHeight = UIScreen.screenWidth * 0.75 * 0.65
    
    @Binding var showMenu: Bool
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    @State private var showControl: Bool = false
    
    var body: some View {
        let sideBarWidth = getRect().width - 90
        
        HStack {
            SideMenu(showMenu: $showMenu, deck: deck)
                .ignoresSafeArea()
                .environmentObject(decks)
            ZStack{
                Image(deck.characterClass.lowercased())
                    .renderingMode(.template)
                    .foregroundColor(.primary)
                    .opacity(0.5)
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text(deck.characterName)
                                .frame(maxWidth: .infinity ,alignment: .leading)
                                .padding()
                                .lineLimit(2)
                            Text("\(deck.cards.count - deck.discardCount)")
                                .animation(nil)
                                .frame(maxWidth: .infinity ,alignment: .center)
                            Button {
                                deck.deckShuffle()
                                deck.isShuffle = false
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color(red: 246 / 255, green: 223 / 255, blue: 201 / 255))
                                        .opacity(deck.isShuffle ? 0.7 : 0)
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black)
                                        .opacity(deck.isShuffle ? 1 : 0)
                                    Text("Shuffle")
                                }.padding(.vertical)
                            }
                            .disabled(!deck.isShuffle)
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            .padding()
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
                                        deck.isShuffle = deck.isShuffle ? true : deck.enableShuffle(card)
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
                .onShake {
                    if deck.isShuffle {
                        deck.deckShuffle()
                        deck.isShuffle = false
                    }
                }
                .overlay(
                    Rectangle()
                        .fill(
                            Color.primary
                                .opacity(Double((offset / sideBarWidth) / 5))
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation{
                                showMenu.toggle()
                                
                                if showMenu {
                                    offset = sideBarWidth
                                    lastStoredOffset = offset
                                } else {
                                    offset = 0
                                    lastStoredOffset = 0
                                }
                            }
                        }
                        .disabled(!showMenu)
                )
            }
        }
        .frame(width: getRect().width + sideBarWidth)
        .offset(x: -sideBarWidth / 2)
        .offset(x: offset > 0 ? offset : 0)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    let sideBarWidth = getRect().width - 90
                    let translation = value.translation.width
                    withAnimation {
                        if translation >= 0 && translation < sideBarWidth {
                            offset = translation
                        } else if translation < 0 && offset >= (sideBarWidth * 0.5) {
                            offset = (sideBarWidth + translation)
                        }
                    }
                })
                .onEnded(onEnd(value:))
        )

        .animation(.easeOut, value: offset == 0)
    }
    
    func onEnd(value: DragGesture.Value){
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation {
            if translation > 0 {
                showMenu = translation > (sideBarWidth / 2)
            }
            else {
                showMenu = !(abs(translation) > sideBarWidth / 2)
            }
            
            if showMenu {
                offset = sideBarWidth
                lastStoredOffset = offset
            } else {
                offset = 0
                lastStoredOffset = 0
            }
        }
        lastStoredOffset = offset
    }
}

