//
//  SecondGameViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/7.
//  Copyright © 2019 柏呈. All rights reserved.
//

import UIKit

class SecondGameViewController: UIViewController {
    var secondGameView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        secondGameView = UIView()
        self.view.addSubview(secondGameView)
        secondGameView.translatesAutoresizingMaskIntoConstraints = false
        secondGameView.backgroundColor = .white
        secondGameView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        GameTwoSetupAutoLayout()
    
    }
    
    let imageViewOne: UIImageView = {
        let imvOne = UIImageView()
        imvOne.contentMode = .scaleAspectFill
        return imvOne
    }()

    let imageViewTwo: UIImageView = {
       let imvTwo = UIImageView()
        imvTwo.contentMode = .scaleAspectFill
        return imvTwo
    }()
    
    let imagViewThree: UIImageView = {
       let imvThree = UIImageView()
        imvThree.contentMode = .scaleAspectFill
        return imvThree
    }()
    
    let imageViewFour: UIImageView = {
        let imvFour = UIImageView()
        imvFour.contentMode = .scaleAspectFill
        return imvFour
    }()
    
    let buttonOne: UIButton = {
       let btnOne = UIButton()
        btnOne.tintColor = .black
        btnOne.setTitle("誰是周董？", for: .normal)
        btnOne.setTitleColor(.black, for: .normal)
        return btnOne
    }()
    
    let buttonTwo: UIButton = {
        let btnTwo = UIButton()
        btnTwo.tintColor = .black
        btnTwo.setTitle("誰是周董？", for: .normal)
        btnTwo.setTitleColor(.black, for: .normal)
        return btnTwo
    }()
    
    let buttonThree: UIButton = {
        let btnThree = UIButton()
        btnThree.tintColor = .black
        btnThree.setTitle("誰是周董？", for: .normal)
        btnThree.setTitleColor(.black, for: .normal)
        btnThree.addTarget(self, action: #selector(pushPage), for: .touchUpInside)
        return btnThree
    }()
    
    let buttonFour: UIButton = {
        let btnFour = UIButton()
        btnFour.tintColor = .black
        btnFour.setTitle("誰是周董？", for: .normal)
        btnFour.setTitleColor(.black, for: .normal)
        return btnFour
    }()
    
    @objc func pushPage() {
        let vc = TwoSecondGameViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func GameTwoSetupAutoLayout() {
        secondGameView.addSubview(imageViewOne)
        secondGameView.addSubview(imageViewTwo)
        secondGameView.addSubview(imagViewThree)
        secondGameView.addSubview(imageViewFour)
        secondGameView.addSubview(buttonOne)
        secondGameView.addSubview(buttonTwo)
        secondGameView.addSubview(buttonThree)
        secondGameView.addSubview(buttonFour)
        
        imageViewOne.setAnchor(top: secondGameView.topAnchor, left: secondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 75 )
        imageViewOne.translatesAutoresizingMaskIntoConstraints = false
//        imageViewOne.centerYAnchor.constraint(equalTo: secondGameView.centerYAnchor).isActive = true
        
//
        imageViewTwo.setAnchor(top: imageViewOne.bottomAnchor, left: secondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
//       imageViewTwo.centerYAnchor.constraint(equalTo: imageViewOne.centerYAnchor).isActive = true
//
        imagViewThree.setAnchor(top: imageViewTwo.bottomAnchor, left: secondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 80, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 80)
        imagViewThree.translatesAutoresizingMaskIntoConstraints = false
//        imagViewThree.centerYAnchor.constraint(equalTo: imageViewTwo.centerYAnchor).isActive = true
//
        imageViewFour.setAnchor(top: imagViewThree.bottomAnchor, left: secondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 80, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 80)
        imageViewFour.translatesAutoresizingMaskIntoConstraints = false
//        imageViewFour.centerYAnchor.constraint(equalTo: imagViewThree.centerYAnchor).isActive = true
//
                buttonOne.setAnchor(top: secondGameView.topAnchor, left: imageViewOne.rightAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
                buttonOne.translatesAutoresizingMaskIntoConstraints = false
        
                buttonTwo.setAnchor(top: buttonOne.bottomAnchor, left: imageViewTwo.rightAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
                buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        
                buttonThree.setAnchor(top: buttonTwo.bottomAnchor, left: imagViewThree.rightAnchor  , bottom: nil, right: nil, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
                buttonThree.translatesAutoresizingMaskIntoConstraints = false
        
                buttonFour.setAnchor(top: buttonThree.bottomAnchor, left: imageViewFour.rightAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
                buttonFour.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        imageViewOne.image = UIImage(named: "R1")
        imageViewTwo.image = UIImage(named: "R2")
        imagViewThree.image = UIImage(named: "R3")
        imageViewFour.image = UIImage(named: "R4")
        
        
        
    }
    

}
