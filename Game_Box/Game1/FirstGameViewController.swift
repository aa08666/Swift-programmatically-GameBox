//
//  FirstGameViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/6.
//  Copyright © 2019 柏呈. All rights reserved.
//
//        navigationController?.navigationBar.isHidden = true


import UIKit
import GameKit

struct UserDefaultKeys {
    static let coinKey = "coins"
}






class FirstGameViewController: UIViewController {
    
    

    
    var firstGameView: UIView!
    var timer:  Timer?
    var timer1: Timer?
    var timer2: Timer?
    var isStart = true
    let userDefault = UserDefaults.standard
    let coinKey = UserDefaultKeys.coinKey
    
    func coin() {
        UserDefaults.standard.set(1000, forKey: self.coinKey)
    }
    
    func useCoin() {
        var useCoin = self.userDefault.integer(forKey: self.coinKey)
        useCoin -= 100
        self.userDefault.set(useCoin, forKey: self.coinKey)
        showCoins()
    }
    
    func plusCoin() {
        var useCoin = self.userDefault.integer(forKey: self.coinKey)
        useCoin += 1000
        self.userDefault.set(useCoin, forKey: self.coinKey)
        showCoins()
    }
    
    func showCoins(){
        var coins = self.userDefault.integer(forKey: self.coinKey)
        coinLabel.text = "代幣餘額： \(coins)"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstGameView = UIView()
        self.view.addSubview(firstGameView)
        firstGameView.translatesAutoresizingMaskIntoConstraints = false
        firstGameView.backgroundColor = .white
        firstGameView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        setupAutoLayout()
        
        showCoins()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coin()
        
    }
    @objc func updateLabel(){
        
        oneLabel.text = "\(Int.random(in: 1...3))"
    }
    @objc func upadeLabelTwo() {
        twoLabel.text = "\(Int.random(in: 1...3))"
    }
    @objc func updateLabelThree(){
        threeLabel.text = "\(Int.random(in: 1...3))"
    }
    
    let coinLabel: UILabel = {
        let label = UILabel()
        let conin = UserDefaults.standard.integer(forKey: "coins")
        label.text = "代幣餘額： \(conin)"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let oneLabel: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    let twoLabel: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    let threeLabel: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    
    let labaButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.tintColor = .black
        button.backgroundColor = .white
        button.setTitle("GO", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    let labaOverButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.tintColor = .black
        button.backgroundColor = .white
        button.setTitle("STOP", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    func stopAlert(title:String, message:String) {
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let myAlertAction = UIAlertAction(title: "恭喜", style: .default) { (_) in
            self.plusCoin()
        }
        myAlert.addAction(myAlertAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @objc func showLabaAnswer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1,  target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        timer1 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(upadeLabelTwo), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateLabelThree), userInfo: nil, repeats: true)
        
        useCoin()
    }
    
    @objc func stopLaba() {
        timer?.invalidate()
        timer1?.invalidate()
        timer2?.invalidate()
        if oneLabel.text == twoLabel.text && twoLabel.text == threeLabel.text {
            stopAlert(title: "中獎啦", message: "恭喜獲得一千塊")
            
        }
        
    }
    
    
    func setupAutoLayout() {
        firstGameView.addSubview(oneLabel)
        firstGameView.addSubview(twoLabel)
        firstGameView.addSubview(threeLabel)
        firstGameView.addSubview(labaButton)
        firstGameView.addSubview(labaOverButton)
        firstGameView.addSubview(coinLabel)
        
        
        
        
        coinLabel.setAnchor(top: firstGameView.topAnchor, left: firstGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 150, height: 80)
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        oneLabel.setAnchor(top: firstGameView.topAnchor, left: firstGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 30, paddingRight: 4, width: 60, height: 60)
        oneLabel.translatesAutoresizingMaskIntoConstraints = false
        oneLabel.centerYAnchor.constraint(equalTo: firstGameView.centerYAnchor).isActive = true
        
        twoLabel.setAnchor(top: nil, left: oneLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 30, paddingRight: 4, width: 60, height: 60)
        twoLabel.centerYAnchor.constraint(equalTo: oneLabel.centerYAnchor).isActive = true
        twoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        threeLabel.setAnchor(top: nil, left: twoLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 30, paddingRight: 4, width: 60 , height: 60)
        threeLabel.centerYAnchor.constraint(equalTo: twoLabel.centerYAnchor).isActive = true
        threeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        labaButton.setAnchor(top: nil, left: threeLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 30, paddingRight: 4, width: 80, height: 80)
        labaButton.translatesAutoresizingMaskIntoConstraints = false
        labaButton.centerYAnchor.constraint(equalTo: threeLabel.centerYAnchor).isActive = true
        labaOverButton.setAnchor(top: labaButton.bottomAnchor, left: nil, bottom: nil, right: firstGameView.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 20, width: 80, height: 80)
        
        labaButton.addTarget(self, action: #selector(showLabaAnswer), for: .touchUpInside)
        labaOverButton.addTarget(self, action: #selector(stopLaba), for: .touchUpInside)
        
    }
    
    
    
}
