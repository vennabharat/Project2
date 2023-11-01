//
//  ViewController.swift
//  Project2
//
//  Created by bharat venna on 01/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var correctAnswer = 0
    var score = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        gameChoice()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionsAsked += 1
        
        title = "\(countries[correctAnswer].uppercased())    Score: \(score)"

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func newGame(action: UIAlertAction! = nil) {
        score = 0
        questionsAsked = 0
        countries.shuffle()
        correctAnswer = 0
        askQuestion()
    }
    
    func gameChoice(action: UIAlertAction! = nil) {
        if questionsAsked < 10 {
            askQuestion()
        } else {
            newGame()
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String?
        var message: String?
        var alertTitle = questionsAsked < 10 ? "Continue" : "NewGame"
        
        if sender.tag == correctAnswer {
            
            title = questionsAsked < 10 ? "Correct" : "Game Over"
            score += 1
            message = "Your score is \(score)"
            
            
        } else {
            
            title = questionsAsked < 10 ? "Wrong" : "Game Over"
            score -= 1
            message = "Wrong! That’s the flag of \(countries[sender.tag])"
            
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: alertTitle, style: .default, handler: gameChoice))
        present(ac, animated: true)
    }
    
    
}

