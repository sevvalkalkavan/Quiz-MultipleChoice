//
//  ViewController.swift
//  Quiz-MultipleChoice
//
//  Created by Şevval Kalkavan on 13.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    

    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }
    
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
                
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        choice1.backgroundColor = UIColor(red: 233/255, green: 142/255, blue: 173/255, alpha: 1.0)
        choice2.backgroundColor = UIColor(red: 233/255, green: 142/255, blue: 173/255, alpha: 1.0)
        choice3.backgroundColor = UIColor(red: 233/255, green: 142/255, blue: 173/255, alpha: 1.0)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score:\(quizBrain.getScore())"

        
        
    }
    

}

