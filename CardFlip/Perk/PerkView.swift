//
//  PerkView.swift
//  denemetahtası
//
//  Created by Furkan Eken on 21.03.2023.
//

import SwiftUI

struct PerkView: View {
    @ObservedObject var deck: Deck
    var body: some View {
        if deck.characterClass == "Brute" {
            BrutePerk(deck: deck)
        }
    }
}

//struct PerkView_Previews: PreviewProvider {
//    static var previews: some View {
//        PerkView()
//    }
//}
