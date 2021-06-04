//
//  MilloonaireBrain.swift
//  Millionaire
//
//  Created by Aleksandr Khalupa on 18.12.2020.
//

import Foundation

struct MilloonaireBrain {
    let questionsAndAnswers = [
        QuestionAndAnswers(question: "Какая игра хорошо знакома детсадовскому ребёнку?", answers: ["A: Море волнуется раз", "B: Океан бушует два", "С: Речка бурлит три", "D: Озеро штормит четыре"], correctAnsver: "A: Море волнуется раз"),
        QuestionAndAnswers(question: "Как называется разновидность дудочки?", answers: ["A: жилетка", "B: утешайка", "С: жалейка", "D: обнимайка"], correctAnsver: "С: жалейка"),
        QuestionAndAnswers(question: "Что подтверждает соответствие продукции установленным требованиям и нормам?", answers: ["A: сертификат", "B: товарная накладная", "С: штрихкод", "D: товарный чек"], correctAnsver: "A: сертификат"),
        QuestionAndAnswers(question: "У кого нормальная температура тела - 42 градуса?", answers: ["A: у слона", "B: у верблюда", "С: у кита", "D: у утки"], correctAnsver: "D: у утки"),
        QuestionAndAnswers(question: "2Что подтверждает соответствие продукции установленным требованиям и нормам?", answers: ["A: сертификат", "B: товарная накладная", "С: штрихкод", "D: товарный чек"], correctAnsver: "A: сертификат"),
        QuestionAndAnswers(question: "2У кого нормальная температура тела - 42 градуса?", answers: ["A: у слона", "B: у верблюда", "С: у кита", "D: у утки"], correctAnsver: "D: у утки")]
    
    
    var numverOfQuestion = 0
    var score = 0
    func chackAnsver(tagOfbutton: Int) -> Bool {
        let answers = questionsAndAnswers[numverOfQuestion]
        
        if tagOfbutton == 0 && answers.answers[0] == answers.correctAnsver {
            return true
        } else  if tagOfbutton == 1 && answers.answers[1] == answers.correctAnsver {
            return true
        } else  if tagOfbutton == 2 && answers.answers[2] == answers.correctAnsver {
            return true
        } else if tagOfbutton == 3 && answers.answers[3] == answers.correctAnsver {
            return true
        }
        return false
    }
    
    
    mutating func nextQuestion() {
        if numverOfQuestion < questionsAndAnswers.count - 1 {
            numverOfQuestion += 1
        } else {
            numverOfQuestion = 0
        }
    }
    
    
    func getQuestion() -> String {
        return questionsAndAnswers[numverOfQuestion].question
    }
    
    func getAnsverA() -> String {
        return questionsAndAnswers[numverOfQuestion].answers[0]
    }
    
    func getAnsverB() -> String {
        return questionsAndAnswers[numverOfQuestion].answers[1]
    }
    
    func getAnsverC() -> String {
        return questionsAndAnswers[numverOfQuestion].answers[2]
    }
    
    func getAnsverD() -> String {
        return questionsAndAnswers[numverOfQuestion].answers[3]
    }
    
    func getProgressStatus() -> Float {
        return Float(numverOfQuestion + 1) / Float(questionsAndAnswers.count)
    }
    
    
    mutating func countingScore(isTrue: Bool) -> String {
        
        if isTrue {
            score += 1
            return "Score: \(score)/\(questionsAndAnswers.count)"
        }
        return "Score: \(score)/\(questionsAndAnswers.count)"
    }
    
    mutating func starScore() -> String {
        if numverOfQuestion == 0 {
            score = 0
            return "Score: \(score)/\(questionsAndAnswers.count)"
        }
        return "Score: \(score)/\(questionsAndAnswers.count)"
    }
}
