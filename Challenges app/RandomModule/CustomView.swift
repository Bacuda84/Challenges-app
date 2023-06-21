//
//  CustomView.swift
//  Challenges app
//
//  Created by Bakhtovar Akhmedov on 15.06.2023.
//

import UIKit

class CustomView: UIView {
    
    let textView = UITextView()
    let likeButton = UIButton()
    let dislikeButton = UIButton()
    var isLiked: RandomChallenge.isLiked = .off
    
    func setAllViews() {
        let frame = bounds
        let frameForTextView = CGRect(x: 10, y: 10, width: Int(frame.width)-20, height: Int(frame.height)-70)
        let frameForLikeButton = CGRect(x: 0,
                                        y: Int(frameForTextView.height + 6),
                                        width: Int(frame.width)/2,
                                        height: 40)
        let frameForDislikeButton = CGRect(x: Int(frameForLikeButton.width),
                                           y: Int(frameForTextView.height + 6),
                                           width: Int(frame.width)/2,
                                           height: 40)
        
        //addding-to-views
        textView.frame = frameForTextView
//
//        textView.backgroundColor = .red
//        likeButton.backgroundColor = .brown
//        dislikeButton.backgroundColor = .white
        
        likeButton.frame = frameForLikeButton
        dislikeButton.frame = frameForDislikeButton
        setTextView(string: "fads fsda")
        
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomRight, .bottomLeft], cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        layer.mask = maskLayer
        layer.borderColor = .some(.init(red: 0, green: 0, blue: 0, alpha: 1))
        backgroundColor = .init(red: 10/255, green: 99/255, blue: 56/255, alpha: 1)
        
        print(frame)
        
        //adding-to-subview
        addSubview(textView)
        addSubview(likeButton)
        addSubview(dislikeButton)
        
    }
    
    func initialize(challenge: RandomChallenge) {
        setAllViews()
        setTextView(string: challenge.string)
        setButtons()
        isLiked = challenge.role
    }
    
    func reloadData(challenge: RandomChallenge) {
        textView.text = challenge.string
        print(challenge.string)
        isLiked = challenge.role
    }
    
    func setTextView(string: String) {
        textView.text = string
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 30)
        textView.backgroundColor = .init(red: 243/255, green: 244/255, blue: 254/255, alpha: 1)
    }
    
    func setButtons() {
//        likeButton.imageView?.backgroundColor = .green
        likeButton.setImage(.init(systemName: "hand.thumbsup"), for: .normal)
        likeButton.tintColor = .green
        dislikeButton.tintColor = .red

        let image = UIImage.init(systemName: "hand.thumbsdown")
        let config = UIImage.SymbolConfiguration.init(pointSize: 0)
        dislikeButton.imageView?.preferredSymbolConfiguration = config
        dislikeButton.setImage(image, for: .normal)
        
        
        //setting tags
        likeButton.tag = 0
        dislikeButton.tag = 1
    }

}
