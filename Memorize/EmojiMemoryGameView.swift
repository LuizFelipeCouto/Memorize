//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Luiz Felipe Aparecido do Couto on 05/01/25.
//

//VIEW UI

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
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
                        .padding(spacing)
                        .onTapGesture {
                            viewModel.choose(card)
                }
        }
        .foregroundColor(viewModel.color)
    }
}



struct EmojiMemoryGameView_Preview: PreviewProvider
    {
    static var previews: some View {
        EmojiMemoryGameView(viewModel:
            EmojiMemoryGame())
    }
}
