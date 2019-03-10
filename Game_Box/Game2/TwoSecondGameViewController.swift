//
//  TwoSecondGameViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/8.
//  Copyright © 2019 柏呈. All rights reserved.
//

import UIKit

class TwoSecondGameViewController: UIViewController {
    var TwoSecondGameView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        TwoSecondGameView = UIView()
        self.view.addSubview(TwoSecondGameView)
        TwoSecondGameView.translatesAutoresizingMaskIntoConstraints = false
        TwoSecondGameView.backgroundColor = .white
        TwoSecondGameView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
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
        btnOne.setTitle("誰是胡瓜？", for: .normal)
        btnOne.setTitleColor(.black, for: .normal)
        btnOne.addTarget(self, action: #selector(alertButton(sender:)), for: .touchUpInside)
        return btnOne
    }()
    
    
    let buttonTwo: UIButton = {
        let btnTwo = UIButton()
        btnTwo.tintColor = .black
        btnTwo.setTitle("誰是胡瓜？", for: .normal)
        btnTwo.setTitleColor(.black, for: .normal)
        btnTwo.addTarget(self, action: #selector(pushtoThreePage), for: .touchUpInside)
        return btnTwo
    }()
    
    let buttonThree: UIButton = {
        let btnThree = UIButton()
        btnThree.tintColor = .black
        btnThree.setTitle("誰是胡瓜？", for: .normal)
        btnThree.setTitleColor(.black, for: .normal)
        btnThree.addTarget(self, action: #selector(alertButton(sender:)), for: .touchUpInside)
        return btnThree
        
    }()
    
    let buttonFour: UIButton = {
        let btnFour = UIButton()
        btnFour.tintColor = .black
        btnFour.setTitle("誰是胡瓜？", for: .normal)
        btnFour.setTitleColor(.black, for: .normal)
        btnFour.addTarget(self, action: #selector(alertButton(sender:)), for: .touchUpInside)
        return btnFour
    }()
    
    @objc func pushtoThreePage() {
        let vc = ThreeSecondGameViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func alertButton(sender: UIButton) {
        let alertController = UIAlertController(title: "錯錯錯", message: "可憐", preferredStyle: .alert)
        let tryAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(tryAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func GameTwoSetupAutoLayout() {
        TwoSecondGameView.addSubview(imageViewOne)
        TwoSecondGameView.addSubview(imageViewTwo)
        TwoSecondGameView.addSubview(imagViewThree)
        TwoSecondGameView.addSubview(imageViewFour)
        TwoSecondGameView.addSubview(buttonOne)
        TwoSecondGameView.addSubview(buttonTwo)
        TwoSecondGameView.addSubview(buttonThree)
        TwoSecondGameView.addSubview(buttonFour)
        
        imageViewOne.setAnchor(top: TwoSecondGameView.topAnchor, left: TwoSecondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 75 )
        imageViewOne.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        imageViewTwo.setAnchor(top: imageViewOne.bottomAnchor, left: TwoSecondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        imagViewThree.setAnchor(top: imageViewTwo.bottomAnchor, left: TwoSecondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 80, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 80)
        imagViewThree.translatesAutoresizingMaskIntoConstraints = false
        
        imageViewFour.setAnchor(top: imagViewThree.bottomAnchor, left: TwoSecondGameView.leftAnchor, bottom: nil, right: nil, paddingTop: 80, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 100, height: 80)
        imageViewFour.translatesAutoresizingMaskIntoConstraints = false
        
        buttonOne.setAnchor(top: TwoSecondGameView.topAnchor, left: imageViewOne.rightAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        
        buttonTwo.setAnchor(top: buttonOne.bottomAnchor, left: imageViewTwo.rightAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        
        buttonThree.setAnchor(top: buttonTwo.bottomAnchor, left: imagViewThree.rightAnchor  , bottom: nil, right: nil, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        
        buttonFour.setAnchor(top: buttonThree.bottomAnchor, left: imageViewFour.rightAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        buttonFour.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        imageViewOne.image = UIImage(named: "L1")
        imageViewTwo.image = UIImage(named: "L2")
        imagViewThree.image = UIImage(named: "L3")
        imageViewFour.image = UIImage(named: "L4")
        
        
        
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


