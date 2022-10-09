//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mitch on 10/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var gameChoice = 0
    @State private var tryToWin = false
    
    @State private var choices = ["Rock", "Paper", "Scissors"]
    @State private var gameChoiceEmoji = ["👊", "✋", "✌️"]
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Text("Try to")

                if tryToWin {
                    Text("win")
                        .foregroundColor(.green)
                } else {
                    Text("lose")
                        .foregroundColor(.red)
                }
                Text("vs:")
            }
            
            Text(gameChoiceEmoji[gameChoice])
                .font(.system(size: 100))
            
            HStack(spacing: 50) {
                Button {
                    // do something
                } label: {
                    Text("👊")
                        .font(.system(size: 50))
                }
                Button {
                    // do something
                } label: {
                    Text("✋")
                        .font(.system(size: 50))
                }
                
                Button {
                    // do something
                } label: {
                    Text("✌️")
                        .font(.system(size: 50))
                }
            }
            
            Text("Score: \(score)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
