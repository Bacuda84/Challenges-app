//
//  RandomChallengesModel.swift
//  Challenges app
//
//  Created by Bakhtovar Akhmedov on 15.06.2023.
//

import Foundation

struct RandomChallenge {
    let string: String  //само действие
    var role: isLiked = .off
    
    enum isLiked {
        case on
        case off
    }
}



