//
//  Enums.swift
//  RockPapersScissors
//
//  Created by Zion Ceus on 2/6/25.
//

import Foundation

enum Sign: String{
    case Rock = "🪨"
    case Paper = "📝"
    case Scissors = "✂️"

    func checkWinner(computer:Sign) -> GameState {
        if(self == .Rock && computer == .Scissors){
            return GameState.Win
        }
        else if(self == .Rock && computer == .Paper){
            return GameState.Lose
        }
        else if(self == .Rock && computer == .Rock){
            return GameState.Draw
        }
        else if(self == .Paper && computer == .Paper){
            return GameState.Draw
        }
        else if(self == .Paper && computer == .Rock){
            return GameState.Win
        }
        else if(self == .Paper && computer == .Scissors){
            return GameState.Lose
        }
        else if(self == .Scissors && computer == .Scissors){
            return GameState.Draw
        }
        else if(self == .Scissors && computer == .Paper){
            return GameState.Win
        }
        else if(self == .Scissors && computer == .Rock){
            return GameState.Lose
        }
        
        return GameState.Draw
    }
}
enum GameState: String {
    case Start
    case Win
    case Lose
    case Draw
    
    var message: String{
        switch self{
        case .Start:
            return "Rock, Paper, Scissors, Shoot!"
        case .Win:
            return "You won!!! Congrats 🥳"
        case .Lose:
            return "You lost, Loser 🙄"
        case .Draw:
            return "A Draw! Cmon man, try again."
        }
    }
}
