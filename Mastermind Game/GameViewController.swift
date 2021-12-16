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
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGame()
        // set table
        self.tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        self.tableView.rowHeight = 55
        
        messageLabel.text = "Game Start"
        print("Game Start")
        
        

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
        // set color button background color
        for colorButton in colorButtons {
            let index = colorButton.tag
            colorButton.setImage(getColor(code: index), for: .normal)
        }
        game.code = game.generateRandomNumber(0, 5, 4)
        print("code \(game.code)")
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
        // auto scroll to top
        tableView.scrollToRow(at: IndexPath(row: indexPath.row, section: 0), at: .top, animated: true)
        
        return cell
    }
    
    @IBAction func check(_ sender: Any) {
        print(game.code)
        
        // append record
        game.record.append([game.addRound(), game.addImputs(input1: game.inputPegs[0], input2: game.inputPegs[1], input3: game.inputPegs[2], input4: game.inputPegs[3]),game.addPins()])
        
        // set pins
        game.pins = game.addPins()
        print(game.record)
        
        // reset all input button
        for inputButton in inputButtons {
            inputButton.setImage(getColor(code: 8), for: .normal)
        }

        if game.pins == [6,6,6,6] {
            messageLabel.text = "You Win !!!"
            print("end game")
            displayCode()
            displayAlert()
        } else {
            game.inputPegs = [8,8,8,8]
        }
        
        print(game.round)
        
        tableView.reloadData()
        
        
        
    }
    
    func displayAlert() {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    func displayCode(){
        for codeButton in codeButtons {
            let index = codeButton.tag
            let code = game.code[index]
            codeButton.setImage(getColor(code: code), for: .normal)
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



