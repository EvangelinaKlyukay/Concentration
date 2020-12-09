//
//  Card.swift
//  Concentration
//
//  Created by Евангелина Клюкай on 19.11.2020.
//

import Foundation

struct Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
   
    var isFaceUp = false
    var isMatched = false
    private var id: Int
    
   private static var identifierNumber = 0
    
   private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.id = Card.identifierGenerator()
    }
}
