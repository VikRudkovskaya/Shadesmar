//
//  Game.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 26/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

enum GameType: String, Decodable {
    case AliveNotAlive
    case EatableNotEatable
    case Unknown
}

class Game: Decodable {
    var type: GameType?
    var name: String?
}
