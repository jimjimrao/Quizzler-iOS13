//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    var quizBrain = QuizBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getQuizProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        let answers = quizBrain.getAnswers()
        
        answer1.setTitle(answers[0], for: .normal)
        answer2.setTitle(answers[1], for: .normal)
        answer3.setTitle(answers[2], for: .normal)
        
        answer1.backgroundColor = UIColor.clear
        answer2.backgroundColor = UIColor.clear
        answer3.backgroundColor = UIColor.clear
        
    }
}

