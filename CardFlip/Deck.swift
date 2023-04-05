

import SwiftUI

class Card: Identifiable, Codable {
    var cardID = UUID()
    var cardName = "zero"
    var cardAngle = 0.0
    var cardOffset = 0
    var cardImage = "back"
    
}

@MainActor class Deck: ObservableObject, Codable {
    @Published private(set) var cards: [Card]
    private let animationSpeed : Double = 0.6
    let id = UUID()
    var buttonArray = [Bool]()
    
    var isShuffle = false
    var discardCount = 0
    
    var characterClass = "Brute"
    var characterName = "Brute"
    
    var back = "back"
    private let cardHeight = UIDevice.isIPhone ? UIScreen.screenWidth * 0.75 * 0.65 : UIScreen.screenWidth / 4 * 0.75 * 0.65
    
    var curseCount = 0
    var blessCount = 0
    var minusoneCount = 0
    
    private enum CodingKeys: String, CodingKey {
        case cards
        case animationSpeed
        case id
        case buttonArray
        
        case isShuffle
        case discardCount
        
        case characterClass
        case characterName
        
        case back
        case cardHeight
        case curseCount
        case blessCount
        case minusoneCount
    }
   
    
    init() {
        cards = getCardListByNumber()
        
        for _ in 0...14 {
            buttonArray.append(false)
        }
        
        func createCard(name: CardNames) -> Card {
            let card = Card()
            card.cardName = name.rawValue
            return card
        }

        func getCardListByNumber() -> [Card] {
            let allNames = CardNames.allCases
            var cardArray = [Card]()

            allNames.forEach { type in
                let loopCount = type.defaultDeck()

                for _ in 0..<loopCount {
                    cardArray.append(createCard(name: type))
                }
            }
            return cardArray.shuffled()
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cards, forKey: .cards)
        try container.encode(animationSpeed, forKey: .animationSpeed)
        try container.encode(id, forKey: .id)
        try container.encode(buttonArray, forKey: .buttonArray)
        try container.encode(isShuffle, forKey: .isShuffle)
        try container.encode(discardCount, forKey: .discardCount)
        try container.encode(characterClass, forKey: .characterClass)
        try container.encode(characterName, forKey: .characterName)
        try container.encode(back, forKey: .back)
        try container.encode(cardHeight, forKey: .cardHeight)
        try container.encode(curseCount, forKey: .curseCount)
        try container.encode(blessCount, forKey: .blessCount)
        try container.encode(minusoneCount, forKey: .minusoneCount)
    }
    
    required init(from decoder: Decoder)  throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.cards = try values.decode([Card].self, forKey: .cards)
        self.buttonArray = try values.decode([Bool].self, forKey: .buttonArray)
        self.isShuffle = try values.decode(Bool.self, forKey: .isShuffle)
        self.discardCount = try values.decode(Int.self, forKey: .discardCount)
        self.characterName = try values.decode(String.self, forKey: .characterName)
        self.characterClass = try values.decode(String.self, forKey: .characterClass)
        self.curseCount = try values.decode(Int.self, forKey: .curseCount)
        self.blessCount = try values.decode(Int.self, forKey: .blessCount)
        self.minusoneCount = try values.decode(Int.self, forKey: .minusoneCount)
        
    }
    
    func deckShuffle() {
        cards.removeAll {
            ($0.cardName == "bless" || $0.cardName == "curse") && $0.cardOffset != 0
        }
        
        cardBackAnim()
        
        discardCount = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationSpeed * 1.75) {
            
            self.cards.shuffle()
        }
    }
    
    func cardBackAnim() {
        if !cards.isEmpty {
            withAnimation(.linear(duration: animationSpeed)) {
                objectWillChange.send()
                for flippedCard in cards {
                    if flippedCard.cardOffset != 0 {
                        flippedCard.cardAngle = 0
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + animationSpeed / 2) {
                for flippedCard in self.cards {
                    self.objectWillChange.send()
                    flippedCard.cardImage = self.back
                }
            }
            
            withAnimation(.linear(duration: animationSpeed * 0.75).delay(animationSpeed)) {
                objectWillChange.send()
                for flippedCard in self.cards {
                    flippedCard.cardOffset = 0
                }
            }
        }
    }
    
    func cardAnim(_ card: Card) {
        withAnimation(.linear(duration: animationSpeed))
        {
                objectWillChange.send()
                card.cardAngle = 180
                card.cardOffset = 60

                for flippedCard in cards {
                    if flippedCard.cardOffset != 0 {
                        flippedCard.cardOffset += Int(cardHeight * 1.03)
                    }
                }
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + animationSpeed / 2) {
            self.objectWillChange.send()
            card.cardImage = card.cardName
        }
        discardCount += 1
    }
    
    func shuffleUndrawn(){
        cards.shuffle()
    }
    
    func enableShuffle(_ kart: Card) -> Bool{
        if kart.cardName == "miss" || kart.cardName == "crit" {
            return true
        }
        return isShuffle
    }
    
    func undo(){
        for kart in cards where kart.cardOffset != 0 {
            if kart.cardOffset == (60 + Int(cardHeight * 1.03)) {
                isShuffle = !enableShuffle(kart)
                withAnimation(.linear(duration: animationSpeed)) {
                    objectWillChange.send()
                            kart.cardAngle = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + animationSpeed / 2) {
                        self.objectWillChange.send()
                        kart.cardImage = self.back
                }
                withAnimation(.linear(duration: animationSpeed * 0.75).delay(animationSpeed)) {
                    objectWillChange.send()
                        kart.cardOffset = 0
                }
            } else {
                withAnimation(.linear(duration: animationSpeed).delay(animationSpeed)) {
                    objectWillChange.send()
                    kart.cardOffset -= Int(cardHeight * 1.03)
                }
            }
        }
        if discardCount > 0 {
            discardCount -= 1
        }
        
    }
    
    func addCurse() {
        let curse = Card()
        curse.cardName = "curse"
        
        cards.append(curse)
        curseCount += 1
        shuffleUndrawn()
    }
    
    func addBless() {
        let bless = Card()
        bless.cardName = "bless"
        
        cards.append(bless)
        blessCount += 1
        shuffleUndrawn()
    }
    
    func addMinusOne() {
        let minusone = Card()
        minusone.cardName = "minusOneScenario"
        
        cards.append(minusone)
        minusoneCount += 1
        shuffleUndrawn()
    }
    
    func blessCurseCheck(_ kart: Card) {
        if kart.cardName == "bless" {
            blessCount -= 1
        }
        if kart.cardName == "curse" {
            curseCount -= 1
        }
    }
    
    func deckReset() {
        deckShuffle()
        cards.removeAll {
            $0.cardName == "bless" || $0.cardName == "curse" || $0.cardName == "minusOneScenario"
        }
        blessCount = 0
        curseCount = 0
        minusoneCount = 0
        isShuffle = false
    }
    
    func addCard(cardName: String, count: Int = 1){
        
        for _ in 0..<count {
            let newCard = Card()
            newCard.cardName = cardName
            cards.append(newCard)
        }
    }
    
    func removeCard(cardName: String, count: Int = 1){
        for _ in 0..<count {
            if let index = cards.firstIndex(where: {$0.cardName == cardName}) {
                cards.remove(at: index)
            }
        }
    }
    
    func replaceCard(addCardName: String, addCount: Int = 1, remCardName: String, remCount: Int = 1) {
        addCard(cardName: addCardName, count: addCount)
        removeCard(cardName: remCardName, count: remCount)
    }
    
    func autoCard(condition: Bool, cardName: String, count: Int = 1) {
        if condition {
            addCard(cardName: cardName, count: count)
        } else {
            removeCard(cardName: cardName, count: count)
        }
    }
    
    func autoRepCard(condition: Bool, cardNameA: String, countA: Int = 1, cardNameB: String, countB: Int = 1) {
        if condition {
            replaceCard(addCardName: cardNameA, addCount: countA, remCardName: cardNameB, remCount: countB)
        } else {
            replaceCard(addCardName: cardNameB, addCount: countB, remCardName: cardNameA, remCount: countA)
        }
    }
    
    func refresh() {
        objectWillChange.send()
    }
    
    
    
    func characterCreation(_ name: String, _ klass: String){
        objectWillChange.send()
        characterName = name
        characterClass = klass
    }
    
    enum CardNames: String, CaseIterable {
        case zero
        case minusOne
        case minusTwo
        case plusOne
        case plusTwo
        case miss
        case crit

        func defaultDeck() -> Int {
            switch self {
                case .zero:
                    return 6
                case .minusOne, .plusOne:
                    return 5
                case .minusTwo, .plusTwo, .miss, .crit:
                    return 1
            }
        }
    }
}
