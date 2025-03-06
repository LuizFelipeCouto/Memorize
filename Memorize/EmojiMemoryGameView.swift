//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Luiz Felipe Aparecido do Couto on 05/01/25.
//

//VIEW UI

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack{
            cards
                .foregroundColor(viewModel.color)
            HStack{
                score
                Spacer()
                shuffle
            }
            .font(.title2)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Pontos: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Embaralhar") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .onTapGesture {
                    withAnimation (){
                        viewModel.choose(card)
                    }
                }
        }
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        return 0
    }
}



struct EmojiMemoryGameView_Preview: PreviewProvider
{
    static var previews: some View {
        EmojiMemoryGameView(viewModel:
                                EmojiMemoryGame())
    }
}
