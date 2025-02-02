//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Luiz Felipe Aparecido do Couto on 05/01/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
