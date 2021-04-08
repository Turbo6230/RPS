//
//  GameState.swift
//  RPS
//
//  Created by Angielina Rutledge on 4/8/21.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var status: String {
        switch self {
        case .start:
            return "play Rock Paper Scissors? "
        case .win:
            return "Wow!"
        case .lose:
            return "Loser"
        case .draw:
            return "It's a tie."
        }
    }
}
