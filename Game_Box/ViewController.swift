//
//  ViewController.swift
//  Game_Box
//
//  Created by 柏呈 on 2019/3/5.
//  Copyright © 2019 柏呈. All rights reserved.
//

import UIKit



protocol GamePushNextPage: class {
    func homepageToGame(indexPath: IndexPath)
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    /// <#Description#>
    let myGamePictureArray = [Info(image: "icons8-ghost", title: "我是拉霸"),
                              Info(image: "icons8-lyre", title: "你猜猜啊"),
                              Info(image: "icons8-robot_2", title: "終極密碼")
    ]
    
    let cellID = "CellID"
    
    var myTableView: UITableView = {
        let tableView =  UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptableView()
        setNavigationBar(title: "GameBox")
        
        
    }
    
    func setNavigationBar(title:String) {
        navigationItem.title = title
        
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
        cell.indexPath = indexPath
        
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
/// commit + optional + / (高亮it)
protocol Gameable {
    
}
extension FirstGameViewController: Gameable {
    
}
extension SecondGameViewController: Gameable {
    
}

extension ThirdGameViewController: Gameable {
    
}

extension ViewController:GamePushNextPage {
    
    func homepageToGame(indexPath: IndexPath) {
        var game:Gameable?
        switch indexPath.row {
        case 0:
            game = FirstGameViewController()
            setNavigationBar(title: "我是拉霸")
            
        case 1:
            game = SecondGameViewController()
            setNavigationBar(title: "你猜猜啊")
        case 2:
            game = ThirdGameViewController()
            setNavigationBar(title: "終極密碼")
        default:
            break
        }
        
        guard  let gameVC = game,
            let vc = gameVC as? UIViewController else { return  }
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}


//FIXME: asd
//TODO: 123123
//MARK: 132



class customCell: UITableViewCell {
    
    weak var delegate: GamePushNextPage?
    
    var indexPath: IndexPath?
    
   
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.setCellShadow()
        return view
    }()
    
    let pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        return label
    }()
  
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
    
    @objc func pushToGame() {
        
        delegate?.homepageToGame(indexPath: indexPath!)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    func setup() {
        
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
        FirstGameEntryButton.addTarget(self, action: #selector(pushToGame), for: .touchUpInside)
        FirstGameEntryButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
    }
}

