//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Евангелина Клюкай on 19.11.2020.
//

import Foundation

class ConcentrationGame {
    
   private(set) var cards = [Card]()
    
   private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex] == cards[index] {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCard: Int) {
        assert(numberOfPairsOfCard > 0, "ConcentrationGame.init(\(numberOfPairsOfCard): must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
    }
}
