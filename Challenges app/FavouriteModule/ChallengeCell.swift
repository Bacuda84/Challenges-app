//
//  ChallengeCell.swift
//  Challenges app
//
//  Created by Bakhtovar Akhmedov on 17.06.2023.
//

import UIKit

class ChallengeCell: UITableViewCell {
    let textView = UITextView()
    
    
    public func initialize(text: String) {
        textView.text = text
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 21)
        selectionStyle = .none
        textView.isSelectable = false
        textView.indicatorStyle = UIScrollView.IndicatorStyle.white
        //edeting background
        backgroundColor = .init(red: 243/255, green: 244/255, blue: 254/255, alpha: 1)
        
        //setting frame
        let frame = CGRect(x: 10, y: 10,
                           width: frame.width-20,
                           height: frame.height-20)
        
        textView.layer.cornerRadius = 15
        
        textView.frame = frame        
        textView.textAlignment = .natural
        
        //adding
        addSubview(textView)
        
        //settings for cell
        }
    let titleLabel = UILabel()
    
    public func initializeTitleFor(vc text: String) {  //нужен чтобы сделать // авфыафа вфаорфвылдадфывра
        titleLabel.frame = frame
        print(frame)
        titleLabel.textAlignment = .center
        titleLabel.text = text
        titleLabel.font = .systemFont(ofSize: 30)
        //adding to view
        addSubview(titleLabel)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
