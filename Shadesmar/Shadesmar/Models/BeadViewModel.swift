//
//  BeadViewModel.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

struct BeadViewModel {

    var title: String {
        return bead.title ?? ""
    }
    
    var textureName: String {
        return bead.textureName ?? ""
    }
    
    var isAlive: Bool {
        return bead.isAlive ?? false
    }
    
    let bead: Bead
    
    init(bead: Bead) {
        self.bead = bead
    }
}
