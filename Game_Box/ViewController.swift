//
//  ViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/5.
//  Copyright © 2019 柏呈. All rights reserved.
//

import UIKit



protocol GamePushNextPage: class {
    func homepageToGame()
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let myGamePictureArray = [Info(image: "icons8-ghost", title: "FirstGame"),
                              Info(image: "icons8-lyre", title: "SecondGame"),
                              Info(image: "icons8-robot_2", title: "ThirdGame")
    ]
    
    let cellID = "CellID"
    
    var myTableView: UITableView = {
        let tableView =  UITableView()
        tableView.separatorStyle = .none
//        tableView.allowsSelection = false
        return tableView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setuptableView()
        
    }
    
    func setNavigationBar() {
        navigationItem.title = "GameBOX"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 255, blue: 198, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    func setuptableView() {
        
        myTableView.frame = view.frame
        myTableView.register(customCell.self, forCellReuseIdentifier: cellID)
        myTableView.delegate = self
        myTableView.dataSource = self
        
        view.addSubview(myTableView)
        myTableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGamePictureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! customCell
        cell.pictureImageView.image = UIImage(named: myGamePictureArray[indexPath.item].image!)
        cell.titleLabel.text = myGamePictureArray[indexPath.item].title
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  80
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Game"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    
}

extension ViewController:GamePushNextPage {
    func homepageToGame() {
        let vc = FirstGameViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


class customCell: UITableViewCell {
    
    weak var delegate: GamePushNextPage?
    
    // 我的cellView
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.setCellShadow()
        return view
    }()
    // 我的圖片
    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    // 我的標題
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()
    // 我的按鈕
    let FirstGameEntryButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = .black
        button.tintColor = .white
        button.setTitle("PLAY", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    @objc func pushToFirstGame() {
        
        delegate?.homepageToGame()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 設定約束條件
    func setup() {
        contentView.isUserInteractionEnabled = false
        backgroundColor = UIColor(r: 245, g: 245, b: 245)
        addSubview(cellView)
        cellView.addSubview(pictureImageView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(FirstGameEntryButton)
        
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
        pictureImageView.setAnchor(top: nil, left: cellView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        titleLabel.setAnchor(top: nil, left: pictureImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, height: 40)
        titleLabel.centerYAnchor.constraint(equalTo: pictureImageView.centerYAnchor).isActive = true
        FirstGameEntryButton.setAnchor(top: nil, left: titleLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 50, paddingBottom: 0, paddingRight: 20, width: 45, height: 45)
        FirstGameEntryButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        FirstGameEntryButton.addTarget(self, action: #selector(pushToFirstGame), for: .touchUpInside)
    }
}

