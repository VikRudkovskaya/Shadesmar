//
//  GameStateHolder.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 13/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class GameStateHolder {
    
    static let shared = GameStateHolder()
    
    var displaingBeads: [BeadViewModel] = []
}
