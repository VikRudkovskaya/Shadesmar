//
//  BeadViewModel.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 10/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

struct BeadViewModel {
    
    var textureName: String {
        return bead.textureName ?? ""
    }
    
    let bead: Bead
    
    init(bead: Bead) {
        self.bead = bead
    }
}
