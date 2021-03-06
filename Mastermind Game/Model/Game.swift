//
//  Game.swift
//  Mastermind Game
//
//  Created by Jacky Wong on 8/12/2021.
//

import Foundation

class Game {
    
    var code : [Int]
    var inputPegs : [Int]
    var pins : [Int]
    var record : [[[Int]]]
    var round : Int
    
    
    init(){
        self.code = [0,0,0,0]
        self.record = []
        self.inputPegs = [8,8,8,8]
        self.pins = []
        self.round = 0
    }
    
    func addRound() -> [Int]{
        self.round += 1
        return [round]
    }
 
    func addImputs() -> [Int]{
        return inputPegs
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
    
    // generate random number that do not repeat funcation
    func generateRandomNumber(_ from:Int, _ to:Int, _ qut:Int?) -> [Int] {
        var randomNumbers = [Int]() //All our generated numbers
        var numberOfNumbers = qut //How many numbers to generate

        let lower = UInt32(from) //Generate from this number..
        let higher = UInt32(to+1) //To this one

        if numberOfNumbers == nil || numberOfNumbers! > (to-from) + 1 {
            numberOfNumbers = (to-from) + 1
        }

        while randomNumbers.count != numberOfNumbers {
            let myNumber = arc4random_uniform(higher - lower) + lower

            if !randomNumbers.contains(Int(myNumber)) {
                randomNumbers.append(Int(myNumber))
            }
        }
        return  randomNumbers
    }
}
