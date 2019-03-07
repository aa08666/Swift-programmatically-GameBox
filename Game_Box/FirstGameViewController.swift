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
        // TODO： call setup func
        view.backgroundColor = .orange
//        firstGameView = UIView()
//        firstGameView.translatesAutoresizingMaskIntoConstraints = false
//        firstGameView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)

    }
    
    // 拉霸數字 UI
    let oneLabel: UILabel = {
       let label = UILabel()
        label.text = "?"
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    let twoLabel: UILabel = {
       let label = UILabel()
        label.text = "?"
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let threeLabel: UILabel = {
        let label = UILabel()
        label.text = "?"
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    // TODO：拉霸按鈕 UI
    let labaButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .black
        button.backgroundColor = .white
        button.setTitle("ReadyGO", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // TODO：FUNC(setup) 設定約束條件
    // TODO: 拉霸邏輯判斷
    func showLabaAnswer() {
        let answer = GKRandomSource.sharedRandom().nextInt(upperBound: 10) + 1
        oneLabel.text = String(answer)
        twoLabel.text = String(answer)
        threeLabel.text = String(answer)
    }
    
    
    
    
    
    
    
    
    
    
    
}
