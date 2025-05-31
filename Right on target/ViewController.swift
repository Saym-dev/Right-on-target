//
//  ViewController.swift
//  Right on target
//
//  Created by Sayat on 26.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    //MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = Generator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 5)
        
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    // MARK: - Взаимодействие View - Model
    
    @IBAction func checkNumber() {
        game.currentRound.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    //MARK: - Обновление View
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Ига окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
