//
//  ThreeSecondGameViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/10.
//  Copyright © 2019 柏呈. All rights reserved.
//

import UIKit

class ThreeSecondGameViewController: UIViewController {
    
    var ThreeSecondGameView: UIView!
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        ThreeSecondGameView = UIView()
        self.view.addSubview(ThreeSecondGameView)
        ThreeSecondGameView.translatesAutoresizingMaskIntoConstraints = false
        ThreeSecondGameView.backgroundColor = .white
        ThreeSecondGameView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        GameThreeSetupAutoLayout()
        
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
        btnOne.setTitle("誰是董至成？", for: .normal)
        btnOne.setTitleColor(.black, for: .normal)
        btnOne.addTarget(self, action: #selector(alertButton(sender:)), for: .touchUpInside)
        return btnOne
    }()
    
    
    let buttonTwo: UIButton = {
        let btnTwo = UIButton()
        btnTwo.tintColor = .black
        btnTwo.setTitle("誰是董至成？", for: .normal)
        btnTwo.setTitleColor(.black, for: .normal)
        btnTwo.addTarget(self, action: #selector(alertButton(sender:)), for: .touchUpInside)
        return btnTwo
    }()
    
    let buttonThree: UIButton = {
        let btnThree = UIButton()
        btnThree.tintColor = .black
        btnThree.setTitle("誰是董至成？", for: .normal)
        btnThree.setTitleColor(.black, for: .normal)
        btnThree.addTarget(self, action: #selector(alertButton(sender:)), for:.touchUpInside )
        return btnThree
    }()
    
    let buttonFour: UIButton = {
        let btnFour = UIButton()
        btnFour.tintColor = .black
        btnFour.setTitle("誰是董至成？", for: .normal)
        btnFour.setTitleColor(.black, for: .normal)
        btnFour.addTarget(self, action: #selector(backHomePage), for: .touchUpInside)
        return btnFour
    }()
    
    @objc func alertButton(sender: UIButton) {
        let alertController = UIAlertController(title: "又猜錯了", message: "無言薯條", preferredStyle: .alert)
        let tryAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(tryAction)
        self.present(alertController, animated: true, completion:  nil)
        
    }
    
    @objc func backHomePage() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func GameThreeSetupAutoLayout() {
        ThreeSecondGameView.addSubview(imageViewOne)
        ThreeSecondGameView.addSubview(imageViewTwo)
        ThreeSecondGameView.addSubview(imagViewThree)
        ThreeSecondGameView.addSubview(imageViewFour)
        ThreeSecondGameView.addSubview(buttonOne)
        ThreeSecondGameView.addSubview(buttonTwo)
        ThreeSecondGameView.addSubview(buttonThree)
        ThreeSecondGameView.addSubview(buttonFour)
       
        
        imageViewOne.setAnchor(top: ThreeSecondGameView.topAnchor, left: ThreeSecondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 75 )
        imageViewOne.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        imageViewTwo.setAnchor(top: imageViewOne.bottomAnchor, left: ThreeSecondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        imagViewThree.setAnchor(top: imageViewTwo.bottomAnchor, left: ThreeSecondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 80, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 80)
        imagViewThree.translatesAutoresizingMaskIntoConstraints = false
        
        imageViewFour.setAnchor(top: imagViewThree.bottomAnchor, left: ThreeSecondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 80, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 80)
        imageViewFour.translatesAutoresizingMaskIntoConstraints = false
        
        buttonOne.setAnchor(top: ThreeSecondGameView.topAnchor, left: imageViewOne.rightAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 120, height: 100)
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        
        buttonTwo.setAnchor(top: buttonOne.bottomAnchor, left: imageViewTwo.rightAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 120, height: 100)
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        
        buttonThree.setAnchor(top: buttonTwo.bottomAnchor, left: imagViewThree.rightAnchor  , bottom: nil, right: nil, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 120, height: 100)
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        
        buttonFour.setAnchor(top: buttonThree.bottomAnchor, left: imageViewFour.rightAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 120, height: 100)
        buttonFour.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        imageViewOne.image = UIImage(named: "A1")
        imageViewTwo.image = UIImage(named: "A2")
        imagViewThree.image = UIImage(named: "A3")
        imageViewFour.image = UIImage(named: "A4")
        
        
        
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


