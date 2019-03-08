//
//  FirstGameViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/6.
//  Copyright © 2019 柏呈. All rights reserved.
//

import UIKit
import GameKit

class FirstGameViewController: UIViewController {

    var firstGameView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstGameView = UIView()
        self.view.addSubview(firstGameView)
        firstGameView.translatesAutoresizingMaskIntoConstraints = false
        firstGameView.backgroundColor = .yellow
        firstGameView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        setupAutoLayout()
    }
    
    // 拉霸數字 UI
    let oneLabel: UILabel = {
       let label = UILabel()
        label.text = "?"
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()

    let twoLabel: UILabel = {
       let label = UILabel()
        label.text = "?"
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    let threeLabel: UILabel = {
        let label = UILabel()
        label.text = "?"
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 60)
        return label
    }()
    
    // TODO：拉霸按鈕 UI
    let labaButton: UIButton = {
       let button = UIButton(type: UIButton.ButtonType.infoDark)
        button.tintColor = .black
        button.backgroundColor = .white
        button.setTitle("GO", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    
    // TODO: 拉霸邏輯判斷
    @objc func showLabaAnswer() {
        let answer = GKRandomSource.sharedRandom().nextInt(upperBound: 9) + 1
        let answer2 = GKRandomSource.sharedRandom().nextInt(upperBound: 9) + 1
        let answer3 = GKRandomSource.sharedRandom().nextInt(upperBound: 9) + 1
        oneLabel.text = String(answer)
        twoLabel.text = String(answer2)
        threeLabel.text = String(answer3)
    }
    
    // TODO：FUNC(setup) 設定約束條件
    func setupAutoLayout() {
        firstGameView.addSubview(oneLabel)
        firstGameView.addSubview(twoLabel)
        firstGameView.addSubview(threeLabel)
        firstGameView.addSubview(labaButton)
        
        oneLabel.setAnchor(top: firstGameView.topAnchor, left: firstGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 30, paddingRight: 4, width: 60, height: 60)
        oneLabel.translatesAutoresizingMaskIntoConstraints = false
        oneLabel.centerYAnchor.constraint(equalTo: firstGameView.centerYAnchor).isActive = true
        
        twoLabel.setAnchor(top: nil, left: oneLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 30, paddingRight: 4, width: 60, height: 60)
        twoLabel.centerYAnchor.constraint(equalTo: oneLabel.centerYAnchor).isActive = true
        twoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        threeLabel.setAnchor(top: nil, left: twoLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 30, paddingRight: 4, width: 60 , height: 60)
        threeLabel.centerYAnchor.constraint(equalTo: twoLabel.centerYAnchor).isActive = true
        threeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        labaButton.setAnchor(top: nil, left: threeLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 30, paddingRight: 4, width: 50, height: 50)
        labaButton.translatesAutoresizingMaskIntoConstraints = false
        labaButton.centerYAnchor.constraint(equalTo: threeLabel.centerYAnchor).isActive = true
        labaButton.addTarget(self, action: #selector(showLabaAnswer), for: .touchUpInside)
        
    }
    
    
    
}
