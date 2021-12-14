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
    @IBOutlet var inputButtons: [UIButton]!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet weak var colorView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGame()
        // set table
        self.tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        self.tableView.rowHeight = 55
        


        
        print(game.record)
        let tapGestureRecognizer0 = UITapGestureRecognizer(target: self, action: #selector(handleTapOnImageView(gestureRecognizer:)))
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(handleTapOnImageView(gestureRecognizer:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(handleTapOnImageView(gestureRecognizer:)))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(handleTapOnImageView(gestureRecognizer:)))
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(handleTapOnImageView(gestureRecognizer:)))
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(handleTapOnImageView(gestureRecognizer:)))
       
        colorButtons[0].addGestureRecognizer(tapGestureRecognizer0)
        colorButtons[1].addGestureRecognizer(tapGestureRecognizer1)
        colorButtons[2].addGestureRecognizer(tapGestureRecognizer2)
        colorButtons[3].addGestureRecognizer(tapGestureRecognizer3)
        colorButtons[4].addGestureRecognizer(tapGestureRecognizer4)
        colorButtons[5].addGestureRecognizer(tapGestureRecognizer5)
    }
    
    @IBAction func resetInput1(_ sender: UIButton) {
        sender.setImage(getColor(code: 8), for: .normal)
        game.inputPegs[0] = 8
    }
    @IBAction func resetInput2(_ sender: UIButton) {
        sender.setImage(getColor(code: 8), for: .normal)
        game.inputPegs[1] = 8
    }
    @IBAction func resetInput3(_ sender: UIButton) {
        sender.setImage(getColor(code: 8), for: .normal)
        game.inputPegs[2] = 8
    }
    @IBAction func resetInput4(_ sender: UIButton) {
        sender.setImage(getColor(code: 8), for: .normal)
        game.inputPegs[3] = 8
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
    
    @objc func handleTapOnImageView(gestureRecognizer: UITapGestureRecognizer) {
        print("tag : \(gestureRecognizer.view?.tag ?? 0)")
       
        if game.inputPegs[0] == 8 {
            game.inputPegs[0] = gestureRecognizer.view?.tag ?? 8
            inputButtons[0].setImage(getColor(code: Int(gestureRecognizer.view?.tag ?? 8)), for: .normal)
        } else if game.inputPegs[1] == 8 {
            game.inputPegs[1] = gestureRecognizer.view?.tag ?? 8
            inputButtons[1].setImage(getColor(code: Int(gestureRecognizer.view?.tag ?? 8)), for: .normal)
        } else if game.inputPegs[2] == 8 {
            game.inputPegs[2] = gestureRecognizer.view?.tag ?? 8
            inputButtons[2].setImage(getColor(code: Int(gestureRecognizer.view?.tag ?? 8)), for: .normal)
        } else if game.inputPegs[3] == 8 {
            game.inputPegs[3] = gestureRecognizer.view?.tag ?? 8
            inputButtons[3].setImage(getColor(code: Int(gestureRecognizer.view?.tag ?? 8)), for: .normal)
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
        cell.pinButtons[1].setImage(getColor(code: game.record[indexPath.row][2][1]), for: .normal)
        cell.pinButtons[2].setImage(getColor(code: game.record[indexPath.row][2][2]), for: .normal)
        cell.pinButtons[3].setImage(getColor(code: game.record[indexPath.row][2][3]), for: .normal)

        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
    
    @IBAction func check(_ sender: Any) {
        print(game.code)
        
        // append record
        game.record.append([game.addRound(round: 1), game.addImputs(input1: game.inputPegs[0], input2: game.inputPegs[1], input3: game.inputPegs[2], input4: game.inputPegs[3]),game.addPins()])
        
        print(game.record)
        
        // reset all input button
        for inputButton in inputButtons {
            
            inputButton.setImage(getColor(code: 8), for: .normal)
        }
        // reset input pegs
        game.inputPegs = [8,8,8,8]
        
        print(game.round)
        
        tableView.reloadData()
        
//        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)

    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
        case 6:
            return UIImage(named: "Black")!
        case 7:
            return UIImage(named: "White")!
        case 8:
            return UIImage(named: "Question Mark")!
        default:
            return UIImage(named: "Question Mark")!
        }
    }
}



