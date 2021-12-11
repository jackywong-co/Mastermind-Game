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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGame()
    }
    
    func setGame(){
        self.game = Game()
        for codeButtons in codeButtons {
            let index = codeButtons.tag
            let code = game.code[index]
            codeButtons.setImage(UIImage(named: "play.png"), forState: .normal)

//            codeButtons.backgroundColor = self.getColor(code: code)
//            codeButtons.layer.cornerRadius = 20
        }
    }
    
    func getColor(code : Int) -> String {
        switch(code){
        case 0:
            return "Brown"
        case 1:
            return .black
        case 2:
            return .blue
        case 3:
            return .yellow
        case 4:
            return .red
        case 5:
            return .green
        default:
            return .lightGray
        }
    }
    
    // MARK: - Table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? GameTableViewCell else {
            fatalError("Can't instantiate GameTableViewCell")
        }
        
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
//    func onDrag(_ data: @escaping () -> NSItemProvider) -> some View
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }
}
    


