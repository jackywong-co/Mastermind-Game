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
        self.inputPegs = [8,8,8,8]
        self.pins = []
    }
    func addRound(round:Int) -> [Int]{
        self.round += 1
        return [round]
    }
    
    
 
    func addImputs(input1: Int,input2: Int,input3: Int,input4: Int) -> [Int]{
        self.inputPegs = []
        self.inputPegs.append(input1)
        self.inputPegs.append(input2)
        self.inputPegs.append(input3)
        self.inputPegs.append(input4)
        return [input1,input2,input3,input4]
    }
  
    func addPins() -> [Int]{
        print(inputPegs)
        var resultPins = [Int]()
        var checked = [0,0,0,0]
        // check color and position
        for i in 0..<4{
            if inputPegs[i] == code[i]{
                resultPins.append(6)
                checked[i] = 1
            }
            
        }
        // check color only
        for i in 0..<4{
            for j in 0..<4{
                if i != j {
                    if inputPegs[i] == code[j]{
                        if checked[i] == 0 {
                            resultPins.append(7)
                        checked[i] = 1
                        }
                    }
                }
            }
        }
        
        for _ in 0..<4{
            if resultPins.count < 4 {
                resultPins.append(8)
            }
        }
        
        for i in checked{
            print(checked[i])
        }
        return resultPins
    }
    
    
    func setInputPegs() -> [Int]{
        inputPegs = [8,8,8,8]
        return inputPegs
    }
    
    func generateRandomNumber(_ from:Int, _ to:Int, _ qut:Int?) -> [Int] {
        var randomNumbers = [Int]()
        var numberOfNumbers = qut
        
        let lower = UInt32(from)
        let highter = UInt32(to-1)
        
        if numberOfNumbers == nil || numberOfNumbers! > (to-from) + 1{
            numberOfNumbers = (to-from) + 1
        }
        while randomNumbers.count != numberOfNumbers {
            let num = arc4random_uniform(highter - lower) + lower
            if !randomNumbers.contains(Int(num)){
                randomNumbers.append(Int(num))
            }
        }
        return randomNumbers
    }
    
}
