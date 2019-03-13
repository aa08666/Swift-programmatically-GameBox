//
//  SecondGameViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/7.
//  Copyright © 2019 柏呈. All rights reserved.
//
// NOTE： 之後可以參考的做法，用extension 讓生成 button 時可以少寫很多 code
//extension UIButton {
//    static func makeGameButton(input:String)-> UIButton {
//        let button11 = UIButton()
//        button11.tintColor = .black
//        button11.setTitle("誰是周董？", for: .normal)
//        button11.setTitleColor(.black, for: .normal)
//        return button11
//    }
//     let newButton: UIButton = .makeGameButton(input: <#T##String#>)
//}

import UIKit


class SecondGameViewController: UIViewController {
    var secondGameView: UIView!
    
    var games: [SecondGameModel] = [SecondGameModel.init(question: "誰是周董", answer: "R3", options: ["R1", "R2", "R3", "R4"]),
                                    SecondGameModel.init(question: "誰是胡瓜", answer: "L2", options: ["L1","L2","L3","L4"]),
                                    SecondGameModel.init(question: "誰是董至成", answer: "A4", options: ["A1","A2","A3","A4"])
    ]
    
    
    var currentAnswer = String()
    var currentQuestionNumber = Int()
    let questionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let aButton: UIButton = {
        let btn = UIButton()
        
//        btn.tag = 2
        return btn
    }()
    
    let bButton: UIButton = {
        let btn = UIButton()

        return btn
    }()
    
    let cButton: UIButton = {
        let btn = UIButton()

        return btn
    }()
    let dButton: UIButton = {
        let btn = UIButton()

        return btn
    }()
    
    let whoLable: UILabel = {
        let wlabel = UILabel()
        wlabel.text = "誰跟其他人不一樣？"
        
        return wlabel
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondGameView = UIView()
        self.view.addSubview(secondGameView)
        secondGameView.translatesAutoresizingMaskIntoConstraints = false
        secondGameView.backgroundColor = .white
        secondGameView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        setupQuestionButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateQuestionButton(game: games[0])
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    //     TODO: 1.先讓資料 Shuffled 2.再用for in 產生題目圖片 3.把image刪掉，用 button 代替圖片即可
    //有個 array 所以可以判斷 indexPath 的值
    
    func setupQuestionButton() {
        
        
        secondGameView.addSubview(aButton)
        secondGameView.addSubview(bButton)
        secondGameView.addSubview(cButton)
        secondGameView.addSubview(dButton)
        secondGameView.addSubview(whoLable)
        aButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.translatesAutoresizingMaskIntoConstraints = false
        cButton.translatesAutoresizingMaskIntoConstraints = false
        dButton.translatesAutoresizingMaskIntoConstraints = false
        whoLable.translatesAutoresizingMaskIntoConstraints = false
        aButton.setAnchor(top: secondGameView.topAnchor, left: secondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        bButton.setAnchor(top: aButton.bottomAnchor, left: secondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        cButton.setAnchor(top: bButton.bottomAnchor, left: secondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        dButton.setAnchor(top: cButton.bottomAnchor, left: secondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        whoLable.setAnchor(top: secondGameView.topAnchor, left: aButton.rightAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 175, height: 100)
        aButton.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
        bButton.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
        cButton.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
        dButton.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
        
    }
    
    @objc func clickButton(sender: UIButton){
        guard let image = sender.currentImage else { return }
        judgeAnswer(image: image)
    }
    
    func updateQuestionButton(game: SecondGameModel){
        self.currentAnswer = game.answer
        let buttons: [UIButton] = [aButton, bButton, cButton, dButton]
        let shuflledOptions = game.options.shuffled()
        print(shuflledOptions)
        var numberOfArray = 0
        for button in buttons {
            button.setTitleColor(.clear, for: .normal)
            button.setTitle(shuflledOptions[numberOfArray], for: .normal)
            button.setImage(UIImage(named: shuflledOptions[numberOfArray]), for: .normal)
            numberOfArray += 1
        }
    }
    
    func judgeAnswer(image input: UIImage){
        guard input == UIImage(named: self.currentAnswer) else {
            alertButton()
            return
        }
        self.currentQuestionNumber += 1
        success()
    }
    
    func success(){
        if currentQuestionNumber < 3 {
            updateQuestionButton(game: games[currentQuestionNumber])
        } else {
            currentQuestionNumber = 0
            
            showAlert(title: "全都答對了，你很行")
        }
    }
    
    func showAlert(title: String){
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let aa = UIAlertAction(title: "ok", style: .default) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        
        ac.addAction(aa)
        self.present(ac, animated: true, completion: nil)
    }
    
    
    @objc func alertButton() {
        let alertController = UIAlertController(title: "猜錯了喔!", message: "眼殘膩", preferredStyle: .alert)
        let tryAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(tryAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
