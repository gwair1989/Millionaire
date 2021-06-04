//
//  ViewController.swift
//  Millionaire
//
//  Created by Aleksandr Khalupa on 03.12.2020.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressViev: UIProgressView!
    
    @IBOutlet weak var questionButton: UIButton!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBOutlet var answerImages: [UIImageView]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var isPresed = false
    var timer = Timer()
    var milloonaireBrain = MilloonaireBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLebelsAndUI()
    }
    
    
    @IBAction func pressedButtons(_ sender: UIButton) {
        if sender.tag == 1 {
            if isPresed {
                milloonaireBrain.nextQuestion()
                setLebelsAndUI()
                isPresed = false
            } else {
                questionButton.setTitle("Вы не нажали на ответ", for: .normal)
            }
            showButtons()
        } else {
            questionButton.isEnabled = false
            isPresed = true
            changeImage(tag: sender.tag - 2)
            hidenButtons()
        }
    }
    
    func changeImage(tag: Int){
        
        if tag == 0 || tag == 2 {
            blink(img: answerImages[tag], letter: "L")
        } else {
            blink(img: answerImages[tag], letter: "R")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3 * 6) {
            self.timer.invalidate()
            self.questionButton.isEnabled = true
            
            let isUserAnsver = self.milloonaireBrain.chackAnsver(tagOfbutton: tag)
            self.scoreLabel.text = self.milloonaireBrain.countingScore(isTrue: isUserAnsver)
            
            switch tag {
            case 0:
                if isUserAnsver {
                    self.answerImages[0].image = UIImage(named: "correctL")
                } else {
                    self.answerImages[0].image = UIImage(named: "waitingL")
                }
            case 1:
                if isUserAnsver {
                    self.answerImages[1].image = UIImage(named: "correctR")
                } else {
                    self.answerImages[1].image = UIImage(named: "waitingR")
                }
            case 2:
                if isUserAnsver {
                    self.answerImages[2].image = UIImage(named: "correctL")
                } else {
                    self.answerImages[2].image = UIImage(named: "waitingL")
                }
            case 3:
                if isUserAnsver {
                    self.answerImages[3].image = UIImage(named: "correctR")
                } else {
                    self.answerImages[3].image = UIImage(named: "waitingR")
                }
            default:
                print("error")
            }
        }
    }
    
    
    func setLebelsAndUI()  {
        let getQuestion = milloonaireBrain.getQuestion()
        let getAnsverA = milloonaireBrain.getAnsverA()
        let getAnsverB = milloonaireBrain.getAnsverB()
        let getAnsverC = milloonaireBrain.getAnsverC()
        let getAnsverD = milloonaireBrain.getAnsverD()
        
        questionButton.setTitle("\(getQuestion)", for: .normal)
        
        answerButtons[0].setTitle("\(getAnsverA)", for: .normal)
        answerButtons[1].setTitle("\(getAnsverB)", for: .normal)
        answerButtons[2].setTitle("\(getAnsverC)", for: .normal)
        answerButtons[3].setTitle("\(getAnsverD)", for: .normal)
        
        answerImages[0].image = UIImage(named: "answerL")
        answerImages[1].image = UIImage(named: "answerR")
        answerImages[2].image = UIImage(named: "answerL")
        answerImages[3].image = UIImage(named: "answerR")
        
        progressViev.progress = milloonaireBrain.getProgressStatus()
        
        scoreLabel.text = milloonaireBrain.starScore()
        
        questionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        questionButton.titleLabel?.numberOfLines = 2
        questionButton.setTitleColor(UIColor.white, for: .normal)
        
        answerButtons[0].titleLabel?.adjustsFontSizeToFitWidth = true
        answerButtons[1].titleLabel?.adjustsFontSizeToFitWidth = true
        answerButtons[2].titleLabel?.adjustsFontSizeToFitWidth = true
        answerButtons[3].titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    
    func blink(img: UIImageView, letter: String){
        
        var count = 1
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { (timerInBlock) in
            count += 1
            if count % 2 == 0 {
                img.image = UIImage(named: "waiting" + letter)
            } else {
                img.image = UIImage(named: "answer" + letter)
            }
        }
    }
    
    
    func hidenButtons(){
        answerButtons[0].isEnabled = false
        answerButtons[1].isEnabled = false
        answerButtons[2].isEnabled = false
        answerButtons[3].isEnabled = false
    }
    
    func showButtons(){
        answerButtons[0].isEnabled = true
        answerButtons[1].isEnabled = true
        answerButtons[2].isEnabled = true
        answerButtons[3].isEnabled = true
    }
}

