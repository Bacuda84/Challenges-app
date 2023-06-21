//
//  ViewController.swift
//  Challenges app
//
//  Created by Bakhtovar Akhmedov on 15.06.2023.
//

import UIKit

class RandomViewController: UIViewController {
    
    var randomData = [RandomChallenge]()
    let customView = CustomView()
    let nextButton = UIButton()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavItem()
        setButtonActions()
        setCustomView()
        setNextButton()
    }
    
    //fileprivate func's
    fileprivate func setNextButton() {
        nextButton.frame = CGRect(x: customView.frame.minX, y: customView.frame.maxY + 10, width: customView.frame.width, height: 40)
        nextButton.setTitle("Новое задание", for: .normal)
        nextButton.backgroundColor = .red
        nextButton.layer.cornerRadius = 10
        nextButton.addTarget(self, action: #selector(setNextChallenge), for: .touchUpInside)
        
        //adding-to-view
        view.addSubview(nextButton)
    }
    //target for 'next' button
    @objc func setNextChallenge() {
        index += 1
        if (index+1) > randomData.count {
            print(index)
            index = 0
        }
        customView.reloadData(challenge: randomData[index])
    }
    
    fileprivate func setCustomView() {
        let frame = view.frame
        customView.frame = CGRect(x: 30, y: 90, width: frame.width-60, height: frame.height-300)
        customView.initialize(challenge: randomData[0])
        //buttons
        view.addSubview(customView)
    }
    
    fileprivate func setButtonActions() {
        randomData = UserDefaultsData.setRandomData()
        customView.likeButton.addTarget(self, action: #selector(changeRole), for: .touchUpInside)
        customView.dislikeButton.addTarget(self, action: #selector(changeRole), for: .touchUpInside)
    }
    
    @objc func changeRole(button: UIButton) {
        if button.tag == 0 {
            customView.isLiked = .on
            print("green")
        } else if button.tag == 1 {
            customView.isLiked = .off
            print("red")
        }
        print(index)
        randomData[index].role = customView.isLiked
        
        print(customView.isLiked, "custom")
        print(randomData[index].role)
        setNewDataToUserDefaults()
    }
    
    func setNewDataToUserDefaults() {//чтобы сохранять на диске
        
        var dataIndexs = [Int]()
        for (index, data) in randomData.enumerated() {
            if data.role == .on {
                dataIndexs.append(index)
            }
        }
        
        UserDefaultsData.reloadData(newIndex: dataIndexs)
    }
    
    func setNavItem() {
        tabBarItem.image = UIImage(systemName: "house")
    }
}

