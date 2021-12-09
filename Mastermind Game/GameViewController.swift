//
//  GameViewController.swift
//  Mastermind Game
//
//  Created by Jacky Wong on 4/12/2021.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var game = Game()
    
    // MARK: - Outlets
    @IBOutlet var codeButtons: [UIButton]!
    @IBOutlet var colorButtons: [UIButton]!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet weak var colorView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        
        // MARK: - Set code
        var code = game.setCode()
        codeButtons[0].setImage(UIImage(named: code[0]), for: .normal)
        codeButtons[1].setImage(UIImage(named: code[1]), for: .normal)
        codeButtons[2].setImage(UIImage(named: code[2]), for: .normal)
        codeButtons[3].setImage(UIImage(named: code[3]), for: .normal)
        // MARK: - Set color
        var color = game.getColor()
        print(color)
        colorButtons[0].setImage(UIImage(named: color[0]), for: .normal)
        colorButtons[1].setImage(UIImage(named: color[1]), for: .normal)
        colorButtons[2].setImage(UIImage(named: color[2]), for: .normal)
        colorButtons[3].setImage(UIImage(named: color[3]), for: .normal)
        colorButtons[4].setImage(UIImage(named: color[4]), for: .normal)
        colorButtons[5].setImage(UIImage(named: color[5]), for: .normal)
        
        
    
        let tapRedGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        tapRedGestureRecognizer.numberOfTapsRequired = 1
        let tapBlueGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        tapBlueGestureRecognizer.numberOfTapsRequired = 1
        let tapYellowGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        tapYellowGestureRecognizer.numberOfTapsRequired = 1
        let tapGreenGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        tapGreenGestureRecognizer.numberOfTapsRequired = 1
        let tapPurpleGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        tapPurpleGestureRecognizer.numberOfTapsRequired = 1
        let tapBrownGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        tapBrownGestureRecognizer.numberOfTapsRequired = 1
        
//        colorButtons[0].isEnabled = false
//        colorButtons[0].isUserInteractionEnabled = true
        colorButtons[0].addGestureRecognizer(tapRedGestureRecognizer)
        colorButtons[1].addGestureRecognizer(tapBlueGestureRecognizer)
        colorButtons[2].addGestureRecognizer(tapYellowGestureRecognizer)
        colorButtons[3].addGestureRecognizer(tapGreenGestureRecognizer)
        colorButtons[4].addGestureRecognizer(tapPurpleGestureRecognizer)
        colorButtons[5].addGestureRecognizer(tapBrownGestureRecognizer)
    }
    
    @objc func tapOnImage(gestureRecognizer: UITapGestureRecognizer) {
        print(gestureRecognizer.view?.tag ?? "0")
        print("tap")
        let tapLocation = gestureRecognizer.location(in: colorView)
        print(tapLocation.x)
        print(tapLocation.y)
//        if let selectedIndexPath = roundsTableView.indexPathForRow(at: tapLocation) {
//            print(selectedIndexPath.row)
//            self.game.rounds[selectedIndexPath.row].selectedIndex = gestureRecognizer.view!.tag
//            roundsTableView.reloadRows(at: [selectedIndexPath], with: .none)
//        }
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
    


