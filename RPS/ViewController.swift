//
//  ViewController.swift
//  RPS
//
//  Created by Angielina Rutledge on 4/8/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IB Outlets
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)
    }
// MARK: - IB Actions
    @IBAction func rockChosen(_ sender: Any) {
        player(userSign: .rock)
    }
    
    
    @IBAction func paperChosen(_ sender: Any) {
        player(userSign: .paper)
    }
    
    
    @IBAction func scissorChosen(_ sender: Any) {
        player(userSign: .scissors)
    }
    
    
    @IBAction func playAgainTapped(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    
    
    
    // MARK: - Instance Methods
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        
        switch state {
        case .start:
            view.backgroundColor = .lightGray
            
            signLabel.text = "💻"
            playAgain.isHidden = true
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorButton.isEnabled = true
        case .win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 0.851 , green: 0.424, blue: 0.412, alpha: 1)
        case .draw:
        view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)
        }
    }
    
    // method to handle player taps/choices
    func player(userSign: Sign) {
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(aganist: computerSign)
        updateUI(forState: gameState)
        
        signLabel.text = computerSign.emoji
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorButton.isHidden = true
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        
        // shows the emoji the user chose
        switch userSign {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissors:
            scissorButton.isHidden = false
        }
        
        playAgain.isHidden = false
        
    }

}

