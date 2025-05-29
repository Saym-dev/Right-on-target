//
//  ViewController.swift
//  Right on target
//
//  Created by Sayat on 26.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    private func getSecondViewController() -> SecondViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(identifier:
    "SecondViewController")
    return viewController as! SecondViewController
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("viewDidDisappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print("viewDidLoad")
        number = Int.random(in: 1...50)
        label.text = String(number)
    
    }
    
    // загаданное число
    var number: Int = 0
    var round: Int = 1
    //  сумма очков за раунд
    var points: Int = 0
    
    @IBAction func checkNumber() {
        
            let numSlider = Int(self.slider.value)
        if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if self.round == 5 {
                let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(self.points) очков",
                preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style:
                .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
                }
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
    }

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
}
