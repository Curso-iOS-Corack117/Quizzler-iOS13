//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sergio Ordaz Romero on 31/08/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answare: String
    
    init(q question: String, a answare: String) {
        self.question = question
        self.answare = answare
    }
}
