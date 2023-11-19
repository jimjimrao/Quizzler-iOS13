//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    let quiz: [Question] = [
        Question(text: "Is the sky blue?", answer: "True"),
        Question(text: "Do dogs meow?", answer: "False"),
        Question(text: "Is the Earth flat?", answer: "False")
    ]

    
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // True, False
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            print("right")
        }else{
            print("wrong")
        }
        print(questionNumber, quiz.count)
        if questionNumber < quiz.count - 1{
            questionNumber += 1
        }else{
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber].text
    }
}

