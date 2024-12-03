//
//  ContentView.swift
//  Memorize
//
//  Created by Luiz Felipe Aparecido do Couto on 30/11/24.
//
//base é o estilo do card
//onTapGesture é a ação do card
// let é uma constante
//var é uma variável

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["👻","🎃","🕷️","😈","😈"]
    var body: some View {
        
        HStack {
            ForEach (emojis.indices, id: \.self ){ index in
                CardView(content:  emojis[index])
            }
            
        }
        
        .foregroundColor(.orange)
        
        .padding()
        
    }
    
}

struct CardView: View{
    let content : String
    @State var isFaceUp = true
    var body : some View{
        
        ZStack{
            
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp{
                
                base.fill(.white)
                
                base.strokeBorder(lineWidth: 2)
                
                Text(content).font(.largeTitle)
                
            } else{
                
                base.fill()
                
            }
            
            
        }

        .onTapGesture {
            
            isFaceUp.toggle()
            
        }
        
    }
    
}

#Preview {
    
    ContentView()
    
}
