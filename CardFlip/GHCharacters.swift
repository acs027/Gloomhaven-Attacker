//
//  GHCharacters.swift
//  CardFlip
//
//  Created by ali cihan saraç on 28.02.2023.
//

//import Foundation
//
//class GHCharacters: ObservableObject {
//    @Published var characters = [GHCharacter]() {
//        didSet {
//            
//            
//            if let encoded = try? JSONEncoder().encode(characters) {
//                UserDefaults.standard.set(encoded, forKey: "Characters")
//            }
//        }
//    }
//    
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Characters") {
//            if let decodedItems = try? JSONDecoder().decode([GHCharacter].self, from: savedItems) {
//                characters = decodedItems
//                return
//            }
//        }
//        characters = []
//    }
//}
