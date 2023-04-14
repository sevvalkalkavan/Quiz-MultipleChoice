//
//  Question.swift
//  Quiz-MultipleChoice
//
//  Created by Şevval Kalkavan on 13.04.2023.
//

import Foundation

struct Question{
    let text : String
    let answer : [String]
    let rightAnswer : String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.rightAnswer = correctAnswer
    }
    
    
}
