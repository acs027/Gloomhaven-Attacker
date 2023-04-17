//
//  PerkView.swift
//  denemetahtası
//
//  Created by Furkan Eken on 21.03.2023.
//

import SwiftUI

extension Image {
    func perkIconMod() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(height: 25)
    }
}

struct minusTwo: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 23)
            Text("-2")
                .font(.custom("PirataOne-Regular", size: 18))
        }
    }
}

struct minusOne: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 23)
            Text("-1")
                .font(.custom("PirataOne-Regular", size: 18))
        }
    }
}

struct plusZero: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 23)
            Text("+0")
                .font(.custom("PirataOne-Regular", size: 18))
        }
    }
}

struct plusOne: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 23)
            Text("+1")
                .font(.custom("PirataOne-Regular", size: 18))
        }
    }
}

struct plusTwo: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 23)
            Text("+2")
                .font(.custom("PirataOne-Regular", size: 18))
        }
    }
}

struct plusThree: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 23)
            Text("+3")
                .font(.custom("PirataOne-Regular", size: 18))
        }
    }
}

struct plusFour: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 23)
            Text("+4")
                .font(.custom("PirataOne-Regular", size: 18))
        }
    }
}

struct PerkView: View {
    @ObservedObject var deck: Deck
    @EnvironmentObject var decks: Decks
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            switch deck.characterClass {
            case "Brute":
                BrutePerk(deck: deck)
            case "Spellweaver":
                SpellweaverPerk(deck: deck)
            case "Mindthief":
                MindthiefPerk(deck: deck)
            case "Scoundrel":
                ScoundrelPerk(deck: deck)
            case "Tinkerer":
                TinkererPerk(deck: deck)
            case "Cragheart":
                CragheartPerk(deck: deck)
            case "Berserker":
                BerserkerPerk(deck: deck)
            case "BeastTyrant":
                BeastTyrantPerk(deck: deck)
            case "Doomstalker":
                DoomstalkerPerk(deck: deck)
            case "Elementalist":
                ElementalistPerk(deck: deck)
            case "Nightshroud":
                NightshroudPerk(deck: deck)
            case "Plagueherald":
                PlagueHeraldPerk(deck: deck)
            case "Quartermaster":
                QuartermasterPerk(deck: deck)
            case "Sawbones":
                SawbonesPerk(deck: deck)
            case "Soothsinger":
                SoothsingerPerk(deck: deck)
            case "Summoner":
                SummonerPerk(deck: deck)
            case "Sunkeeper":
                SunkeeperPerk(deck: deck)
                
            case "Diviner":
                DivinerPerk(deck: deck)
                
            case "RedGuard":
                RedGuardPerk(deck: deck)
            case "Hatchet":
                HatchetPerk(deck: deck)
            case "Demolitionist":
                DemolitionistPerk(deck: deck)
            case "Voidwarden":
                VoidwardenPerk(deck: deck)
                
            default:
                Text("---")
            }
            
                
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarItems(
            leading: Button(action: {
                // Handle the back button action here
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7 * 1.75) {
                    decks.save()
                }
                deck.deckShuffle()
                deck.isShuffle = false
                self.presentationMode.wrappedValue.dismiss() // Dismiss
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.blue)
                Text("Back")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.blue)
            }
        )
    }
}
