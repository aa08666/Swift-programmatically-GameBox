//
//  SecondGameModel.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/11.
//  Copyright © 2019 柏呈. All rights reserved.
//

import Foundation
import UIKit

//TODO: 建立三個遊戲的 model(struct)，讓遊戲猜對後替換一組資料(用 Array 把資料變成有序的，才能用 indexPath 取值)

struct SecondGameModel {
    let question: String
    let answer: String
    let options: [String]
}

struct SecondGameOneModel {
    
        static let buttonTitle = "誰是周董"
        static let imageOne = UIImage(named: "R1")!
        static let imageTwo = UIImage(named: "R2")!
        static let imageThree = UIImage(named: "R3")!
        static let imageFour = UIImage(named: "R4")!
   
}

struct SecondGameTwoModel {
    
   static let buttonTitle = "誰是胡瓜"
   static let imageOne = UIImage(named: "L1")
   static let imageTwo = UIImage(named: "L2")
   static let imageThree = UIImage(named: "L3")
   static let imageFour = UIImage(named: "L4")
   
}

struct SecondGameThreeModel {
    
    static let buttonTitle = "誰是董至成"
    static let imageOne = UIImage(named: "A1")
    static let imageTwo = UIImage(named: "A2")
    static let imageThree = UIImage(named: "A3")
    static let imageFour = UIImage(named: "A4")
}
