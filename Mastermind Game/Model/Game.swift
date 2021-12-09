//
//  Game.swift
//  Mastermind Game
//
//  Created by Jacky Wong on 8/12/2021.
//

import Foundation

class Game {
  
    var code : [Int]
    var color = ["Red", "Blue","Yellow","Green","Purple","Brown"]
    
    init(){
        self.code = [Int]()
        
    }
    func getColor () -> [String]{
        return color
    }
    // set code with color
    func setCode() -> [String] {
        var code = [String]()
        var randomCode = getRandomCode()
        // convert random code array from int to string
        var stringRandomCode = randomCode.map {String($0)}
        code = stringRandomCode
        print(stringRandomCode)
        for index in 0..<4{
            switch code[index] {
            case "0" :
                code[index] = color[0]
            case "1" :
                code[index] = color[1]
            case "2" :
                code[index] = color[2]
            case "3" :
                code[index] = color[3]
            case "4" :
                code[index] = color[4]
            case "5" :
                code[index] = color[5]
            default:
                print("error")
            }
        }
        print(code)
        return code
    }
    
    
    
    // generate random number that do not repeat
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
    // set random code
    func getRandomCode() -> [Int]{
        var randomCode = [Int]()
      
           randomCode = generateRandomNumber(0, 5, 4)
        
        return randomCode
    }
    
    
}
