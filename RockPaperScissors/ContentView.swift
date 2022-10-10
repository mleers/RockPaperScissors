//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mitch on 10/9/22.
//

import SwiftUI

struct EmojiChoiceStyle: View {
    var string: String
    
    var body: some View {
        Text(string)
            .font(.system(size: 50))
            .shadow(color: .white, radius: 5)
    }
}

struct ContentView: View {
    @State private var gameChoice = 0
    @State private var tryToWin = false
    @State private var choice = "✋"
    @State private var gameChoiceEmoji = ["👊", "✋", "✌️"]
    
    @State private var score = 0
    @State private var rounds = 10
    @State private var gameOver = false
    
    var body: some View {
        ZStack {
            Color(red: 56/255, green: 51/255, blue: 115/255)
            
            VStack(spacing: 75) {
                Text("Rounds left: \(rounds)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                HStack {
                    Text("Try to")
                        .foregroundColor(.white)


                    if tryToWin {
                        Text("win")
                            .foregroundColor(.green)
                    } else {
                        Text("lose")
                            .foregroundColor(.red)
                    }
                    Text("vs:")
                        .foregroundColor(.white)

                }
                .font(.title)
                
                Text("\(choice)")
                    .font(.system(size: 100))
                
                HStack(spacing: 50) {
                    Button {
                        // you are rock, gain point vs scissors win and paper !win
                        if choice == gameChoiceEmoji[2] && tryToWin || choice == gameChoiceEmoji[1] && !tryToWin {
                            score += 1
                        } else {
                            score -= 1
                        }
                        nextRound()
                    } label: {
                        EmojiChoiceStyle(string: "👊")
                    }
                    
                    Button {
                        // you are paper, gain point vs rock win and scissors !win
                        if choice == gameChoiceEmoji[0] && tryToWin || choice == gameChoiceEmoji[2] && !tryToWin {
                            score += 1
                        } else {
                            score -= 1
                        }
                        nextRound()
                    } label: {
                        EmojiChoiceStyle(string: "✋")
                    }
                    
                    Button {
                        // you are scissors, gain point vs paper win and rock !win
                        if choice == gameChoiceEmoji[1] && tryToWin || choice == gameChoiceEmoji[0] && !tryToWin {
                            score += 1
                        } else {
                            score -= 1
                        }
                        nextRound()
                    } label: {
                        EmojiChoiceStyle(string: "✌️")
                    }
                }
            }
        }
        
        .alert("Game over!", isPresented: $gameOver) {
            Button("Restart", action: reset)
        } message: {
            Text("Your score is: \(score)!")
        }
    }
    
    func nextRound() {
        gameChoice = Int.random(in: 0...2)
        choice = gameChoiceEmoji[gameChoice]
        
        tryToWin = Bool.random()
        rounds -= 1
        
        if rounds == 0 {
            gameOver = true
        }
    }
    
    func reset() {
        score = 0
        rounds = 10
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
