//
//  Game.swift
//  Mastermind Game
//
//  Created by Jacky Wong on 8/12/2021.
//

import Foundation

class Game {
  
    var code : [Int]
    var record : [[[Int]]]
    var inputPegs : [Int]
    var pins : [Int]
    
    var round = 0
   
    
    init(){
        self.code = []
        for _ in 0..<4 {
            let ansPes = Int.random(in: 0...5)
            code.append(ansPes)
        }
        self.record = []
        self.inputPegs = []
        self.pins = []
    }
    func addImput(input1: Int,input2: Int,input3: Int,input4: Int) -> [Int]{
        self.inputPegs.append(input1)
        self.inputPegs.append(input2)
        self.inputPegs.append(input3)
        self.inputPegs.append(input4)
        return [input1,input2,input3,input4]
    }
    func addRound(round:Int) -> [Int]{
        return [round]
    }
    
//    func check() -> [Int] {
//        let pegsByRow = inputPegs[round]
//        var checked = [0, 0, 0, 0]
//        var pinsByRow = [Int]()
//        //check color and pos
//        for i in 0..<4 {
//            if inputPegs[i] == pegsByRow[i] {
//                pinsByRow.append(1)
//                checked[i] = 1
//            }
//        }
//        //check color only
//        for i in 0..<4 {
//            for j in 0..<4 {
//                if i != j {
//                    if inputPegs[i] == pegsByRow[j] {
//                        if checked[i] == 0 {
//                            pinsByRow.append(0)
//                            checked[i] = 1
//                        }
//                    }
//                }
//            }
//        }
//        self.pins[round] = pinsByRow
//        return pinsByRow
//    }
//
    func nextRound(){
        round += 1
    }
}
