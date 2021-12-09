//
//  DataController.swift
//  Mastermind Game
//
//  Created by Jacky Wong on 8/12/2021.
//

import Foundation
class DataController {
    var dataArray : [Game]
    
    init(){
        self.dataArray = []
        let code = ["green","y", "b", "g"]
        let history = ["r","y", "b", "g"]
        let game = Game(code: code, history: history)
        dataArray.append(game)
    }
    
    func coder1color () -> String{
        return dataArray[0].code[0]
    }
    
    func conut() -> Int{
        return dataArray.count
     }
}
