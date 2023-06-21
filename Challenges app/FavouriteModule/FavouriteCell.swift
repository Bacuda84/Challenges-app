//
//  FavouriteCell.swift
//  Challenges app
//
//  Created by Bakhtovar Akhmedov on 20.06.2023.
//

import UIKit

class FavouriteCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    public func initialize(text: String) {
        titleLabel.frame = frame
        titleLabel.textAlignment = .center
        selectionStyle = .none
        titleLabel.text = text
        titleLabel.font = .systemFont(ofSize: 25)
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
