//
//  ViewController.swift
//  Right on target
//
//  Created by Дмитрий Скок on 21.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = Generator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
//    Проверка выбраного пользователем числа
    @IBAction func checkNumber(_ sender: Any) {
        game.currentRound.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
//    Обновление текста загадного числа
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
//    Отображение всплывающего окна со счетом
    private func showAlertWith (score: Int) {
        let alert = UIAlertController(title: "Игра огончена",
                                      message: "Вы заработали \(score) очков",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
