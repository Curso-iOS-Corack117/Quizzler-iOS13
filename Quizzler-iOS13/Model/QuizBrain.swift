//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Sergio Ordaz Romero on 31/08/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    var currentQuestion: Question!
    let questions: [Question] = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var totalQuestions: Int!
    var currentQuestionNumber: Int = 0
    var score: Int = 0
    
    init() {
        totalQuestions = questions.count - 1
        currentQuestion = questions[currentQuestionNumber]
    }
    
    mutating func checkAnsware(answare: String) -> Bool {
        if answare == currentQuestion.answare {
            score += 1
            return true
        }
        return false
    }
    
    mutating func nextQuestion() {
        currentQuestionNumber += 1
        currentQuestion = questions[currentQuestionNumber]
    }
    
    func getProgress() -> Float{
        Float(currentQuestionNumber) / Float(totalQuestions)
    }
    
    func getScore() -> String {
        return "Puntaje: \(score) de \(questions.count)"
    }
}
