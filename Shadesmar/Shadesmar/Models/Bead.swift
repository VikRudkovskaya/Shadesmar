//
//  Bead.swift
//  Shadesmar
//
//  Created by Viktoria Rudkovskaya on 04/04/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import Foundation

class Bead: Decodable {
    
    var id: String?
    
    var textureName: String?
    
    var title: String?
    
    var propertiesIDs: [String]?
    var properties: [BeadProperty]?
    
    enum CodingKeys : String, CodingKey {
        case id
        case textureName
        case title
        case propertiesIDs
    }
}
