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
    
    let cardWidth = UIDevice.isIPhone ? UIScreen.screenWidth * 0.75 : UIScreen.screenWidth / 4 * 0.75
    let cardHeight = UIDevice.isIPhone ? UIScreen.screenWidth * 0.75 * 0.65 : UIScreen.screenWidth / 4 * 0.75 * 0.65
    
    @State var showMenu: Bool = false
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        let sideBarWidth = getRect().width - 90
        
        HStack {
            SideMenu(showMenu: $showMenu, deck: deck)
                .ignoresSafeArea()
                .environmentObject(decks)
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
                    }
                }
            )
        }
        .frame(width: getRect().width + sideBarWidth)
        .offset(x: -sideBarWidth / 2)
        .offset(x: offset > 0 ? offset : 0)
        .gesture(
            DragGesture()
                .updating($gestureOffset, body: {value, out, _ in
                    out = value.translation.width
                })
                .onEnded(onEnd(value:))
        )
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu){ newValue in
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset){ newValue in
            onChange()
        }
    }
    
    func onChange(){
        let sideBarWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset < sideBarWidth ? gestureOffset : offset) : offset
    }
    
    func onEnd(value: DragGesture.Value){
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            if translation > 0 {
                if translation > (sideBarWidth / 2){
                    offset = sideBarWidth
                    showMenu = true
                }
                else {
                    if offset == sideBarWidth {
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            }
            else {
                if -translation > (sideBarWidth / 2){
                    offset = 0
                    showMenu = false
                }
                else {
                    
                    if offset == 0 || !showMenu {
                        return
                    }
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        lastStoredOffset = offset
    }
}

