//
//  MemoryGame.swift
//  Memorize
//
//  Created by Luiz Felipe Aparecido do Couto on 31/01/25.
//
//MODEL

import Foundation

struct MemoryGame<CardContent>  {
   private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content))
            cards.append(Card( content: content))
        }
    }
      
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
