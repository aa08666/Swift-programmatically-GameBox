//
//  ThirdGameViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/8.
//  Copyright © 2019 柏呈. All rights reserved.
//

import UIKit
import GameKit

class ThirdGameViewController: UIViewController {
    
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    var thirdGameView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       thirdGameView = UIView()
        self.view.addSubview(thirdGameView)
        thirdGameView.translatesAutoresizingMaskIntoConstraints = false
        thirdGameView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        setThreeGameAutoLayout()
        
    }
    
    let backgroundImageView: UIImageView = {
        let bgiv = UIImageView()
        bgiv.contentMode = .scaleAspectFill
        bgiv.image = UIImage(named: "BG")
        
        return bgiv
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let inputTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .center
        return textField
    }()
    
    let gameButton: UIButton = {
       let button = UIButton()
        button.tintColor = .yellow
        button.setTitle("GO", for: .normal)
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return button
    }()
    
    @objc func startGame() {
        if isOver == false{
            //playing game
            print(answer)
            
            //take input text out
            let inputText = inputTextField.text!
            
            //clear textfield
            inputTextField.text = ""
            
            let inputNumber = Int(inputText)
            if inputNumber == nil{
                //wrong input
                titleLabel.text = "No input! Guess a number between \(minNumber) ~ \(maxNumber)"
            }else{
                //input ok
                if inputNumber! > maxNumber{
                    //user input too large
                    titleLabel.text = "Too large! Guess a number between \(minNumber) ~ \(maxNumber)"
                }else if inputNumber! < minNumber{
                    //user input too small
                    titleLabel.text = "Too small! Guess a number between \(minNumber) ~ \(maxNumber)"
                }else if inputNumber! == answer{
                    // Bingo! right answer
                    titleLabel.text = "You are right, Press [Guess] to play again!"
                    isOver = true
                    backgroundImageView.image = UIImage(named: "Finish")
                }else{
                    //wrong answer
                    if inputNumber! > answer{
                        //larger than answer
                        maxNumber = inputNumber!
                    }else{
                        //smaller than answer
                        minNumber = inputNumber!
                    }
                    titleLabel.text = "Try again! Guess a number between \(minNumber) ~ \(maxNumber)"
                }
            }
        }else{
            //game is over
            maxNumber = 100
            minNumber = 1
            titleLabel.text = "Guess a number between \(minNumber) ~ \(maxNumber)"
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            isOver = false
            backgroundImageView.image = UIImage(named: "BG")
        }
    
    }
    
    
    
    
    
    func setThreeGameAutoLayout() {
        thirdGameView.addSubview(backgroundImageView)
        thirdGameView.addSubview(titleLabel)
        thirdGameView.addSubview(inputTextField)
        thirdGameView.addSubview(gameButton)
        
        
        backgroundImageView.setAnchor(top: thirdGameView.topAnchor, left: thirdGameView.leftAnchor, bottom: thirdGameView.bottomAnchor, right: thirdGameView.rightAnchor, paddingTop: 80, paddingLeft: 0, paddingBottom: 10, paddingRight: 0)
        
   
        titleLabel.setAnchor(top: backgroundImageView.topAnchor, left: backgroundImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 80, height: 35)
        titleLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        
        inputTextField.setAnchor(top: titleLabel.bottomAnchor, left: backgroundImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 180, paddingLeft: 155, paddingBottom: 0, paddingRight: 0, width: 102, height: 39)
        
        gameButton.setAnchor(top: inputTextField.bottomAnchor, left: backgroundImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 157, paddingBottom: 0, paddingRight: 0, width: 100, height: 35)
        
    }
    

}
