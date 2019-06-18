//
//  BeadProperty.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 17/06/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class BeadProperty: Decodable {
    var id: String?
    var nameKey: String?
    var name: String?
    var conjugatePropertyID: String?
    var conjugateProperty: BeadProperty?
    
     enum CodingKeys : String, CodingKey {
        case id
        case nameKey
        case conjugatePropertyID
    }
    
}
