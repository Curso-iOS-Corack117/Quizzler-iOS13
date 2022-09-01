//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        update()
    }

    @IBAction func answareAction(_ sender: UIButton) {
        let answareChecked = quizBrain.checkAnsware(answare: sender.currentTitle!)
        if answareChecked {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Task {
            UIView.animate(withDuration: 0.5, delay: 0.2) { [self] in
                trueButton.backgroundColor = UIColor.clear
                falseButton.backgroundColor = UIColor.clear
            }
            try await Task.sleep(nanoseconds: 700_000_000)
            update()
        }
    }
    
    private func update() {
        questionLabel.text = quizBrain.currentQuestion.question
        progressBar.progress = quizBrain.getProgress()
        counterLabel.text = quizBrain.getScore()
        if quizBrain.currentQuestionNumber >= quizBrain.totalQuestions {
            trueButton.isHidden = true
            falseButton.isHidden = true
            questionLabel.text = "Cuestionario completado!"
        }
    }
    
}

