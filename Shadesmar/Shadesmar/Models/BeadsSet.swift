//
//  Bucket.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 02/05/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class BeadsSet: Decodable {
    
    var id: String?
    var name: String?
    
    var beadIds: [String]?
    var beads: [Bead]?
    
}
