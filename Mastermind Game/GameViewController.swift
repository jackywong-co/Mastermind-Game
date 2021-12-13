//
//  GameViewController.swift
//  Mastermind Game
//
//  Created by Jacky Wong on 4/12/2021.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var game : Game = Game()
    
    // MARK: - Outlets
    @IBOutlet var codeButtons: [UIButton]!
    @IBOutlet var colorButtons: [UIButton]!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet weak var colorView: UIStackView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGame()
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        game.record.append([game.addRound(round: 1), game.addImput(input1: 2, input2: 0, input3: 1, input4: 2)])
        game.record.append([game.addRound(round: 2), game.addImput(input1: 1, input2: 1, input3: 2, input4: 2)])
        print(game.record)
       
    }
    // MARK: - Get start the game
    func setGame(){
        self.game = Game()
        // set code
        for codeButton in codeButtons {
            let index = codeButton.tag
            let code = game.code[index]
            codeButton.setImage(getColor(code: code), for: .normal)
        }
        // set color button background color
        for colorButton in colorButtons {
            let index = colorButton.tag
            colorButton.setImage(getColor(code: index), for: .normal)
        }
    }
    
    func getColor(code : Int) -> UIImage {
        switch(code){
        case 0:
            return UIImage(named: "Red")!
        case 1:
            return UIImage(named: "Blue")!
        case 2:
            return UIImage(named: "Yellow")!
        case 3:
            return UIImage(named: "Green")!
        case 4:
            return UIImage(named: "Purple")!
        case 5:
            return UIImage(named: "Brown")!
        default:
            return UIImage(named: "Black")!
        }
    }
    
    // MARK: - Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.record.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GameTableViewCell else {
            fatalError("Can't instantiate GameTableViewCell")
        }
        
        cell.roundLabel?.text = String(indexPath.row+1)
        // set record
        cell.colorButtons[0].setImage(getColor(code: game.record[indexPath.row][1][0]), for: .normal)
        cell.colorButtons[1].setImage(getColor(code: game.record[indexPath.row][1][1]), for: .normal)
        cell.colorButtons[2].setImage(getColor(code: game.record[indexPath.row][1][2]), for: .normal)
        cell.colorButtons[3].setImage(getColor(code: game.record[indexPath.row][1][3]), for: .normal)
        
        // set pin
        cell.pinButtons[0].setImage(getColor(code: game.record[indexPath.row][2][0]), for: .normal)
        cell.pinButtons[0].setImage(getColor(code: game.record[indexPath.row][2][1]), for: .normal)
        cell.pinButtons[0].setImage(getColor(code: game.record[indexPath.row][2][2]), for: .normal)
        cell.pinButtons[0].setImage(getColor(code: game.record[indexPath.row][2][3]), for: .normal)

        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}



