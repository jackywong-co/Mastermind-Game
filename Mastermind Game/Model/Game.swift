//
//  Game.swift
//  Mastermind Game
//
//  Created by Jacky Wong on 8/12/2021.
//

import Foundation

class Game {
  
    var code : [Int]
    var inputPegs : [[Int]]
    var pins : [[Int]]
    
    var round = 0
    
    init(){
        self.code = []
        for _ in 0..<4 {
            let ansPes = Int.random(in: 0...5)
            code.append(ansPes)
        }
        self.inputPegs = []
        self.pins = []
        for _ in 0..<10 {
            var inputPegsByRow = [Int]()
            var pinsPegsByRow = [Int]()
            for _ in 0..<4{
                inputPegsByRow.append(-1)
                pinsPegsByRow.append(-1)
            }
            inputPegs.append(inputPegsByRow)
            pins.append(pinsPegsByRow)
        }
    }
    
    func nextRound(){
        round += 1
    }
}
