//
//  FlagGuessingViewContrroller.swift
//  guessTheFlag
//
//  Created by Jon Spight on 4/25/24.
//

import SwiftUI

@Observable
class FlagGuessingViewModel : ObservableObject {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    var correctAnswer = Int.random(in: 0...2)
    var showingScore = false
    var scoreTitle = ""
    var score = 0
    var rotateAmount = 0.0
    var opacitAmount = 1.0
    var selected = false
    
    func flagTapped( _ number: Int){
        if number == correctAnswer{
            scoreTitle = "That is Correct"
            score += 1
        }else {
            scoreTitle = "Wrong, you tapped the \(countries[number]) flag"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0..<3)
    }
    
}
