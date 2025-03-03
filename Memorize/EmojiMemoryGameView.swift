//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Luiz Felipe Aparecido do Couto on 05/01/25.
//
//  base é o estilo do card
//  onTapGesture é a ação do card
//  let é uma constante
//  var é uma variável

//VIEW UI

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack{
                cards
                    .animation(.default, value: viewModel.cards)
            
            Button("Embaralhar") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
                    CardView(card)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                }
        }
        .foregroundColor(Color.orange)
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body : some View{
        
        ZStack{
            
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0 )
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1 )
            
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

struct EmojiMemoryGameView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
    
    
}
