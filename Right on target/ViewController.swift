//
//  ViewController.swift
//  Right on target
//
//  Created by Дмитрий Скок on 21.04.2022.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("viewDidLoad")
        number = Int.random(in: 1...50)
        label.text = String(number)
    }
    
    @IBAction func checkNumber(_ sender: Any) {
        let numSlider = Int(slider.value)
        print(numSlider)
        if numSlider > number {
            points += 50 - numSlider + number
        } else if numSlider < number {
            points += 50 - numSlider + number
        } else {
            points += 50
        }
        print("Очки \(points)")
        
        if round == 5{
            let alert = UIAlertController(title: "Игра окончена!",
                                          message: "Вы заработали \(points) очков",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново",
                                          style: .default,
                                          handler: nil))
            present(alert, animated: true, completion: nil)
            round = 1
            points = 0
        } else {
            round += 1
        }
        number = Int.random(in: 1...50)
        label.text = String(number)
    }
}
